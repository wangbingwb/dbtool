package ${basePackage}.action.control;

import ${basePackage}.framework.base.Screen;
import org.springframework.ui.Model;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Index extends Screen {

    @Override
    public void exec(Model model, HttpServletRequest request, HttpServletResponse response) {

        model.addAttribute("hello", "Hello world!!!");
        model.addAttribute("status", 0);

        ArrayList<String> citys = new ArrayList<>();
        citys.add("北京");
        citys.add("上海");
        citys.add("深圳");
        model.addAttribute("citys", citys);
    }
}
