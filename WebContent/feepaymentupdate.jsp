<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Fee Payment</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s, color 0.3s;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #1e293b;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
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
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button[type="submit"] {
            background-color: #10b981;
            color: #fff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #059669;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #3b82f6;
            text-decoration: none;
            font-size: 14px;
        }

        .message {
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .message.success {
            background-color: #d1fae5;
            color: #065f46;
        }

        .message.error {
            background-color: #fee2e2;
            color: #b91c1c;
        }

        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #111827;
            color: #fff;
            border: none;
            padding: 10px 14px;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Dark Mode */
        body.dark-mode {
            background-color: #111827;
            color: #f3f4f6;
        }

        body.dark-mode .container {
            background-color: #1f2937;
        }

        body.dark-mode input,
        body.dark-mode select {
            background-color: #374151;
            color: #f9fafb;
            border-color: #4b5563;
        }

        body.dark-mode label {
            color: #d1d5db;
        }

        body.dark-mode .message.success {
            background-color: #064e3b;
            color: #d1fae5;
        }

        body.dark-mode .message.error {
            background-color: #7f1d1d;
            color: #fee2e2;
        }

        body.dark-mode .back-link {
            color: #93c5fd;
        }
    </style>
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()" title="Toggle Light/Dark Mode">
        <i class="fas fa-adjust"></i>
    </button>

    <div class="container">
        <h1><i class="fas fa-edit"></i> Update Fee Payment</h1>

        <% if (request.getParameter("error") != null) { %>
            <div class="message error">
                <i class="fas fa-exclamation-circle"></i> Failed to update payment. Please try again.
            </div>
        <% } %>

        <% if (request.getParameter("success") != null) { %>
            <div class="message success">
                <i class="fas fa-check-circle"></i> Payment updated successfully!
            </div>
        <% } %>

        <form action="updatePayment" method="post">
            <div class="form-group">
                <label for="paymentId">Payment ID</label>
                <input type="number" id="paymentId" name="paymentId" required placeholder="Enter payment ID">
            </div>
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
                <label for="amount">Amount</label>
                <input type="number" id="amount" name="amount" step="0.01" required placeholder="0.00">
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <select id="status" name="status" required>
                    <option value="" disabled selected>Select payment status</option>
                    <option value="Paid">Paid</option>
                    <option value="Unpaid">Unpaid</option>
                    <option value="Overdue">Overdue</option>
                </select>
            </div>
            <button type="submit"><i class="fas fa-save"></i> Update Payment</button>
        </form>

        <a class="back-link" href="index.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>

    <script>
        // Theme toggle logic with local storage
        function toggleTheme() {
            document.body.classList.toggle("dark-mode");
            localStorage.setItem("theme", document.body.classList.contains("dark-mode") ? "dark" : "light");
        }

        // Initialize theme on page load
        window.onload = () => {
            if (localStorage.getItem("theme") === "dark") {
                document.body.classList.add("dark-mode");
            }
        };
    </script>
</body>
</html>
