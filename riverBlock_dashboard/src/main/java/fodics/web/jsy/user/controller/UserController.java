package fodics.web.jsy.user.controller;

import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fodics.web.jsy.user.model.dto.User;


@SessionAttributes({"loginUser"}) 
@Controller
public class UserController {
	
	
	private final RestTemplate restTemplate;

	   @Autowired
	   public UserController(RestTemplate restTemplate) {
	      this.restTemplate = restTemplate;
	   }
	   
		
		@GetMapping("/")
		public String login() {
			return "login";
		}
		
		
		

		// 회원 로그인
		@PostMapping("/userLogin")
		public String userLogin(
								@RequestParam(value = "inputIP", required = false) String inputIP
								,@RequestParam(value = "inputPORT", required = false) Integer inputPORT
								, String user_id
								, String user_pw
								, Model model, HttpServletResponse resp
								, RedirectAttributes ra
								, @RequestHeader(value = "referer") String referer

								) {
			
//			System.out.println("serverip : " + serverip );
//			System.out.println("port : " + port );
//			System.out.println("user_id : " + user_id );
//			System.out.println("user_pw : " + user_pw );
			
			
	        // User 객체 생성 및 설정
	        User user = new User();
	        user.setPort(inputPORT);
	        user.setServerip(inputIP);
	        user.setUser_id(user_id);
	        user.setUser_pw(user_pw);
	        
	        // User 객체를 모델에 추가
	        model.addAttribute("user", user);
	        
	        
			String infoAddress;
			String infoPort;

			// MappingJackson2HttpMessageConverter 추가
			restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

			try {
				InputStream is = getClass().getResourceAsStream("/loginServer_info.ini");
				Scanner s = new Scanner(is);
				infoAddress = s.nextLine();
				infoPort = s.nextLine();
//				  System.out.println("userLogin infoAddress : "+ infoAddress);
//				  System.out.println("userLogin infoPort : "+ infoPort);
				s.close();
				is.close();
			
		    
//		        String url = "http://172.16.103.34:8988/fnvr/request/query/select"; // 외부 RESTful API의 URL select
			    String login_url = "http://" + infoAddress + ":" + infoPort+"/fnvr/request/login"; // 외부 RESTful API의 URL execute
//				System.out.println("login_url : "+ login_url);
				
			    
			    //서버로 전송할 객체 생성
		       Map<String, Object> login_requestBody = new LinkedHashMap<>();
		       login_requestBody.put("port", user.getPort());
		       login_requestBody.put("serverip", user.getServerip());
		       login_requestBody.put("user_id", user.getUser_id());
		       login_requestBody.put("user_pw", user.getUser_pw());
//		       System.out.println("requestBody : "+ login_requestBody);

	             // 요청 헤더 설정
		       HttpHeaders headers = new HttpHeaders();
		       headers.setContentType(MediaType.APPLICATION_JSON);

		       // HttpEntity 생성
		       HttpEntity<Map<String, Object>> login_requestEntity = new HttpEntity<>(login_requestBody, headers);
//		       System.out.print("login requestEntity"+ login_requestEntity);

		       // post 요청 보내기
		       String login_resp = restTemplate.postForObject(login_url, login_requestEntity, String.class);
	   
//		       System.out.print("login_resp"+ login_resp);
		       
		       JSONObject jsonObj = new JSONObject(login_resp);

		       // res_code 값 확인
		       int resCode = jsonObj.getInt("res_code");
		       
		       Map<String, Object> loginUser = new LinkedHashMap<>();
		       loginUser.put("port", user.getPort());
		       loginUser.put("serverip", user.getServerip());
		       loginUser.put("user_id", user.getUser_id());
		       loginUser.put("user_pw", user.getUser_pw());
//		       System.out.println("loginUser : "+ loginUser);


		       
		       String path = "redirect:";
				
		       // login_resp의 응답이 ok일 때로 조건 변경해야 함
				if(resCode == 200) {
					
				
					path += "/main";
					model.addAttribute("loginUser", loginUser); // 로그인 유저 정보
//					System.out.print("model"+ model);
					
					
					// Cookie 생성 및 설정
					String cookieValue = "serverip=" + user.getServerip() +
				                        "&port=" + user.getPort() +
				                        "&user_id=" + user.getUser_id() +
				                        "&user_pw=" + user.getUser_pw();
	   
					Cookie cookie = new Cookie("userDetails", cookieValue);

					if(cookieValue != null) {
						cookie.setMaxAge(60*60*24*30);
					} 
					ra.addFlashAttribute("message", "환영합니다.");
					cookie.setPath("/main");
					resp.addCookie(cookie);
				}
				else{
					ra.addFlashAttribute("message", "입력정보를 확인해주세요.");
					path += "/";
				}
				
				return path;
		           
			} catch (Exception e) {
				String path = "redirect:";
				ra.addFlashAttribute("message", "입력정보를 확인해주세요.");
				path += "/";
				e.printStackTrace();
				return path; // 예외가 발생하면 빈 문자열을 반환하도록 수정
			}
		}
		


}
