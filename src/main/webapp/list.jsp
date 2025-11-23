<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="org.example.dao.BoardDAO, org.example.bean.BoardVO,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String search = request.getParameter("search");
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list;
    if (search != null && !search.trim().isEmpty()) {
        list = boardDAO.searchBoardList(search);
    } else {
        list = boardDAO.getBoardList();
    }
    request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
    <title>자유게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          crossorigin="anonymous">
    <style>
        body {
            background: #f8f9fa;
        }
        .board-container {
            max-width: 950px;
            margin: 32px auto;
            padding: 32px 28px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 2px 12px #ccc;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn {
            min-width: 60px;
        }
        .table thead {
            background: #222;
            color: #fff;
        }
        h1 {
            margin-bottom: 24px;
        }
    </style>
</head>
<body>
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
</body>
</html>