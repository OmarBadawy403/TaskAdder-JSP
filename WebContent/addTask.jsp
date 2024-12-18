<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        h1 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="submit"], .button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover, .button:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        a:hover {
            color: #45a049;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
        }

        form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add a New Task</h1>
        <form action="addTask.jsp" method="post">
            <label for="task">Task Name:</label>
            <input type="text" name="task" id="task" required>
            <input type="submit" value="Add Task">
        </form>

        <%
            String task = request.getParameter("task");
            if (task != null && !task.isEmpty()) {
                List tasks = (List) session.getAttribute("tasks");
                if (tasks == null) {
                    tasks = new ArrayList();
                }
                tasks.add(task);
                session.setAttribute("tasks", tasks);
            }
        %>

        <a href="taskList.jsp" class="button">View Tasks</a>
    </div>
</body>
</html>
