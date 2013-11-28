package viking;

import java.sql.Timestamp;
import java.util.Date;

import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.seaport.dao.RoleDAO;
import com.seaport.dao.UserDAO;
import com.seaport.domain.Role;
import com.seaport.domain.User;
import com.seaport.init.RootConfig;


public class DumbDbTest {

	@Test
	public void testCyrillic() throws Exception {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
//		SessionFactory session = context.getBean(SessionFactory.class);
		UserDAO userDAO = context.getBean(UserDAO.class);
		RoleDAO roleDAO = context.getBean(RoleDAO.class);
		Role r = roleDAO.getRole(1);
		User testUser = new User();
		testUser.setFirstName("Йцукенг");
		testUser.setUserEmail("a@b.c");
		testUser.setRole(r);
		Timestamp updateDate = new Timestamp(new Date().getTime());
		testUser.setCreateDate(updateDate);
		testUser.setUpdateDate(updateDate);
		testUser.setLogin(testUser.getUserEmail());

		userDAO.saveUser(testUser);
	}
}
