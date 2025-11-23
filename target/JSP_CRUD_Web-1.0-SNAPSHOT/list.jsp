<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="org.example.dao.BoardDAO, org.example.bean.BoardVO,java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="top.jsp" %>

<%
    String search = request.getParameter("search");
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list;
    if (search != null && !search.trim().isEmpty()) {
        try {
            list = boardDAO.searchBoardList(search);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } else {
        try {
            list = boardDAO.getBoardList();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    request.setAttribute("list", list);
%>

<div class="board-container">
    <h1 class="text-center fw-bold mb-4">자유게시판</h1>
    <form action="list.jsp" method="get" class="mb-3 d-flex">
        <input type="text" name="search" class="form-control me-2" placeholder="검색어를 입력하세요"
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
        <button type="submit" class="btn btn-secondary rounded-pill">검색</button>
    </form>
    <div class="text-end mb-3">
        <a href="write.jsp" class="btn btn-primary rounded-pill">Add New Post</a>
    </div>
    <table class="table table-hover table-bordered align-middle">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Title</th>
            <th scope="col">Writer</th>
            <th scope="col">Content</th>
            <th scope="col">Regdate</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.id}</td>
                <td class="fw-bold">${u.title}</td>
                <td>${u.writer}</td>
                <td><span class="text-secondary">${u.content}</span></td>
                <td>${u.regdate}</td>
                <td>
                    <a href="edit.jsp?id=${u.id}" class="btn btn-outline-primary btn-sm rounded-pill">Edit</a>
                </td>
                <td>
                    <a href="delete_ok.jsp?id=${u.id}" class="btn btn-outline-danger btn-sm rounded-pill">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="bottom.jsp" />
