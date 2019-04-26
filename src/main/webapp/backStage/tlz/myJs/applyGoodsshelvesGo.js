
	function  	   tijiaoLast(){
		   var jsonArr=new Array();
		   $('#lastTr  tr').each(function(i){                   // 遍历 tr
			   var spId=$(this).children('td').eq(0).html(); 
			   var  gdId=$(this).find("input[name=gdId]").val();
			     var  dpId=$(this).find("input[name=dpId]").val()
			      var  anId=$(this).find("input[name=anId]").val()
			       var  bnId=$(this).find("input[name=bnId]").val()
			   
			   josnStr={"gdId":gdId,"dpId":dpId,"anId":anId,"bnId":bnId,"spId":spId},
			   
	           jsonArr.push(josnStr);
			   
			       });
		//  alert(JSON.stringify(jsonArr));
		
		   $.ajax({
		         url:"updateApplyGoodsShelf",
		           contentType:"application/json;charset=utf-8", 
		         type:"post",
		        data:JSON.stringify(jsonArr),
		          dataType:"json",
		         success:function(datas){
		       
		        window.location.href="getAllapplyGoodsDept";
		        
		         }
		       })
	}