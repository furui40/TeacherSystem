import com.example.utils.MailUtil;
import org.junit.Test;

public class MailTest {
    @Test
    public void test1() {
        MailUtil.sendEmail("729919744@qq.com", "", 0);
    }
}