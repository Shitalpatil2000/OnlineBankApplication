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
									<th scope="col">Account Id</th>
									<th scope="col">Customer Name</th>
									<th scope="col">Phone</th>
									<th scope="col">Email Id</th>
									<th scope="col">Card No</th>
									<th scope="col">Pin</th>
									<th scope="col">Account Type</th>
									<th scope="col">Account Status</th>
									<th scope="col">Change Status</th>
									<th scope="col">Checkbook Status</th>
									<th scope="col">Approve Checkbook</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<Account> accounts = accountDao.findAll();
								%>

								<%
								if (accounts != null) {
									for (Account acc : accounts) {

										Customer cust = null;

										Optional<Customer> oc = customerDao.findById(acc.getCustomerId());
										if (oc.isPresent()) {
									cust = oc.get();
										}
								%>
								<tr>
									<td class="mid-align"><%=acc.getId()%></td>
									<td class="mid-align"><%=cust.getFirstName() + " " + cust.getLastName()%></td>
									<td class="mid-align"><%=cust.getPhoneNumber()%></td>
									<td class="mid-align"><%=cust.getEmailId()%></td>
									<td class="mid-align"><%=acc.getCardNo()%></td>
									<td class="mid-align">*****</td>
									<td class="mid-align"><%=acc.getType()%></td>
									<td class="mid-align"><%=acc.getStatus()%></td>
									<%
									if (acc.getStatus().equals(Constants.AccountStatus.OPEN.value())) {
									%>
									<td class="mid-align"><a
										href="changeAccountStatus?accountId=<%=acc.getId()%>&accountStatus=<%=Constants.AccountStatus.LOCK.value()%>"><button
												type="button" class="btn custom-bg text-white">Lock</button>
									</a></td>
									<%
									} else {
									%>
									<td class="mid-align"><a
										href="changeAccountStatus?accountId=<%=acc.getId()%>&accountStatus=<%=Constants.AccountStatus.OPEN.value()%>"><button
												type="button" class="btn custom-bg text-white">Open</button>
									</a></td>
									<%
									}
									%>
									
									<%
									    Checkbook checkbook = checkbookDao.findByCustomerId(cust.getId());
									%>
									
									<%  
									if(checkbook != null) {
									%>
									   <td class="mid-align"><%=checkbook.getApprovalStatus()%></td>
									<%
									}
									
									else {
									
									%>
									<td class="mid-align"><%=Constants.CheckbookStatus.NOT_APPLIED.value()%></td>
									<%
									}
									%>
									
									<%  
									if(checkbook != null && checkbook.getApprovalStatus().equals(Constants.CheckbookStatus.APPROVAL_PENDING.value())) {
									%>
									   <td class="mid-align"><a
										href="updateCheckbookStatus?customerId=<%=cust.getId()%>&status=<%=Constants.CheckbookStatus.APPROVED.value()%>"><button
												type="button" class="btn custom-bg text-white">Approve</button></a></td>
									<%
									}
									
									else {
									
									%>
									<td class="mid-align"><%=Constants.CheckbookStatus.NOT_APPLIED.value()%></td>
									<%
									}
									%>
									
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			
</body>
</html>