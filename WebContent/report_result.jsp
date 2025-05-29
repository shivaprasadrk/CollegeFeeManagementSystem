<%@ page import="java.util.List, com.model.FeePayment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Report Results | College Fee Management</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <!-- DataTables Bootstrap 5 CSS -->
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.bootstrap5.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
            color: #fff;
            padding-top: 1rem;
        }
        .sidebar a {
            color: #adb5bd;
            text-decoration: none;
        }
        .sidebar a.sidebar-brand {
            font-size: 1.5rem;
            font-weight: 600;
            color: #fff;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding-left: 1rem;
            margin-bottom: 1.5rem;
        }
        .sidebar a.sidebar-brand i {
            color: #ffc107;
        }
        .sidebar .nav-link {
            padding: 0.75rem 1rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: #495057;
            color: #ffc107;
        }
        .main-content {
            margin-left: 250px;
            padding: 2rem;
        }
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        .page-title i {
            color: #ffc107;
            margin-right: 0.5rem;
        }
        .btn-group button {
            margin-left: 0.5rem;
        }
        .badge-paid {
            background-color: #198754;
            color: white;
            padding: 0.35em 0.65em;
            border-radius: 0.375rem;
            font-weight: 600;
        }
        .badge-unpaid {
            background-color: #ffc107;
            color: black;
            padding: 0.35em 0.65em;
            border-radius: 0.375rem;
            font-weight: 600;
        }
        .badge-overdue {
            background-color: #dc3545;
            color: white;
            padding: 0.35em 0.65em;
            border-radius: 0.375rem;
            font-weight: 600;
        }
        .report-summary {
            background: white;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgb(0 0 0 / 0.1);
            margin-bottom: 2rem;
        }
        .total-amount {
            font-size: 2.5rem;
            font-weight: 700;
            color: #0d6efd;
            margin: 0.5rem 0 1rem 0;
        }
        .report-period {
            font-size: 0.9rem;
            color: #6c757d;
        }
        /* Scroll horizontal for table */
        .table-responsive {
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar position-fixed top-0 start-0 vh-100">
        <a href="index.jsp" class="sidebar-brand">
            <i class="fas fa-university"></i> College Fees
        </a>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="feepaymentadd.jsp">
                    <i class="fas fa-plus-circle"></i> Add Payment
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="feepaymentupdate.jsp">
                    <i class="fas fa-edit"></i> Update Payment
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="feepaymentdelete.jsp">
                    <i class="fas fa-trash-alt"></i> Delete Payment
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="displayPayments">
                    <i class="fas fa-list"></i> View Payments
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="reports.jsp">
                    <i class="fas fa-chart-bar"></i> Reports
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="page-header">
            <div>
                <h1 class="page-title">
                    <i class="fas fa-file-alt"></i> Report Results
                </h1>
                <p class="page-description"><%= request.getAttribute("reportTitle") %></p>
            </div>
            <div class="btn-group">
                <button class="btn btn-outline-secondary" onclick="window.print()">
                    <i class="fas fa-print"></i> Print
                </button>
                <a href="reports.jsp" class="btn btn-outline-primary">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
                <button class="btn btn-primary" id="exportPdf">
                    <i class="fas fa-file-pdf"></i> PDF
                </button>
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
                <% if ("collections".equals(request.getAttribute("reportType"))) { %>
                    <div class="report-summary">
                        <h4>Total Collections Summary</h4>
                        <div class="total-amount">
                            ₹<%= String.format("%.2f", request.getAttribute("totalCollections")) %>
                        </div>
                        <p class="report-period">
                            <i class="fas fa-calendar-alt"></i> 
                            <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %>
                        </p>
                        <div class="mt-4">
                            <div class="row text-center">
                                <div class="col-md-4">
                                    <div class="p-3 bg-light rounded shadow-sm">
                                        <h6>Total Payments</h6>
                                        <h4><%= request.getAttribute("totalPayments") %></h4>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="p-3 bg-light rounded shadow-sm">
                                        <h6>Paid Students</h6>
                                        <h4><%= request.getAttribute("paidStudents") %></h4>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="p-3 bg-light rounded shadow-sm">
                                        <h6>Average Payment</h6>
                                        <h4>₹<%= String.format("%.2f", request.getAttribute("averagePayment")) %></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } else { 
                    List<FeePayment> reportData = (List<FeePayment>) request.getAttribute("reportData");
                    if (reportData != null && !reportData.isEmpty()) { 
                %>
                    <div class="table-responsive">
                        <table id="reportTable" class="table table-striped table-hover" style="width:100%">
                            <thead class="table-dark">
                                <tr>
                                    <th>Payment ID</th>
                                    <th>Student ID</th>
                                    <th>Student Name</th>
                                    <th>Payment Date</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (FeePayment payment : reportData) { 
                                    String badgeClass = "";
                                    if ("Paid".equals(payment.getStatus())) {
                                        badgeClass = "badge-paid";
                                    } else if ("Unpaid".equals(payment.getStatus())) {
                                        badgeClass = "badge-unpaid";
                                    } else if ("Overdue".equals(payment.getStatus())) {
                                        badgeClass = "badge-overdue";
                                    }
                                %>
                                    <tr>
                                        <td><%= payment.getPaymentId() %></td>
                                        <td><%= payment.getStudentId() %></td>
                                        <td><%= payment.getStudentName() %></td>
                                        <td><%= payment.getPaymentDate() %></td>
                                        <td>₹<%= String.format("%.2f", payment.getAmount()) %></td>
                                        <td><span class="badge <%= badgeClass %>"><%= payment.getStatus() %></span></td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <a href="feepaymentupdate.jsp?id=<%= payment.getPaymentId() %>" class="btn btn-outline-primary" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="feepaymentdelete.jsp?id=<%= payment.getPaymentId() %>" class="btn btn-outline-danger" title="Delete" 
                                                   onclick="return confirm('Are you sure you want to delete this payment?');">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } else { %>
                    <div class="alert alert-info text-center my-5">
                        <i class="fas fa-info-circle"></i> No records found matching your criteria.
                    </div>
                <% } 
                   } %>

                <div class="mt-4 text-muted text-center small">
                    <i class="fas fa-clock"></i> Report generated on: <%= new java.util.Date() %> | 
                    <i class="fas fa-user"></i> Generated by: <%= request.getRemoteUser() != null ? request.getRemoteUser() : "System" %>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- DataTables and Extensions -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.bootstrap5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>

    <script>
        $(document).ready(function() {
            var table = $('#reportTable').DataTable({
                responsive: true,
                dom: '<"top"Bf>rt<"bottom"lip><"clear">',
                buttons: [
                    {
                        extend: 'copy',
                        className: 'btn btn-sm btn-outline-secondary',
                        text: '<i class="fas fa-copy"></i> Copy'
                    },
                    {
                        extend: 'excel',
                        className: 'btn btn-sm btn-outline-success',
                        text: '<i class="fas fa-file-excel"></i> Excel',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'csv',
                        className: 'btn btn-sm btn-outline-primary',
                        text: '<i class="fas fa-file-csv"></i> CSV',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'pdf',
                        className: 'btn btn-sm btn-outline-danger',
                        text: '<i class="fas fa-file-pdf"></i> PDF',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        },
                        orientation: 'landscape',
                        pageSize: 'A4'
                    },
                    {
                        extend: 'print',
                        className: 'btn btn-sm btn-outline-info',
                        text: '<i class="fas fa-print"></i> Print',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    }
                ],
                columnDefs: [
                    { orderable: false, targets: -1 }
                ],
                language: {
                    searchPlaceholder: "Search records..."
                }
            });

            // Additional PDF export button outside DataTable buttons (optional)
            $('#exportPdf').on('click', function() {
                table.button('.buttons-pdf').trigger();
            });
        });
    </script>
</body>
</html>
