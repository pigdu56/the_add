package add.controller;

import java.io.PrintWriter;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import add.maps.AES256Util;
import add.maps.TestMappable;

@org.springframework.stereotype.Controller
@RequestMapping("member")
public class LoginController {
	
	@Autowired
	TestMappable testMappable;

	private static String RSA_WEB_KEY = "_RSA_WEB_Key_"; // 개인키 session key
	private static String RSA_INSTANCE = "RSA"; // rsa transformation

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest rq, HttpServletResponse res) 
			throws Exception {
		
		String userId = (String) rq.getParameter("USER_ID");
		String userPw = (String) rq.getParameter("USER_PW");
		
		//System.out.printf("암호화 id = '%s' \n" + "암호화 pw = '%s' \n", userId, userPw);
		
		HttpSession session = rq.getSession();
		PrivateKey privateKey = 
				(PrivateKey) session.getAttribute(LoginController.RSA_WEB_KEY);

		// 복호화
		userId = decryptRsa(privateKey, userId);
		userPw = decryptRsa(privateKey, userPw);
		
		//System.out.printf("복호화 id = '%s' \n" + "복호화 pw = '%s' \n", userId, userPw);

		// 개인키 삭제
		session.removeAttribute(LoginController.RSA_WEB_KEY);

		
		// 암호화를 위한 키 생성
		String key = "aes256_test_key!!";
		AES256Util aes256 = new AES256Util(key);
		// 비밀번호 암호화
		userPw = aes256.encrypt(userPw);
		
		//System.out.printf("AES256 방식 암호화 pw = '%s' \n", userPw);
		
		// 로그인 처리
			if (userId.equals(testMappable.idSearch(userId))) {
				if(userPw.equals(testMappable.pwdSearch(userId, userPw))) {
					session = rq.getSession();
					session.setAttribute("LoginUser", userId);
					session.setAttribute("LoginNum", testMappable.M_code(userId));
					return "home";
				} else {
					System.out.println("패스워드 불일치");
					res.setContentType("text/html; charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.println("<script>alert('비밀번호를 확인해주세요.');");
					out.println("location.href='/the_add/login';</script>");
					out.flush();
				}
			} else {
				System.out.println("아이디 불일치");
			}
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('아이디를 확인해주세요.');");
		out.println("location.href='/the_add/member/login';</script>");
		out.flush();
		
		return null;
		
	}

	/**
	 * 복호화
	 * 
	 * @param privateKey
	 * @param securedValue
	 * @return
	 * @throws Exception
	 */
	private String decryptRsa(@Param("privateKey") PrivateKey privateKey, 
			@Param("securedValue") String securedValue) throws Exception {
		Cipher cipher = Cipher.getInstance(LoginController.RSA_INSTANCE);
		byte[] encryptedBytes = hexToByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decryptedValue = new String(decryptedBytes, "UTF-8"); // 문자 인코딩 주의
		return decryptedValue;
	}

	/**
	 * 16진 문자열을 byte 배열로 변환한다.
	 * 
	 * @param hex
	 * @return
	 */
	public static byte[] hexToByteArray(@Param("hex") String hex) {
		if (hex == null || hex.length() % 2 != 0) {
			return new byte[] {};
		}

		byte[] bytes = new byte[hex.length() / 2];
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		return bytes;
	}

	/**
	 * rsa 공개키, 개인키 생성
	 * 
	 * @param request
	 */
	public static void initRsa(HttpServletRequest request) {
		HttpSession session = request.getSession();

		KeyPairGenerator generator;
		try {
			generator = KeyPairGenerator.getInstance(LoginController.RSA_INSTANCE);
			generator.initialize(1024);

			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance(LoginController.RSA_INSTANCE);
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
			
			// session에 RSA 개인키를 세션에 저장
			session.setAttribute(LoginController.RSA_WEB_KEY, privateKey); 

			RSAPublicKeySpec publicSpec = 
					(RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			
			// rsa modulus 를 request 에 추가
			request.setAttribute("RSAModulus", publicKeyModulus); 
			// rsa exponent 를 request 에 추가
			request.setAttribute("RSAExponent", publicKeyExponent); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
