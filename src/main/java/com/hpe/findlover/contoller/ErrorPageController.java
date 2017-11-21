package com.hpe.findlover.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageController {
	@RequestMapping("403")
	public String unauthorized(){
		return "error/403";
	}
}
