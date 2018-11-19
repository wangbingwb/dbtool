package ${basePackage}.framework.base;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Control {
    public abstract void exec(Model model, HttpServletRequest request, HttpServletResponse response);
}