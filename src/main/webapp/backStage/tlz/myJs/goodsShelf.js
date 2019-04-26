    
   var lastspId=0;
   
function SaleUtil3(q){
	//  alert($(q).parent().parent().find("input[type='checkbox']").prop("checked"));
	  var tf=$(q).parent().parent().find("input[type='checkbox']");// 控制复选框
	 
	
	 var  gdName2buGoods=$(q).parent().parent().find("#gdName").val();
		var spId=$(q).parent().parent().find("#spId").val();
		
		lastspId=spId;
		
		var dpName=$(q).parent().parent().find("#dpName").val();
		var dnMaxNum=$(q).parent().parent().find("#dnMaxNum").val();
		var spDnNum=$(q).parent().parent().find("#spDnNum").val();
		var spName=$(q).parent().parent().find("#spName").val();
		var needGooDsNum=parseInt(dnMaxNum)-parseInt(spDnNum);
		
		
		
		
		
		  $.ajax({
	          url:"selectBuGoodsCheckIf",
	         type:"post",
	         data:{"spid":spId},
	          dataType:"text",
	         success:function(datas){
	        	
	        //	 alert(datas);
	        	 
	        	 if(datas=="补货待审核"){
	        		 $("#alert1").css('display','block');
	                //alert("已经提交,请等待审核 !");
	             }else{
	            	 $("#alert1").css('display','none');
	            	 $("#alert3").css("display","none");
	            	 if(tf.prop("checked")==false){   //勾选复选框
	           		  tf.prop('checked',true); 
	           	  }
	            	 var tr="";
	     		    tr+="<tr>";
	     		    tr+="<td >"+spId+"</td>";
	     		    tr+="<td>"+spName+"</td>";
	     		    
	     		    tr+="<td>"+needGooDsNum+"</td>"
	     		    tr+="<td>"+gdName2buGoods+"</td>";
	     		    tr+="<td><div class='switch'><label><input type='checkbox' name='test' onclick='ddd(this)'><span class='lever'> </span></label></div></td>"
	     		    tr+="</tr>"
	     		    
	     		 $("#lastTr").append(tr); 
	             }
	        	 
	        	 
	        	 
	        	 }
	         })
		
		
		
		
		
		
		
		    
		   /* 
		    * 去除重复
		    * */
		    var ids = [];   //定义记录数组
		    ids.push(spName);
		    $("#lastTr > tr").each(function(){
		    	
		    var kc = $(this).children("td:eq(1)").text();
		    if(ids.indexOf(kc)<0){
		    ids.push(kc);
		    $("#alertcun").hide();
		    }else{
		    //	alert("已经存在！！");
		    	$("#alertcun").show();
		    $(this).remove();
		    }
        
		    }); 
		    
   }
   
 
function SaleUtil4(q){
	
	//  alert($(q).parent().parent().find("input[type='checkbox']").prop("checked"));
	  var tf=$(q).parent().parent().parent().parent().find("input[type='checkbox']");// 控制复选框
	 
	 
	 var  gdName2buGoods=$(q).parent().parent().parent().parent().find("#gdName").val();
		var spId=$(q).parent().parent().parent().parent().find("#spId").val();
		
		lastspId=spId;
		
		var dpName=$(q).parent().parent().parent().parent().find("#dpName").val();
		var dnMaxNum=$(q).parent().parent().parent().parent().find("#dnMaxNum").val();
		var spDnNum=$(q).parent().parent().parent().parent().find("#spDnNum").val();
		var spName=$(q).parent().parent().parent().parent().find("#spName").val();
		var needGooDsNum=parseInt(dnMaxNum)-parseInt(spDnNum);
		
		 var ids = [];   //定义记录数组
		    ids.push(spName);
		
		
		  $.ajax({
	          url:"selectBuGoodsCheckIf",
	         type:"post",
	         data:{"spid":spId},
	          dataType:"text",
	         success:function(datas){
	        	
	        //	 alert(datas);
	        	 
	        	 if(datas=="补货待审核"){
	        		 $("#alert1").css('display','block');
	                //alert("已经提交,请等待审核 !");
	             }else{
	            	 
	            	 if(tf.prop("checked")==false){   
	     		   		
	            		 $("#alertcun").hide();
	    		   		 ids.push(spName);
	    		   		  
	    		   		 
	    		   		  
	    		   	     }else{
	    		   	    	 $("#alert1").css('display','none');
	    	            	 $("#alert3").css("display","none");
	    	            	
	    	            	 var tr="";
	    	     		    tr+="<tr>";
	    	     		    tr+="<td >"+spId+"</td>";
	    	     		    tr+="<td>"+spName+"</td>";
	    	     		    
	    	     		    tr+="<td>"+needGooDsNum+"</td>"
	    	     		    tr+="<td>"+gdName2buGoods+"</td>";
	    	     		    tr+="<td><div class='switch'><label><input type='checkbox' name='test' onclick='ddd(this)'><span class='lever'> </span></label></div></td>"
	    	     		    tr+="</tr>"
	    	     		    
	    	     		 $("#lastTr").append(tr); 
	    		   	     }
	            	
	             }
	        	 
	        	 
	        	 
	        	 }
	         })
		
		
		
		 

			
		
		
		    
		   /* 
		    * 去除重复
		    * */
		  
		    $("#lastTr > tr").each(function(){
		    	
		    var kc = $(this).children("td:eq(1)").text();
		    if(ids.indexOf(kc)<0){
		    ids.push(kc);
		    $("#alertcun").hide();
		    }else{
		    //	alert("已经存在！！");
		    	$("#alertcun").show();
		    $(this).remove();
		    }
        
		    }); 
		    
   } 

function deleteTR(){  //删除节点
	
	 //  $(d).parent().parent().remove();
	   
	  // alert(11);
	  $("input[name='test']:checked").each(function() { // 遍历选中的checkbox
          n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
          $("#lastTr").find("tr:eq("+n+")").remove();
      });
	   
  }

   
   function tijiaoLast(){  //提交申请
	 
	   if(lastspId==0){
		  
		   $("#alert3").css("display","block");
	   }else{
		   $("#alert3").css("display","none");
		   var jsonArr=new Array();
		   $('#lastTr  tr').each(function(i){                   // 遍历 tr
			   //alert($(this).children('td').eq(1).html());
			   var spId=$(this).children('td').eq(0).html(); 
			   var  spName=$(this).children('td').eq(1).html();
			   var needGooDsNum=$(this).children('td').eq(2).html();
			   var gdName=$(this).children('td').eq(3).html();
			   josnStr={"spId":spId,"spName":spName,"buNum":needGooDsNum,"gdName":gdName};
	           jsonArr.push(josnStr);
			   
			        $(this).children('td').each(function(j){  // 遍历 tr 的各个 td
			          // alert($(this).text());
			         });
			       });
		 //  alert(JSON.stringify(jsonArr));
		   
		   $.ajax({
		         url:"BackOrder2",
		        contentType:"application/json",
		          type:"post",
		          data:JSON.stringify(jsonArr),
		          success:function(data){
		     window.location.href="getAllMapGoodsDept";
		          }
		           })
		   
	   }
	   
	
	   
   }   
   var rtIdcvb123;
   var sptIdcvb123;
   var whIdcvb123;
   var spBuyPricecvb123;
   var guNumcvb123;
   function pandian(th){
	   
	   var rtEndDate=$(th).parent().parent().find("#rtEndDate").val();
	   
	/*   var rtEndDate2 = rtEndDate.replace(/-/g, '');
	   alert(getNowFormatDate().replace(/-/g, ''));*/
	    rtIdcvb123=$(th).parent().parent().find("#rtIdcvb123").val();
	    sptIdcvb123=$(th).parent().parent().find("#sptIdcvb123").val();
	    whIdcvb123=$(th).parent().parent().find("#whIdcvb123").val();
	    spBuyPricecvb123=$(th).parent().parent().find("#spBuyPricecvb123").val();
	    guNumcvb123=$(th).parent().parent().find("#guNumcvb123").val();
	//guTotalNumcvb123
	var    guTotalNumcvb123=$(th).parent().parent().find("#guTotalNumcvb123").val();
	    $("#goodsshelfhaiyou").val(guNumcvb123);
	  $("#SetPointNumxxx11").html(guTotalNumcvb123);
	    //SetPointNumxxx11
	    $.ajax({
		       url:"getslectRtnum",
		          type:"post",
		          data:{"rtid":rtIdcvb123},
		          success:function(data){
		        //	  alert(data);
		        	  $("#spendNumxxx11").html(data);
		        	
		  //   window.location.href="getAllMapGoodsDept";
		          }
		           })
	    
	    
	   
   }
   //goodsSuohui  goodsDiushi
   $("#goodsSuohui").focus(function(){
	   
	   $("#goodsSuohui").val("");
	 //  alert(checkNumber($("#goodsSuohui").val()));
   })
   
    
   
     $("#goodsDiushi").focus(function(){
	   
	   $("#goodsDiushi").val("");
   })
    $("#goodsSuohui").blur(function(){
	   var  allNum=parseInt($("#goodsshelfhaiyou").val());
	 
	   
	  if( checkNumber($("#goodsSuohui").val())==false || $("#goodsSuohui").val()=="" ||  parseInt($("#goodsSuohui").val()) >= parseInt($("#goodsshelfhaiyou").val()) || allNum-parseInt($("#goodsSuohui").val())-parseInt($("#goodsDiushi").val())<0){
		  $("#goodsSuohui").val(0);
		  $("#lastpandianggalert").show();
	  }else{
		  $("#alert2").css("display","none");
		  $("#lastpandianggalert").hide();
	  }
   })
     $("#goodsDiushi").blur(function(){
    	 var  allNum=parseInt($("#goodsshelfhaiyou").val());
    	 if(checkNumber($("#goodsDiushi").val())==false || $("#goodsDiushi").val()=="" ||  parseInt($("#goodsDiushi").val()) >= parseInt($("#goodsshelfhaiyou").val())   ||  allNum-parseInt($("#goodsSuohui").val())-parseInt($("#goodsDiushi").val())<0 ){
   		  $("#goodsDiushi").val(0);
   		 $("#lastpandianggalert").show();
   	  }else{
   		  $("#alert2").css("display","none");
   		 $("#lastpandianggalert").hide();
   	  }
   })
   var  numb1;
   function submitPandain(){
	   var    goodsSuohui=$("#goodsSuohui").val();
	   var    goodsDiushi=$("#goodsDiushi").val();
	   
	   
	   
	   
	   
	   if(goodsSuohui==0 && goodsDiushi==0){
		   $("#alert2").css("display","block");
	   }else{
		   $("#alert2").css("display","none");
		   $("#myModalpandian").modal("hide");
		   $("#myModalTidy").modal("hide");
		$('#getGoodsDeptclick').click();//更新数据
	   $.ajax({
	     url:"setpointGoodsShelf",
	        contentType:"application/json",
	          type:"post",
	          data:"{\"rtId\":\""+rtIdcvb123+"\",\"spId\":\""+sptIdcvb123+"\",\"whId\":\""+whIdcvb123+"\",\"spBuyPrice\":\""+spBuyPricecvb123+"\",\"sspDamageNum\":\""+goodsSuohui+"\",\"sspLackNum\":\""+goodsDiushi+"\"}",
	          success:function(data){
	        	  getGdname(quanJugdname); //刷新分页
	    //window.location.href="getAllMapGoodsDept";
	        	 $("#goodsSuohui").val(0);
	        	   $("#goodsDiushi").val(0);
	          }
	           })
	   }
	   
   }
   
 //验证字符串是否是数字
 function checkNumber(theObj) {
   var reg = /^[0-9]+.?[0-9]*$/;
   if (reg.test(theObj)) {
	 //  alert("true");
     return true;
   }
   return false;
 }//
 
 function getNowFormatDate() {
     var date = new Date();
     var seperator1 = "-";
     var year = date.getFullYear();
     var month = date.getMonth() + 1;
     var strDate = date.getDate();
     if (month >= 1 && month <= 9) {
         month = "0" + month;
     }
     if (strDate >= 0 && strDate <= 9) {
         strDate = "0" + strDate;
     }
     var currentdate = year + seperator1 + month + seperator1 + strDate;
     return currentdate;
 }
 function  getDaysByDateString(dateString1,dateString2){  //获取两个日期相差时间
     var  startDate=Date.parse(dateString1.replace('/-/g','/'));  
     var  endDate=Date.parse(dateString2.replace('/-/g','/')); 
	var diffDate=(endDate-startDate)+1*24*60*60*1000;  
	var days=diffDate/(1*24*60*60*1000);  
   //alert(diffDate/(1*24*60*60*1000));  
   return  days;  
}
