<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Fee Payment</title>
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
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
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
            font-weight: 500;
            margin-bottom: 6px;
            display: block;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn-delete {
            background-color: #ef4444;
            color: #fff;
            border: none;
            padding: 12px;
            font-size: 16px;
            width: 100%;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-delete:hover {
            background-color: #dc2626;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #3b82f6;
            text-decoration: none;
            font-size: 14px;
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

        .error {
            background-color: #fee2e2;
            color: #b91c1c;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 25px 30px;
            border-radius: 8px;
            width: 90%;
            max-width: 400px;
            text-align: center;
        }

        .modal-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
        }

        .confirm {
            background-color: #ef4444;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
        }

        .cancel {
            background-color: #6b7280;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
        }

        /* Dark Mode */
        body.dark-mode {
            background-color: #111827;
            color: #f3f4f6;
        }

        body.dark-mode .container {
            background-color: #1f2937;
        }

        body.dark-mode input {
            background-color: #374151;
            color: #f9fafb;
            border-color: #4b5563;
        }

        body.dark-mode label,
        body.dark-mode h1 {
            color: #d1d5db;
        }

        body.dark-mode .error {
            background-color: #7f1d1d;
            color: #fee2e2;
        }

        body.dark-mode .back-link {
            color: #93c5fd;
        }

        body.dark-mode .modal-content {
            background-color: #1f2937;
            color: #f3f4f6;
        }
    </style>
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()">
        <i class="fas fa-adjust"></i>
    </button>

    <div class="container">
        <h1><i class="fas fa-trash-alt"></i> Delete Fee Payment</h1>

        <% if (request.getParameter("error") != null) { %>
            <div class="error">Failed to delete payment. Please try again.</div>
        <% } %>

        <form id="deleteForm">
            <div class="form-group">
                <label for="paymentId">Payment ID</label>
                <input type="number" id="paymentId" name="paymentId" required placeholder="Enter payment ID">
            </div>
            <button type="button" class="btn-delete" onclick="openModal()">Delete Payment Record</button>
        </form>

        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Return to Dashboard</a>
    </div>

    <!-- Modal -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <p>Are you sure you want to delete this payment record? This action cannot be undone.</p>
            <div class="modal-buttons">
                <button class="confirm" onclick="submitForm()">Yes, Delete</button>
                <button class="cancel" onclick="closeModal()">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        const form = document.getElementById('deleteForm');
        const modal = document.getElementById('confirmModal');

        function toggleTheme() {
            document.body.classList.toggle('dark-mode');
            localStorage.setItem("theme", document.body.classList.contains("dark-mode") ? "dark" : "light");
        }

        function openModal() {
            modal.style.display = "flex";
        }

        function closeModal() {
            modal.style.display = "none";
        }

        function submitForm() {
            form.setAttribute("method", "get");
            form.setAttribute("action", "deletePayment");
            form.submit();
        }

        window.onload = () => {
            if (localStorage.getItem("theme") === "dark") {
                document.body.classList.add("dark-mode");
            }
            document.getElementById("paymentId").focus();
        }
    </script>
</body>
</html>
