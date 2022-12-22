package kh.deli.domain.main.controller;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//@SpringBootTest
//@RunWith(SpringRunner.class)
//@WebMvcTest(MailRestController.class)
class CommonRestControllerTest {

//    @Autowired
//    private MockMvc mvc;

    @Test
    void timeTest() throws ParseException {

        Logger log = LoggerFactory.getLogger(CommonRestControllerTest.class);

        String timeJson = "9:48";

        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");

        Date now = new Date(System.currentTimeMillis());
        Date time = formatter.parse(timeJson);

        List<String> weekList = List.of("sun", "mon", "tue", "wed", "thu", "fri", "sat");

        System.out.println(weekList);
    }
}