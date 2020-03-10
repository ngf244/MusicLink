<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 /* String payment = (String)request.getAttribute("payment"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>


<style>
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:800px; padding-top: 30px; padding-bottom:10%;}
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: 14%; left:31%; color: rgb(224, 224, 224);}
    /* 섹션 바*/
    .sec-line{width:6%; height:5px; background: yellow; margin:0; padding:0; margin-left:5%; margin-top:5%;}
    .sec-mtxt{margin-left:5%; margin-top: -5px; font-size:35px;}
    .sec-mtxt > p{ display: inline-block; font-size:25px;}
    
    /*컨텐츠*/
    .pc-content{height:600px; margin-bottom:50px;}
    .pcc-left{width:48%; float:left; height:600px; margin:0 1%; background:#ccc;}
    .pcc-left > img{width:100%; height:600px;}
    .pcc-right{width:48%; float:left; height:600px; margin:0 1%; background:#fff; border-top:1px solid black; border-bottom:1px solid black; box-sizing: border-box;}
    .pcc-right > form{height:inherit;}
    .pcc-rwap{width: 100%; height:inherit; margin:0; padding:0;}
    .pcc-rwap > li{height:120px; width:100%; line-height:120px; border-bottom:1px solid #ccc; box-sizing: border-box;}
    .pcc-rwap > li:last-child{border-bottom:none;}
    .pcc-name > label{width:24%; display:inline-block; margin:0; padding:0; font-size:24px; text-align: center;}
    .pcc-choice{width:100%;}
    .pcc-choice > label{width:24%; display:inline-block; text-align: center; font-size:22px;}
    .pcc-choice > label > input{display:inline-block; width:24px; height:24px;}
    
    /*버튼*/
    .pcBtn{width:100%; text-align:center;}
    .left-btn{width:150px; font-size:30px; display:inline-block; background:#000; height:50px; line-height:50px; color:#fff;}
    .right-btn{width:150px; font-size:30px; display: inline-block; background:#000; height:50px; line-height:50px; color:#fff;}
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	
	<section style="z-index: 1;">
        <div class="sec-line"></div>
        <h1 class="sec-mtxt">CoIn<p>-Purchase</p></h1>
        <div class="pc-content">
        	<div class="pcc-left">
        		<img src="<%= request.getContextPath() %>/img/202002261251.jpg">
        	</div>
        	<div class="pcc-right">
        		<form action="<%= request.getContextPath() %>/payment.me" method="post">
        			<ul class="pcc-rwap">
        				<li class="pcc-name">
        					<label>선택</label>
        					<label>코인</label>
        					<label>금액</label>
        					<label>기타</label>
        				</li>
        				<li class="pcc-choice">
        					<label><input type="radio" name="price" value="11000"></label>
        					<label>10</label>
        					<label>11000</label>
        					<label></label>
        				</li>
        				<li class="pcc-choice">
        					<label><input type="radio" name="price" value="22000"></label>
        					<label>21</label>
        					<label>22000</label>
        					<label></label>
        				</li>
        				<li class="pcc-choice">
        					<label><input type="radio" name="price" value="33000" ></label>
        					<label>32</label>
        					<label>33000</label>
        					<label></label>
        				</li>
        				<li class="pcc-choice">
        					<label><input type="radio" name="price" value="55000"></label>
        					<label>55</label>
        					<label>55000</label>
        					<label></label>
        				</li>
        			</ul>
        		</form>
        	</div>
        </div>
        <div class="pcBtn">
        	<div class="left-btn" onclick="btnBuy();">결제</div>
        	<div class="right-btn">취소</div>
        </div>
    </section>
    <h1 class="htext">P U R C H A S E</h1>
	

	
	<%@ include file="../common/footer.jsp" %>
	
<script>

	

	function btnBuy(){
		var prices = document.getElementsByName('price');
		var price_value;
		var fin = false;
		
		for(var i=0; i<prices.length; i++) {
		    if(prices[i].checked) {
		    	price_value = prices[i].value;
		    }
		}
		
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp93211391'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({			
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : price_value,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        /**/
		        
		        var faction = $('form');
		        <%-- faction.action = "<%= request.getContextPath() %>"; --%>
		       <%--  faction.action = "<%= request.getContextPath() %>/payment.me";
		        faction.method = "post";
		        console.log(price_value); --%>
		        
		        faction.submit();
		        fin = true;
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        alert(msg);
		    }
		    if(fin){
		    	alert(msg);	
		    	
		    }
		    
		    
		    
		    
		});
		
		
		
		
		
	}
	
	

</script>
	
</body>
</html>