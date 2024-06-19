package fodics.web.jsy.user.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class User {
	
	private String serverip;
	private int port;
	private String user_id;
	private String user_pw;

}
