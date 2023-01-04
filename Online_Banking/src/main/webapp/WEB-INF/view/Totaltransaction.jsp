<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="components/navbar.jsp"%>

<div class="modal-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="custom-bg text-white">
								<tr>
									<th scope="col">Account Transaction Id</th>
									<th scope="col">Customer Name</th>
									<th scope="col">Phone</th>
									<th scope="col">Email Id</th>
									<th scope="col">Card No</th>
									<th scope="col">To Card No</th>
									<th scope="col">Transaction Type</th>
									<th scope="col">Amount</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<AccountTransaction> transactions = accountTransactionDao.findAll();
								%>

								<%
								if (transactions != null) {
									for (AccountTransaction transaction : transactions) {

										Account acc = null;
										Optional<Account> oa = accountDao.findById(transaction.getAccountId());
										if (oa.isPresent()) {
									acc = oa.get();
										}

										Customer cust = null;

										Optional<Customer> oc = customerDao.findById(acc.getCustomerId());
										if (oc.isPresent()) {
									cust = oc.get();
										}
								%>
								<tr>
									<td class="mid-align"><%=transaction.getId()%></td>
									<td class="mid-align"><%=cust.getFirstName() + " " + cust.getLastName()%></td>
									<td class="mid-align"><%=cust.getPhoneNumber()%></td>
									<td class="mid-align"><%=cust.getEmailId()%></td>
									<td class="mid-align"><%=acc.getCardNo()%></td>

									<%
									if (acc.getType().equals(Constants.TransactionType.ACCOUNT_TRANSFER.value())) {
									%>
									<td class="mid-align"><%=accountDao.getById(transaction.getToAccountId()).getCardNo()%></td>
									<%
									} else {
									%>
									<td class="mid-align">---</td>
									<%
									}
									%>

									<td class="mid-align"><%=transaction.getType()%></td>
									<td class="mid-align"><%=transaction.getAmount()%></td>
									

								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>