package utility;
 
import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
public class AdminLoginCheckFilter implements Filter {
 
    public void init(FilterConfig arg0) throws ServletException {
    }
 
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException {
    	//FilterChain : filter가 여러개일때 다음 filter를 가리킴
    	
        // Filter가 요청 중간에서 request 객체를 추출합니다. (admin의 list.jsp를 요청했을 때 생기는 요청객체 HttpServletRequest)
        HttpServletRequest httpRequest = (HttpServletRequest)request;
 
        // 새로운 세션을 생성하지않고 request 객체에서 기존의 세션 반환  (요청했을 때 생기는 세션객체)
        HttpSession session = httpRequest.getSession(false);
        
        // 로그인 하지 않았다고 가정
        boolean login = false;
        
        if (session != null) { // session 객체가 생성되어 있는지 확인
            // 로그인을 했으면서 관리자인지 확인합니다.
            if (session.getAttribute("id") != null  //널이면 로그인이 안됌
                    && session.getAttribute("grade").equals("A")) {
                login = true;  // 관리자라면
            }
        }
        
        // 정상적으로 로그인이 되었다면 요청 페이지로 이동합니다.
        if (login) {
            chain.doFilter(request, response); //요청 페이지로 이동 (admin의 list.jsp)
        } else {
            // 로그인이 안되었다면 로그인 페이지로 이동 (forward action) 권한이 없기때문에
            RequestDispatcher dispatcher = request.getRequestDispatcher("/join/loginForm.jsp");
            dispatcher.forward(request, response);
        }
    }
 
    public void destroy() { //아무것도 안하지만 오버라이딩, 인터페이스이기때문에
    }
}