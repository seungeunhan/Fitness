package hanSeungEun;
//접근 권한, 로그인/비번 일치와 관련된 2가지 변수를 반환하기 위해 작성
public class LoginResult {
	 private int mode;
	    private int authority;
	    
	    public int getMode() {
	        return mode;
	    }
	    
	    public void setMode(int mode) {
	        this.mode = mode;
	    }
	    
	    public int getAuthority() {
	        return authority;
	    }
	    
	    public void setAuthority(int authority) {
	        this.authority = authority;
	    }
}
