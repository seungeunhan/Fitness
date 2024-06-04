<!-- paymentProc.jsp -->
<%@page import="kimJeongTae.healthitemBean"%>
<%@page import="kimJeongTae.PayitemsBean"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="kimJeongTae.ChargeinfoBean"%>
<%@page import="kimJeongTae.UserBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="kimJeongTae.PayMgr"/>
<%
		//int apply_num = Integer.parseInt(request.getParameter("apply_num"));
		int apply_num = 123123123;
		//int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
		int paid_amount = 50000; 
		String msg = "카드승인번호 및 승인금액 : " + apply_num + " : " + paid_amount;
		UserBean user = mgr.UserSelect("aaa");
		
		//chargeinfo에 내역남기기======================================
		ChargeinfoBean chargeinfo = new ChargeinfoBean();
		chargeinfo.setUser(user.getNum());
		//chargeinfo.setItem(mgr.SelectItemNum(request.getParameter("name")));
		chargeinfo.setItem(mgr.SelectItemNum("Protein Shake"));
		chargeinfo.setCode(Integer.toString(apply_num));
		chargeinfo.setPrice(paid_amount);
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        System.out.println(formattedDate);
		chargeinfo.setDate(formattedDate);
		chargeinfo.setChamet("import");
		chargeinfo.setCcflag(false);
		mgr.insertChargeinfo(chargeinfo);
		//payitems에 insert진행하기(기존상품이 있으면 시설이용 기한 터하기 진행)============================
		
		PayitemsBean payitem = mgr.selectPayitem(user.getNum());//비교할 값
		PayitemsBean insertPayitem = new PayitemsBean();//입력할 값
		//healthitemBean healthItem = mgr.SelectHealthitem(mgr.SelectItemNum(request.getParameter("name")));//입력 참고값
		healthitemBean healthItem = mgr.SelectHealthitem(mgr.SelectItemNum("Protein Shake"));//입력 참고값
		
		if(payitem == null){
			//구매 상품이 없을때 바로 db에 값을 넣는다.
			insertPayitem.setUser(user.getNum());
			insertPayitem.setPaydate(formattedDate);
			//healthitem의 hcontent의 종류마다 다른 컬럼에 값을 넣는다.
			if(healthItem.getHcontent().equals("1100")){
				//pt일때 현재날짜에 상품날짜를 더해준뒤에 입력해줘야 한다.
				String deadLineDateString = healthItem.getDeadlinedate();
				// 문자열을 LocalDate로 변환
		        LocalDate deadLineDate = LocalDate.parse(deadLineDateString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		        // 현재 날짜 구하기
		        LocalDate currentDate01 = LocalDate.now();
		        // 현재 날짜와 더하기
		        LocalDate newDate = currentDate01.plusYears(deadLineDate.getYear())
		                                       .plusMonths(deadLineDate.getMonthValue())
		                                       .plusDays(deadLineDate.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setPtdate(newDateString);
			}else if(healthItem.getHcontent().equals("1010")){
				//gpt인 경우 어덯게 저장할려는 건지 이해를 못하겠음 예외 처리하자.
				//pt일때 현재날짜에 상품날짜를 더해준뒤에 입력해줘야 한다.
				String deadLineDateString = healthItem.getDeadlinedate();
				// 문자열을 LocalDate로 변환
		        LocalDate deadLineDate = LocalDate.parse(deadLineDateString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		        // 현재 날짜 구하기
		        LocalDate currentDate01 = LocalDate.now();
		        // 현재 날짜와 더하기
		        LocalDate newDate = currentDate01.plusYears(deadLineDate.getYear())
		                                       .plusMonths(deadLineDate.getMonthValue())
		                                       .plusDays(deadLineDate.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setPtdate(newDateString);
			}else if(healthItem.getHcontent().equals("1001")){
				//pt일때 현재날짜에 상품날짜를 더해준뒤에 입력해줘야 한다.
				String deadLineDateString = healthItem.getDeadlinedate();
				// 문자열을 LocalDate로 변환
		        LocalDate deadLineDate = LocalDate.parse(deadLineDateString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		        // 현재 날짜 구하기
		        LocalDate currentDate01 = LocalDate.now();
		        // 현재 날짜와 더하기
		        LocalDate newDate = currentDate01.plusYears(deadLineDate.getYear())
		                                       .plusMonths(deadLineDate.getMonthValue())
		                                       .plusDays(deadLineDate.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setGxdate(newDateString);
			}else if(healthItem.getHcontent().equals("1000")){
				//pt일때 현재날짜에 상품날짜를 더해준뒤에 입력해줘야 한다.
				String deadLineDateString = healthItem.getDeadlinedate();
				// 문자열을 LocalDate로 변환
		        LocalDate deadLineDate = LocalDate.parse(deadLineDateString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		        // 현재 날짜 구하기
		        LocalDate currentDate01 = LocalDate.now();
		        // 현재 날짜와 더하기
		        LocalDate newDate = currentDate01.plusYears(deadLineDate.getYear())
		                                       .plusMonths(deadLineDate.getMonthValue())
		                                       .plusDays(deadLineDate.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setOpdate(newDateString);
			}else if(healthItem.getHcontent().equals("1101")){
				//pt일때 현재날짜에 상품날짜를 더해준뒤에 입력해줘야 한다.
				String deadLineDateString = healthItem.getDeadlinedate();
				// 문자열을 LocalDate로 변환
		        LocalDate deadLineDate = LocalDate.parse(deadLineDateString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		        // 현재 날짜 구하기
		        LocalDate currentDate01 = LocalDate.now();
		        // 현재 날짜와 더하기
		        LocalDate newDate = currentDate01.plusYears(deadLineDate.getYear())
		                                       .plusMonths(deadLineDate.getMonthValue())
		                                       .plusDays(deadLineDate.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setOpdate(newDateString);
				insertPayitem.setPtdate(newDateString);
				insertPayitem.setGxdate(newDateString);
			}
			insertPayitem.setItem(healthItem.getNum());
			insertPayitem.setPayflag(true);
			insertPayitem.setCcflag(false);
			insertPayitem.setPayback(false);
		}else{
			//구매 상품이 있을때 기한을 연장해서 입력받는다.
			insertPayitem.setUser(user.getNum());
			insertPayitem.setPaydate(formattedDate);
			//healthitem의 hcontent의 종류마다 다른 컬럼에 값을 넣는다.
			if(healthItem.getHcontent().equals("1100")){
				String payDateString = payitem.getPaydate();
		        String fcPeriodString = healthItem.getFcperiod();
		        // 문자열을 LocalDate로 변환
		        LocalDate payDate = LocalDate.parse(payDateString);
		        LocalDate fcPeriod = LocalDate.parse(fcPeriodString);
		        // fcPeriod를 payDate에 더하기
		        LocalDate newDate = payDate.plusYears(fcPeriod.getYear())
		                                   .plusMonths(fcPeriod.getMonthValue())
		                                   .plusDays(fcPeriod.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setPtdate(newDateString);
			}else if(healthItem.getHcontent().equals("1010")){
				//gpt인 경우 어덯게 저장할려는 건지 이해를 못하겠음 예외 처리하자.
				String payDateString = payitem.getPaydate();
		        String fcPeriodString = healthItem.getFcperiod();
		        // 문자열을 LocalDate로 변환
		        LocalDate payDate = LocalDate.parse(payDateString);
		        LocalDate fcPeriod = LocalDate.parse(fcPeriodString);
		        // fcPeriod를 payDate에 더하기
		        LocalDate newDate = payDate.plusYears(fcPeriod.getYear())
		                                   .plusMonths(fcPeriod.getMonthValue())
		                                   .plusDays(fcPeriod.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setPtdate(newDateString);
			}else if(healthItem.getHcontent().equals("1001")){
				String payDateString = payitem.getPaydate();
		        String fcPeriodString = healthItem.getFcperiod();
		        // 문자열을 LocalDate로 변환
		        LocalDate payDate = LocalDate.parse(payDateString);
		        LocalDate fcPeriod = LocalDate.parse(fcPeriodString);
		        // fcPeriod를 payDate에 더하기
		        LocalDate newDate = payDate.plusYears(fcPeriod.getYear())
		                                   .plusMonths(fcPeriod.getMonthValue())
		                                   .plusDays(fcPeriod.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setGxdate(newDateString);
			}else if(healthItem.getHcontent().equals("1000")){
				String payDateString = payitem.getPaydate();
		        String fcPeriodString = healthItem.getFcperiod();
		        // 문자열을 LocalDate로 변환
		        LocalDate payDate = LocalDate.parse(payDateString);
		        LocalDate fcPeriod = LocalDate.parse(fcPeriodString);
		        // fcPeriod를 payDate에 더하기
		        LocalDate newDate = payDate.plusYears(fcPeriod.getYear())
		                                   .plusMonths(fcPeriod.getMonthValue())
		                                   .plusDays(fcPeriod.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setOpdate(newDateString);
			}else if(healthItem.getHcontent().equals("1101")){
				String payDateString = payitem.getPaydate();
		        String fcPeriodString = healthItem.getFcperiod();
		        // 문자열을 LocalDate로 변환
		        LocalDate payDate = LocalDate.parse(payDateString);
		        LocalDate fcPeriod = LocalDate.parse(fcPeriodString);
		        // fcPeriod를 payDate에 더하기
		        LocalDate newDate = payDate.plusYears(fcPeriod.getYear())
		                                   .plusMonths(fcPeriod.getMonthValue())
		                                   .plusDays(fcPeriod.getDayOfMonth());
		        // LocalDate를 문자열로 변환
		        String newDateString = newDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				insertPayitem.setOpdate(newDateString);
				insertPayitem.setPtdate(newDateString);
				insertPayitem.setGxdate(newDateString);
			}
			insertPayitem.setItem(healthItem.getNum());
			
			insertPayitem.setPayflag(true);
			insertPayitem.setCcflag(false);
			insertPayitem.setPayback(false);
		}
		
		mgr.InsertPayitem(insertPayitem);
		
		
		
		
		
%>
<script>
	//결제 완료되었을때 상품의 시설 이용 기한을 새 상품에 더해서 저장한다.
	location.href="<%=request.getContextPath()%>/kimJeongTae/payForm.jsp";
</script>
