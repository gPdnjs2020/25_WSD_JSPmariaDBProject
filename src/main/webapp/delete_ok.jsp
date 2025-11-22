<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.dao.BoardDAO" %>
<%@ page import="org.example.bean.BoardVO" %>

<%
  String seqStr = request.getParameter("id");       // URL의 ?id=값 받아옴
  if (seqStr != null) {
    int seq = Integer.parseInt(seqStr);           // id 값을 정수로 변환
    BoardDAO boardDAO = new BoardDAO();
    BoardVO vo = new BoardVO();                   // BoardVO가 기본 생성자 있어야 함
    vo.setid(seq);                                // 삭제할 게시글 id 세팅
    boardDAO.deleteBoard(vo);                     // DAO에서 삭제 처리
  }
  // 삭제 작업 후 목록 페이지로 이동
  response.sendRedirect("list.jsp");
%>
