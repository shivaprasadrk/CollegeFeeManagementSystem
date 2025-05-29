<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Fee Payment</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: #333;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s, color 0.3s;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #1e293b;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        button[type="submit"] {
            background-color: #2563eb;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            display: block;
            width: 100%;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #1e40af;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #2563eb;
            font-size: 14px;
        }

        .error, .success {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            text-align: center;
            font-weight: 500;
        }

        .error {
            background-color: #fee2e2;
            color: #b91c1c;
        }

        .success {
            background-color: #d1fae5;
            color: #065f46;
        }

        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #1f2937;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
            z-index: 999;
        }

        /* Dark mode */
        body.dark-mode {
            background-color: #111827;
            color: #f3f4f6;
        }

        body.dark-mode .container {
            background-color: #1f2937;
            box-shadow: 0 4px 12px rgba(0,0,0,0.5);
        }

        body.dark-mode input,
        body.dark-mode select {
            background-color: #374151;
            color: #f3f4f6;
            border: 1px solid #4b5563;
        }

        body.dark-mode label {
            color: #e5e7eb;
        }

        body.dark-mode .back-link {
            color: #60a5fa;
        }

        body.dark-mode .error {
            background-color: #7f1d1d;
            color: #fee2e2;
        }

        body.dark-mode .success {
            background-color: #064e3b;
            color: #d1fae5;
        }
    </style>
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()">
        <i class="fas fa-moon"></i>
    </button>

    <div class="container">
        <h1>Add Fee Payment</h1>

        <% if (request.getParameter("error") != null) { %>
            <div class="error">Failed to add payment. Please try again.</div>
        <% } %>

        <% if (request.getParameter("success") != null) { %>
            <div class="success">Payment added successfully!</div>
        <% } %>

        <form action="addPayment" method="post">
            <div class="form-group">
                <label for="studentId">Student ID</label>
                <input type="number" id="studentId" name="studentId" required placeholder="Enter student ID">
            </div>

            <div class="form-group">
                <label for="studentName">Student Name</label>
                <input type="text" id="studentName" name="studentName" required placeholder="Enter student name">
            </div>

            <div class="form-group">
                <label for="paymentDate">Payment Date</label>
                <input type="date" id="paymentDate" name="paymentDate" required>
            </div>

            <div class="form-group">
                <label for="amount">Amount (₹)</label>
                <input type="number" id="amount" name="amount" step="0.01" required placeholder="0.00">
            </div>

            <div class="form-group">
                <label for="status">Payment Status</label>
                <select id="status" name="status" required>
                    <option value="" disabled selected>Select status</option>
                    <option value="Paid">Paid</option>
                    <option value="Unpaid">Unpaid</option>
                    <option value="Overdue">Overdue</option>
                </select>
            </div>

            <button type="submit">Add Payment Record</button>
        </form>

        <a href="index.jsp" class="back-link">← Return to Dashboard</a>
    </div>

    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script>
        function toggleTheme() {
            document.body.classList.toggle('dark-mode');
            localStorage.setItem('theme', document.body.classList.contains('dark-mode') ? 'dark-mode' : 'light-mode');
        }

        window.onload = function () {
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme === 'dark-mode') {
                document.body.classList.add('dark-mode');
            }
        };
    </script>
</body>
</html>
