
<%@ page contentType="text/html; charset=euc-kr" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>상품 검색</title>


<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용
 function fncGetProductList(currentPage, menu){
	document.getElementById("currentPage").value = currentPage;
	document.getElementById("menu").value = menu;
   	document.detailForm.submit();
} 

</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<%-- <c:set var = "pageType" value="product" scope="request"/> --%>
<c:set var="pageType" value="product" scope="request"/>
<c:set var="menu" value="${param.menu}" scope="request"/>

<div style="width:98%; margin-left:10px;">

<%-- <form name="detailForm" action="/listProduct.do?menu=${menu}" method="post"> --%>
<form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
				<c:choose>
			 		<c:when test="${param.menu eq 'manage' }"> 
			 			상품 관리 
					</c:when>
					<c:when test="${param.menu eq 'search' }"> 
						상품 목록조회 
					</c:when>
				</c:choose>
			
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
								
				<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>상품번호</option>
				<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>상품명</option>
				<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>가격</option>
			</select>
			
			<input 	type="text" name="searchKeyword" 
							value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
							class="ct_input_g"	style="width:200px; height:20px" >
		</td>
	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('${resultPage.currentPage}','${param.menu}');">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">등록일</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">현재상태</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
				<td align="left">
				<c:choose>
			 		<c:when test="${param.menu eq 'manage' }"> 
			 			<%-- <a href="/updateProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>
			 			<%-- <a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>
			 			<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
					</c:when>
					<c:when test="${param.menu eq 'search' }"> 
						 <%-- <a href="/getProduct.do?menu=${param.menu}">${product.prodName}</a>  --%>
						<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
					</c:when>
				</c:choose>
				
			<%-- <td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a></td> --%>
			<%-- <td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a></td> --%>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}
			</td>		
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
			<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
			<%-- <% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>','${param.menu}');"><%=i %></a>
			<% 	}  %>
			
			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>  --%>
		 
		
		<%--  <%
			for(int i=1;i<=totalPage;i++){
		%>
					
			<%if (menu.equals("manage")) {%>
			<a href="/listProduct.do?page=<%=i%>&menu=<%=menu%>"><%=i %></a>
			<% }%>
		<%
			}
		%> --%>
		
			
			<%-- <c:set var = "product" value="product" scope="request"/> --%>
			<c:set var = "search" value="search" scope="request"/>
			<c:set var = "menu" value="menu" scope="request"/>
			
			
			<%-- <jsp:include page="../common/pageNavigator1.jsp"/> --%>
			<jsp:include page="../common/pageNavigator1.jsp"/>
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div>
<% System.out.println("listProduct.jsp 555555555555555555555555555555"); %>
</body>
</html>