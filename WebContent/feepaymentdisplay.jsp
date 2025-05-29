<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.FeePayment" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>View All Fee Payments</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
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
    max-width: 1000px;
    margin: 40px auto;
    padding: 30px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
  }

  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
  }

  .header h1 {
    font-weight: 600;
    font-size: 24px;
    color: #1e293b;
  }

  .btn {
    background-color: #2563eb;
    color: white;
    border: none;
    padding: 10px 16px;
    font-size: 14px;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .btn:hover {
    background-color: #1e40af;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
  }

  th, td {
    padding: 12px 16px;
    border-bottom: 1px solid #e5e7eb;
    text-align: left;
  }

  th {
    background-color: #f1f5f9;
    font-weight: 500;
  }

  .amount {
    text-align: right;
    font-weight: 500;
  }

  .status {
    padding: 6px 12px;
    border-radius: 12px;
    font-size: 13px;
    font-weight: 500;
    display: inline-block;
  }

  .status-paid {
    background-color: #d1fae5;
    color: #065f46;
  }

  .status-unpaid {
    background-color: #fef9c3;
    color: #92400e;
  }

  .status-overdue {
    background-color: #fee2e2;
    color: #991b1b;
  }

  .no-data {
    text-align: center;
    font-style: italic;
    color: #888;
    padding: 20px 0;
  }

  .theme-toggle {
    position: fixed;
    top: 20px;
    right: 20px;
    background: #1f2937;
    color: #fff;
    border: none;
    padding: 10px;
    border-radius: 50%;
    cursor: pointer;
    font-size: 18px;
    z-index: 999;
  }
  
   .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #2563eb;
            font-size: 14px;
        }

  /* Dark mode styles */
  body.dark-mode {
    background-color: #111827;
    color: #f3f4f6;
  }

  body.dark-mode .container {
    background-color: #1f2937;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
  }

  body.dark-mode th {
    background-color: #374151;
    color: #e5e7eb;
  }

  body.dark-mode td {
    border-bottom: 1px solid #4b5563;
  }

  body.dark-mode .btn {
    background-color: #3b82f6;
  }

  body.dark-mode .btn:hover {
    background-color: #2563eb;
  }

  body.dark-mode .status-paid {
    background-color: #064e3b;
    color: #d1fae5;
  }

  body.dark-mode .status-unpaid {
    background-color: #78350f;
    color: #fef3c7;
  }

  body.dark-mode .status-overdue {
    background-color: #7f1d1d;
    color: #fee2e2;
  }

  body.dark-mode .no-data {
    color: #9ca3af;
  }
</style>
 
  
</head>
<body>

<button class="theme-toggle" onclick="toggleTheme()" aria-label="Toggle Dark Mode">
  <i class="fas fa-adjust"></i>
</button>

<div class="container">
  <div class="header">
    <h1><i class="fas fa-receipt"></i> Fee Payment Records</h1>
    <button class="btn" onclick="alert('Add Payment clicked')">
      <i class="fas fa-plus"></i> Add Payment
    </button>
  </div>

  <table>
    <thead>
      <tr>
        <th>Payment ID</th>
        <th>Student ID</th>
        <th>Student Name</th>
        <th>Payment Date</th>
        <th>Amount</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody id="payments-tbody">
      <%
        List<FeePayment> payments = (List<FeePayment>) request.getAttribute("payments");
        if (payments != null && !payments.isEmpty()) {
          for (FeePayment payment : payments) {
            String statusClass = "";
            String status = payment.getStatus();
            if ("Paid".equalsIgnoreCase(status)) statusClass = "status-paid";
            else if ("Unpaid".equalsIgnoreCase(status)) statusClass = "status-unpaid";
            else if ("Overdue".equalsIgnoreCase(status)) statusClass = "status-overdue";
      %>
        <tr>
          <td><%= payment.getPaymentId() %></td>
          <td><%= payment.getStudentId() %></td>
          <td><%= payment.getStudentName() %></td>
          <td><%= payment.getPaymentDate() %></td>
          <td class="amount">₹<%= String.format("%.2f", payment.getAmount()) %></td>
          <td><span class="status <%= statusClass %>"><%= status %></span></td>
        </tr>
      <%
          }
        } else {
      %>
        <tr><td colspan="6" class="no-data">No fee payments found.</td></tr>
      <%
        }
      %>
    </tbody>
  </table>
  <a href="index.jsp" class="back-link">← Return to Dashboard</a>
</div>

<script>
  function applyTheme(theme) {
    if (theme === 'dark') {
      document.body.classList.add('dark-mode');
    } else {
      document.body.classList.remove('dark-mode');
    }
  }

  function toggleTheme() {
    if (document.body.classList.contains('dark-mode')) {
      document.body.classList.remove('dark-mode');
      localStorage.setItem('theme', 'light');
    } else {
      document.body.classList.add('dark-mode');
      localStorage.setItem('theme', 'dark');
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    const savedTheme = localStorage.getItem('theme') || 'light';
    applyTheme(savedTheme);
  });
</script>
</body>
</html>
