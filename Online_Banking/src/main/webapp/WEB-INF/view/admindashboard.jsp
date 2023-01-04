<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page </title>
<%@ include file="components/common_cs_js.jsp"%>

</head>
<body>
	<%@ include file="components/navbar.jsp"%>

	<div class="container admin mt-2">
		<%@ include file="components/message.jsp"%>
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card hover" 
					data-target="#show-users-modal">
					<div class="card-body text-center">
						<div class="container"></div>
						<p><a href=Totalcustomer> customers</a></p>
						<h2 class="text-muted">Total Customers</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" 
					data-target="#total-account-modal">
					<div class="card-body text-center">
						<div class="container"></div>
						<p><a href=Totalaccounts > total Accounts</p>
						<h2 class="text-muted">Total Accounts</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" 
					data-target="#show-transaction-modal">
					<div class="card-body text-center">
						<div class="container"></div>
						<p><a href=Totaltransaction> Total Transactions</p>
						<h2 class="text-muted">Total Transaction</h2>
					</div>
				</div>
			</div>
		</div>





	</div>


</body>
</html>