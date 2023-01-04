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
								<tr>
									<th scope="col">Customer Id</th>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Date of Birth</th>
									<th scope="col">Gender</th>
									<th scope="col">Branch</th>
									<th scope="col">Permanent Address</th>
									<th scope="col">Present Address</th>
									<th scope="col">Register Date</th>
								</tr>
								</tr>
							</thead>
							<%
							List<Customer> customers = customerDao.findAll();
							%>
							<tbody>
								<%
								if (customers != null) {
									for (Customer c : customers) {

										Branch b = null;
										Optional<Branch> ob = branchDao.findById(c.getBranchId());
										if (ob.isPresent()) {
									b = ob.get();
										}
								%>
								<tr>
									<td class="mid-align"><%=c.getId()%></td>
									<td class="mid-align"><%=c.getFirstName()%></td>
									<td class="mid-align"><%=c.getLastName()%></td>
									<td class="mid-align"><%=c.getPhoneNumber()%></td>
									<td class="mid-align"><%=c.getDob()%></td>
									<td class="mid-align"><%=c.getGender()%></td>
									<td class="mid-align"><%=""%></td>
									<td class="mid-align"><%=c.getPermentAddress()%></td>
									<td class="mid-align"><%=c.getPresentAddress()%></td>
									<td class="mid-align"><%=c.getDate()%></td>
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