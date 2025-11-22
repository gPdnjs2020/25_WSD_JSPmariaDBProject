<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 11. 21.
  Time: 오후 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          crossorigin="anonymous">
    <style>
        body {
            background: #f8f9fa;
        }

        .write-card {
            max-width: 600px;
            margin: 40px auto;
            padding: 36px 36px 28px 36px;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 14px #ccc;
        }

        h1 {
            margin-bottom: 24px;
        }
    </style>
</head>
<body>
<div class="write-card">
    <h1 class="mb-4 text-center fw-bold">Add New Post</h1>
    <form action="write_ok.jsp" method="post">
        <div class="mb-3">
            <label for="title" class="form-label">Title:</label>
            <input type="text" class="form-control" name="title" id="title" required>
        </div>
        <div class="mb-3">
            <label for="writer" class="form-label">Writer:</label>
            <input type="text" class="form-control" name="writer" id="writer" required>
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Content:</label>
            <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
        </div>
        <div class="d-flex justify-content-between align-items-center mt-4">
            <a href="list.jsp" class="btn btn-outline-secondary rounded-pill">View List</a>
            <input type="submit" class="btn btn-primary rounded-pill" value="Add Post">
        </div>
    </form>
</div>
</body>
</html>
