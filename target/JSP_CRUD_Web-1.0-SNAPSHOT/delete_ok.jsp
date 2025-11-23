<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.dao.BoardDAO" %>
<%@ page import="org.example.bean.BoardVO" %>

<%
  String seqStr = request.getParameter("id");
  if (seqStr != null) {
    int seq = Integer.parseInt(seqStr);
    BoardDAO boardDAO = new BoardDAO();
    BoardVO vo = new BoardVO();
    vo.setId(seq);
    boardDAO.deleteBoard(vo);
  }

  response.sendRedirect("list.jsp");
%>
