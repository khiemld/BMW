package com.bookstore.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@WebFilter(filterName = "HeaderFilter")
public class HeaderFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        // Set the desired headers
        httpServletResponse.setHeader("X-Content-Type-Options", "nosniff");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Clean-up code, if needed
    }

}
