<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Reports | College Fee System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            transition: background 0.3s, color 0.3s;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .page-title {
            font-size: 2.2rem;
            font-weight: 600;
            color: #2c3e50;
        }

        .page-description {
            color: #6c757d;
            margin-top: 10px;
        }

        .report-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        .report-card {
            background-color: #fff;
            border-radius: 12px;
            padding: 30px 25px;
            width: 320px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .report-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        }

        .report-icon {
            font-size: 2.8rem;
            color: #007bff;
            margin-bottom: 15px;
        }

        .report-card h3 {
            font-size: 1.3rem;
            margin-bottom: 10px;
        }

        .report-card p {
            font-size: 0.95rem;
            color: #666;
            margin-bottom: 20px;
        }

        .report-link {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }

        .report-link i {
            margin-left: 5px;
        }

        .back-link {
            display: inline-block;
            margin-top: 40px;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        .theme-toggle {
            position: fixed;
            top: 20px;
            right: 20px;
            font-size: 1.5rem;
            cursor: pointer;
            z-index: 999;
            color: #333;
        }

        /* Dark Mode */
        .dark-mode {
            background-color: #1e1e2f;
            color: #f1f1f1;
        }

        .dark-mode .report-card {
            background-color: #2a2a40;
            color: #f1f1f1;
        }

        .dark-mode .page-title {
            color: #f1f1f1;
        }

        .dark-mode .report-link,
        .dark-mode .back-link {
            color: #4dabf7;
        }

        .dark-mode .theme-toggle {
            color: #f1f1f1;
        }

        @media screen and (max-width: 768px) {
            .report-grid {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <i class="fas fa-moon theme-toggle" id="themeToggle" title="Toggle Theme"></i>

    <div class="container">
        <div class="page-header">
            <h1 class="page-title"><i class="fas fa-chart-pie"></i> Generate Reports</h1>
            <p class="page-description">
                Select a report type below to generate detailed fee payment reports and analytics.
            </p>
        </div>

        <div class="report-grid">
            <div class="report-card" onclick="location.href='reportCriteria?reportType=overdue'">
                <div class="report-icon"><i class="fas fa-exclamation-triangle"></i></div>
                <h3>Overdue Payments</h3>
                <p>List of students with overdue payments, including payment details and overdue duration.</p>
                <a href="reportCriteria?reportType=overdue" class="report-link">Generate Report <i class="fas fa-arrow-right"></i></a>
            </div>

            <div class="report-card" onclick="location.href='reportCriteria?reportType=unpaid'">
                <div class="report-icon"><i class="fas fa-clock"></i></div>
                <h3>Pending Payments</h3>
                <p>View unpaid student fees with filtering options for department, period, or amount.</p>
                <a href="reportCriteria?reportType=unpaid" class="report-link">Generate Report <i class="fas fa-arrow-right"></i></a>
            </div>

            <div class="report-card" onclick="location.href='reportCriteria?reportType=collections'">
                <div class="report-icon"><i class="fas fa-chart-line"></i></div>
                <h3>Fee Collections</h3>
                <p>Analyze total collections, payment methods, and department-wise financial stats.</p>
                <a href="reportCriteria?reportType=collections" class="report-link">Generate Report <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>

        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>

    <script>
        // Theme toggle functionality
        const themeToggle = document.getElementById('themeToggle');
        themeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            themeToggle.classList.toggle('fa-moon');
            themeToggle.classList.toggle('fa-sun');
        });

        // Card animation on load
        document.addEventListener('DOMContentLoaded', () => {
            const cards = document.querySelectorAll('.report-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 200);
            });
        });
    </script>

</body>
</html>
