package add.config;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import add.bus_api.Bus_Api;
import add.ic.Ic;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "add.controller", "add.movie.controller", "add.bus.controller", "add.trip.controller", "add.real.controller", "add.config", "add.movie", "add.trip", "add.ic", "add.bus_api", "add.real" })
@MapperScan(basePackages = { "add.maps", "add.bus_annomaps", "add.movie.maps" })
public class MvcConfig extends WebMvcConfigurerAdapter {

	static HikariConfig config = new HikariConfig();
	static HikariDataSource ds;
	static SqlSessionFactoryBean sqlSessionFactory;
	static {
		config.setJdbcUrl("jdbc:oracle:thin:@10.0.0.53:1521:orcl");
		config.setDriverClassName("oracle.jdbc.OracleDriver");
		config.setUsername("jun");
		config.setPassword("1234");
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
		ds = new HikariDataSource(config);

	}

	@Bean(name = "con")
	public Connection connection() throws SQLException {
		return ds.getConnection();
	}

	@Bean(name = "sqlsession")
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(ds);
		sqlSessionFactory.setTypeAliasesPackage("add.maps");
		sqlSessionFactory.setTypeAliasesPackage("add.movie.maps");
		sqlSessionFactory.setTypeAliasesPackage("add.bus_annomaps");
		return (SqlSessionFactory) sqlSessionFactory.getObject();
	}

	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(ds);
	}

	/**
	 * Configure TilesConfigurer.
	 */
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] { "/WEB-INF/views/**/tiles.xml" });
		tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}
	
	/**
	 * Configure ViewResolvers to deliver preferred views.
	 */
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		TilesViewResolver viewResolver = new TilesViewResolver();
		registry.viewResolver(viewResolver);
	}

	/**
	 * Configure ResourceHandlers to serve static resources like CSS/ Javascript
	 * etc...
	 */
	
	
	// CSS/ JS/ IMG 경로 지정
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("/static/");
	}
	
	// Interceptor 경로 지정
	 @Override
    public void addInterceptors(InterceptorRegistry registry) {
		 registry.addInterceptor(new Ic()).addPathPatterns("/movie/**").addPathPatterns("/bus/**").addPathPatterns("/real/**");
    }
	 

}
