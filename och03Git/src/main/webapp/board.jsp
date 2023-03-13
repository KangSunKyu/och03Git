<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board Servlet 변환 PGM</title>
</head>
<body>
	<h1>board Servlet 변환 PGM</h1>
	<%
		// 스크립트릿(Scriptlet) --> JAVA Coding 가능
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		// Current Date
		Date date = new Date();
		//-----------------------------------------------
		//---------		1. 파일 저장 		-----------------
		//-----------------------------------------------
		long fileName = date.getTime();
		// get RealPath --> Tomcat Metadate File 저장
		String real = application.getRealPath("/WEB-INF/out/"+fileName+".txt");
		System.out.println("Add3 sum->"+real);
		// File 저장할 수 있는 객체
		FileWriter fw = new FileWriter(real);
		// File 내용
		String msg = "제목 : " + title + "\r\n";
		msg += "작성자 : " + writer + "\r\n";
		msg += "내용 : " + content + "\r\n";
		fw.write(msg);
		fw.close();
		//-----------------------------------------------
		//---------		2. 화면 출력 1		-----------------
		//-----------------------------------------------
		out.println("제목1 : " + title + "<p>");
		out.println("작성자1 : " + writer + "<p>");	
		out.println("작성일1 : " + date + "<p>");	
		out.println("내용1 : " + content + "<p>");	
	
	%>
	<!--  화면 출력 2 -->
		제목2 :<%=title %><p>
		작성자2 :<%=writer %><p>
		작성일2 :<%=date %><p>
		내용2 :<%=content %><p>
		
</body>
</html>