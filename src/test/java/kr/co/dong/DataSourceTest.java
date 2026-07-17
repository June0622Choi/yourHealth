// 1. package 선언
package kr.co.dong;

// 2. import 문들
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// 3. 클래스와 애노테이션
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DataSourceTest {
	
	// 4. DataSource 선언
	@Autowired
	private DataSource dataSource;
	
	// 5. 테스트 메서드
	@Test
	public void testConn() {
		try {
			Connection conn = dataSource.getConnection();
			System.out.println(conn);
			System.out.println("연결 성공!!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}