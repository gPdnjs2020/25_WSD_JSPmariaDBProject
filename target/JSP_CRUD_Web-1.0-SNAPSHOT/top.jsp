<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
