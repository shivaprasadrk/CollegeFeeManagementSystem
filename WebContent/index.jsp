<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>College Fee Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f9;
            display: flex;
        }

        .sidebar {
            width: 220px;
            background-color: #1f2937;
            color: white;
            min-height: 100vh;
            padding: 20px;
        }

        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 20px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #d1d5db;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s;
        }

        .sidebar ul li a:hover {
            color: #ffffff;
        }

        .container {
            flex-grow: 1;
            padding: 30px;
        }

        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 30px;
        }

        .menu-item {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .menu-icon {
            font-size: 28px;
            color: #2563eb;
            margin-bottom: 15px;
        }

        .menu-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #111827;
        }

        .menu-desc {
            font-size: 14px;
            color: #6b7280;
        }

        .menu-link {
            display: inline-block;
            margin-top: 12px;
            padding: 8px 14px;
            background-color: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .menu-link:hover {
            background-color: #1e40af;
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            color: #6b7280;
            font-size: 13px;
        }

        @media (max-width: 768px) {
            .sidebar {
                display: none;
            }

            body {
                flex-direction: column;
            }

            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2><i class="fas fa-university"></i> CFMS</h2>
        <ul>
            <li><a href="#"><i class="fas fa-home"></i> Dashboard</a></li>
            <li><a href="feepaymentadd.jsp"><i class="fas fa-plus-circle"></i> Add Payment</a></li>
            <li><a href="feepaymentupdate.jsp"><i class="fas fa-edit"></i> Update Payment</a></li>
            <li><a href="feepaymentdelete.jsp"><i class="fas fa-trash-alt"></i> Delete Payment</a></li>
            <li><a href="displayPayments"><i class="fas fa-list"></i> View Payments</a></li>
            <li><a href="reports.jsp"><i class="fas fa-chart-pie"></i> Reports</a></li>
        </ul>
    </div>

    <div class="container">
        <h1 style="margin-bottom: 30px; color: #1f2937;">Welcome to the College Fee Management System</h1>

        <div class="menu">
            <div class="menu-item">
                <div class="menu-icon"><i class="fas fa-user-plus"></i></div>
                <div class="menu-title">Add Fee Payment</div>
                <div class="menu-desc">Enter a new student fee payment record.</div>
                <a href="feepaymentadd.jsp" class="menu-link">Access</a>
            </div>

            <div class="menu-item">
                <div class="menu-icon"><i class="fas fa-pen-nib"></i></div>
                <div class="menu-title">Update Payment</div>
                <div class="menu-desc">Modify or correct existing payment data.</div>
                <a href="feepaymentupdate.jsp" class="menu-link">Access</a>
            </div>

            <div class="menu-item">
                <div class="menu-icon"><i class="fas fa-trash-can"></i></div>
                <div class="menu-title">Delete Payment</div>
                <div class="menu-desc">Remove incorrect or duplicate entries.</div>
                <a href="feepaymentdelete.jsp" class="menu-link">Access</a>
            </div>

            <div class="menu-item">
                <div class="menu-icon"><i class="fas fa-folder-open"></i></div>
                <div class="menu-title">View Payments</div>
                <div class="menu-desc">Search and view all fee payment records.</div>
                <a href="displayPayments" class="menu-link">Access</a>
            </div>

            <div class="menu-item">
                <div class="menu-icon"><i class="fas fa-file-alt"></i></div>
                <div class="menu-title">Generate Reports</div>
                <div class="menu-desc">Analyze fee collections with reports.</div>
                <a href="reports.jsp" class="menu-link">Access</a>
            </div>
        </div>

        <div class="footer">
            &copy; <%= java.time.Year.now().getValue() %> College Fee Management System | All rights reserved.
        </div>
    </div>
</body>
</html>
