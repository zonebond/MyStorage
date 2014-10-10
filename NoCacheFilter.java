package com.skyform.admin.controller;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zonebond on 2014/10/10.
 */
public class NoCacheFilter implements Filter
{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        //设置禁止缓存的消息头
        ((HttpServletResponse)response).setHeader("Pragma","No-cache");
        ((HttpServletResponse)response).setHeader("Cache-Control","no-cache");
        ((HttpServletResponse)response).setHeader("Expires","0");//禁止缓存

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
