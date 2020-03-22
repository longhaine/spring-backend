package com.backend.security;

import java.io.IOException;

import javax.naming.AuthenticationException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.filter.OncePerRequestFilter;

import com.backend.service.UserService;


public class JwtAuthorizationFilter extends OncePerRequestFilter{
	
	@Autowired
	private JwtProvider jwtProvider;
	@Autowired
	private UserService userService;
	
	private final String[] pathShouldIgnore = {"/img","/permit","/user/login","/user/signup","/user/reset-password"};
	
	@Override
	protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain filterChain)
			throws ServletException, IOException {
		try {
			String authorization = req.getHeader("Authorization");
			if(authorization != null && authorization.length() > 0) 
			{
				String token = req.getHeader("Authorization").replace("Bearer ",""); // if there is no token it will throw ex null
				if(token != null && jwtProvider.validateToken(token)) {
					String email = jwtProvider.getEmailFromToken(token);
					CustomUserDetails user = new CustomUserDetails(userService.getUser(email));
					userService.authorize(user);
					filterChain.doFilter(req, res);
				}
			}// to avoid 401 authorize at /cart paths
			else if((authorization == null && req.getServletPath().contains("/cart")) || (authorization.length() == 0 && req.getServletPath().contains("/cart")))
			{
				filterChain.doFilter(req, res);
			}
			else {
				throw new AuthenticationException("Full authentication is required to access this resource");
			}
		}
		catch(Exception ex) {
			System.out.println(ex);
			System.out.println(ex.getMessage());
			// the exceptions couldn't be handled by controller advice so this is the solution
			res.sendError(403,ex.getMessage());
		}
	}
	@Override
	protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
		int length = pathShouldIgnore.length;
		String path = request.getServletPath();
		for(int i = 0 ; i < length ; i++) {
			if(path.contains(pathShouldIgnore[i])) {
				return true;
			}
		}
		return false;
	}

}
