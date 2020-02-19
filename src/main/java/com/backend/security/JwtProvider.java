package com.backend.security;



import java.util.Date;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtProvider {
	private final String secretKey = "everlane";
	private final long expiration = 10*86400*1000L;
	
	public String generateToken(String email) {
		Date now = new Date();
		Date expiryDate = new Date(now.getTime()+expiration);
		return Jwts.builder().setSubject(email)
							.setIssuedAt(now)
							.setExpiration(expiryDate)
							.signWith(SignatureAlgorithm.HS512,secretKey)
							.compact();
	}
	public String getEmailFromToken(String token) {
		Claims claims = Jwts.parser().setSigningKey(secretKey)
									.parseClaimsJws(token)
									.getBody();
		return claims.getSubject();
	}
	public boolean validateToken(String token) {
		try {
			Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
			return true;
		}catch(JwtException ex) {
			System.out.println(ex.getClass());
			System.out.println(ex.getMessage());
			throw ex;
		}
	}
}
