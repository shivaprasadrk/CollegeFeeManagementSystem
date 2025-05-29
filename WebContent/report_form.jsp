<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8fafc;
            color: #1e293b;
            transition: background-color 0.3s, color 0.3s;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
        }

        .report-icon i {
            font-size: 48px;
            color: #0d6efd;
            margin-bottom: 15px;
        }

        .report-title {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #0f172a;
            color: white;
            border: none;
            padding: 10px 14px;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Dark Mode */
        body.dark-mode {
            background-color: #0f172a;
            color: #e2e8f0;
        }

        body.dark-mode .card {
            background-color: #1e293b;
            color: #f1f5f9;
        }

        body.dark-mode .form-control,
        body.dark-mode .form-select {
            background-color: #334155;
            border-color: #475569;
            color: #e2e8f0;
        }

        body.dark-mode .form-control:focus,
        body.dark-mode .form-select:focus {
            background-color: #334155;
            color: #f8fafc;
        }

        body.dark-mode .btn-outline-secondary {
            border-color: #94a3b8;
            color: #cbd5e1;
        }

        body.dark-mode .btn-outline-secondary:hover {
            background-color: #475569;
        }

        .date-input-group {
            position: relative;
        }

        .date-input-group i {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #64748b;
            pointer-events: none;
        }

        body.dark-mode .date-input-group i {
            color: #cbd5e1;
        }
    </style>
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()" title="Toggle Theme">
        <i class="fas fa-adjust"></i>
    </button>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-chart-pie me-2"></i>
                            <span>Generate Custom Report</span>
                        </div>
                        <a href="reports.jsp" class="btn btn-sm btn-light">
                            <i class="fas fa-arrow-left me-1"></i> Back
                        </a>
                    </div>
                    <div class="card-body text-center">
                        <%
                            String reportType = request.getParameter("reportType");
                            String reportTitle = "";
                            String iconClass = "";
                            String description = "";

                            if ("overdue".equals(reportType)) {
                                reportTitle = "Overdue Payments Report";
                                iconClass = "fas fa-exclamation-triangle";
                                description = "Generate a list of students with overdue fee payments";
                            } else if ("unpaid".equals(reportType)) {
                                reportTitle = "Unpaid Fees Report";
                                iconClass = "fas fa-clock";
                                description = "Generate a list of students with pending fee payments";
                            } else if ("collections".equals(reportType)) {
                                reportTitle = "Fee Collections Report";
                                iconClass = "fas fa-chart-line";
                                description = "Generate summary of all fee collections";
                            }
                        %>

                        <div class="report-icon">
                            <i class="<%= iconClass %>"></i>
                        </div>
                        <h3 class="report-title"><%= reportTitle %></h3>
                        <p class="text-muted mb-4"><%= description %></p>

                        <form action="report" method="get" class="needs-validation" novalidate>
                            <input type="hidden" name="reportType" value="<%= reportType %>">

                            <% if (!"overdue".equals(reportType)) { %>
                            <div class="row mb-4">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <label for="startDate" class="form-label">Start Date</label>
                                    <div class="date-input-group">
                                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div class="invalid-feedback">
                                        Please select a valid start date
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="endDate" class="form-label">End Date</label>
                                    <div class="date-input-group">
                                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div class="invalid-feedback">
                                        Please select a valid end date
                                    </div>
                                </div>
                            </div>
                            <% } %>

                            <div class="d-grid gap-3 d-md-flex justify-content-md-center mt-4">
                                <a href="reports.jsp" class="btn btn-outline-secondary px-4">
                                    <i class="fas fa-times me-2"></i> Cancel
                                </a>
                                <button type="submit" class="btn btn-primary px-4">
                                    <i class="fas fa-file-download me-2"></i> Generate Report
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Dark mode toggle
        function toggleTheme() {
            document.body.classList.toggle("dark-mode");
            localStorage.setItem("theme", document.body.classList.contains("dark-mode") ? "dark" : "light");
        }

        window.onload = function () {
            if (localStorage.getItem("theme") === "dark") {
                document.body.classList.add("dark-mode");
            }
        };

        // Bootstrap validation
        (() => {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })();

        // Default dates
        document.addEventListener("DOMContentLoaded", function () {
            const today = new Date();
            const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);

            function formatDate(date) {
                let d = new Date(date),
                    month = "" + (d.getMonth() + 1),
                    day = "" + d.getDate(),
                    year = d.getFullYear();
                if (month.length < 2) month = "0" + month;
                if (day.length < 2) day = "0" + day;
                return [year, month, day].join("-");
            }

            const startDate = document.getElementById("startDate");
            const endDate = document.getElementById("endDate");

            if (startDate) startDate.value = formatDate(firstDay);
            if (endDate) endDate.value = formatDate(today);

            if (startDate && endDate) {
                startDate.addEventListener("change", function () {
                    if (endDate.value && startDate.value > endDate.value) {
                        endDate.value = startDate.value;
                    }
                });

                endDate.addEventListener("change", function () {
                    if (startDate.value && endDate.value < startDate.value) {
                        endDate.setCustomValidity("End date must be after start date");
                    } else {
                        endDate.setCustomValidity("");
                    }
                });
            }
        });
    </script>
</body>
</html>
