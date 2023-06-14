package win.zhangzhixing.api.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/base")
public class BaseController {
    @GetMapping()
    public String base() {
        return "base";
    }
}
