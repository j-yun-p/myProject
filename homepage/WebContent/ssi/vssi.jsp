<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="vip.VipDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.Utility" %>
<jsp:useBean id="dao" class="vip.VipDAO"/>

<%

	String root = request.getContextPath();
	request.setCharacterEncoding("utf-8");

	List<VipDTO> list = null;
	Iterator<VipDTO> iter = null;
	
	boolean flag = false;


%>