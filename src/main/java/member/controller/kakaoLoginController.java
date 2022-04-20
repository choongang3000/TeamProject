package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class kakaoLoginController {
	private final String command = "/auth/kakao/callback";
	
	@RequestMapping(value =command, method = RequestMethod.GET)
	public @ResponseBody String kakaoCallback() {
		return "카카오 인증 완료";
	}
}
