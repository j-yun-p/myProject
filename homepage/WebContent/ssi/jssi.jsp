<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="join.JoinDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>


<jsp:useBean id="dao" class="join.JoinDAO"/>

<%

	String root = request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	List<JoinDTO> list = null;
	Iterator<JoinDTO> iter = null;
	
	boolean flag = false;
	
	String upDir = application.getRealPath("/join/storage");
	String tempDir = application.getRealPath("/join/temp");

%>
