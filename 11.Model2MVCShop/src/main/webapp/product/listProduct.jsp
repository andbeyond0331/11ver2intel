<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<!--  ////////////////////////// -->

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetProductList(currentPage) {
			var menu=$("input[name='menu']").val();
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+menu).submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetProductList(1);
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
			// alert("why? : "+$(  "td:nth-child(6) > i" ).html);
			 var menu=$("input[name='menu']").val();
			 
			 if(menu=="manage"){
				 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "td:nth-child(2)" ).on("click" , function() {
					 self.location ="/product/updateProduct?prodNo="+$(this).find("input[name=prodNo]").val();
				});
			 }
			 
			 if(menu=="search"){
				 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "td:nth-child(2)" ).on("click" , function() {
					 self.location ="/product/getProduct?prodNo="+$(this).find("input[name=prodNo]").val();
				});
			 }
		
			
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(6) > i" ).on("click" , function() {
					
				

					var prodNo = $(this).find("#prodNo").val();
				
					$.ajax( 
							{
								url : "/product/json/getProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
											+"상 품 번 호 : "+JSONData.prodNo+"<br/>"
											+"상  품  명 : "+JSONData.prodName+"<br/>"
											+"상품  이미지 : "+JSONData.fileName+"<br/>"
											+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
											+"제 조 일 자 : "+JSONData.manuDateString+"<br/>"
											+"가      격 : "+JSONData.price+"<br/>"
											+"등 록 일 자 : "+JSONData.regDateString+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> prodName LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(1)" ).css("background-color" , "black");
			$( "td:nth-child(2)" ).css("background-color" , "black");
			$( "td:nth-child(3)" ).css("background-color" , "black");
			$( "td:nth-child(4)" ).css("background-color" , "black");
			$( "td:nth-child(5)" ).css("background-color" , "black");
			$( "td:nth-child(6)" ).css("background-color" , "black");
			
			$( "td:nth-child(1)" ).css("color" , "lightgreen");
			$( "td:nth-child(2)" ).css("color" , "lightgreen");
			$( "td:nth-child(3)" ).css("color" , "lightgreen");
			$( "td:nth-child(4)" ).css("color" , "lightgreen");
			$( "td:nth-child(5)" ).css("color" , "lightgreen");
			$( "td:nth-child(6)" ).css("color" , "lightgreen");
			$("h7").css("color" , "lightgreen");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
			<c:if test="${menu eq 'search' }">
				<h3>상품 목록 조회</h3>
			</c:if>
			<c:if test="${menu eq 'manage' }">
				<h3>상품 관리</h3>
			</c:if>
			
	       
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left">${product.prodName}
			  <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
			  <input type="hidden" id="menu" name="menu" value="${param.menu}"/>
			  </td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDate}</td>
			  <td align="left">
			  	<c:choose>
					<c:when test="${!empty product.proTranCode && product.proTranCode eq '002'}">
				
					구매 완료
					<c:choose>
						<c:when test="${menu eq 'manage'}">
								<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
							<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=${product.proTranCode}" onClick="return confirm('해당 상품 배송을 시작하시겠습니까?')">배송하기
							</a>
							//////////////////////-->
							배송하기
						</c:when>
					</c:choose>
				</c:when>
					
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '003'}">배송 중</c:when>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '000'}">재고 없음</c:when>
				<c:otherwise>판매 중</c:otherwise>
				</c:choose>
			  </td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}">
			  	<input type="hidden" id="prodNo" value="${product.prodNo}">
			  	<input type="hidden" id="prodName" value="${product.prodName}"></i>
			  </td>
			</tr>
          </c:forEach>
         	<tr align="left" name="autocomplete"></tr>
        </tbody>
      <!-- //////auto 구현할 부분 /////////// -->
     
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new2.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
