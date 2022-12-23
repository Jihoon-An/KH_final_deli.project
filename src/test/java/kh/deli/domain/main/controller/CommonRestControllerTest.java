package kh.deli.domain.main.controller;

import com.google.gson.Gson;
import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

//@SpringBootTest
//@RunWith(SpringRunner.class)
//@WebMvcTest(MailRestController.class)
class CommonRestControllerTest {

//    @Autowired
//    private MockMvc mvc;

    @Test
    void timeTest() throws ParseException {

        Gson gson = new Gson();
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);

        System.out.println(list.toString());
    }
}