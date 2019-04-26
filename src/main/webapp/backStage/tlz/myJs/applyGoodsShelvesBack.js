 $("body").delegate("#shenhe2","click", function(){ 
	 
	   var  spName=$(this).parent().parent().find("input[name=spName]").val();
	   var  spId=$(this).parent().parent().find("input[name=spId]").val();
	   var  sptName=$(this).parent().parent().find("input[name=sptName]").val();
	   var  gdName=$(this).parent().parent().find("input[name=gdName]").val();
	 
	 
	 var ids = [];   //定义记录数组
	 ids.push(spName);
	 $("#lastTr > tr").each(function(){
	 	
	 var kc = $(this).children("td:eq(1)").text();
	 if(ids.indexOf(kc)<0){
	 ids.push(kc);
	 }else{
	 alert("不能重复添加！！");
	 $(this).remove();
	 }

	 }); 
	 
	 

   
   var  tr="<tr>";
   tr+="<td>"+spId+"</td>";
    tr+="<td >"+spName+"</td>";
     tr+="<td>"+sptName+"</td>";
      tr+="<td>"+gdName+"</td>";
         tr+="<td class='center'><button class='btn btn-primary' style='height:25px;padding-top:1px;' onclick='del(this)' >删除</button></td>";
   tr+="</tr>";

$("#lastTr").append(tr);
   


   var open=true;//confirm("确认提交申请！！")
   
  if(open==true){
            
  // $('#testSelect option:selected').text();//选中的文本
   //alert($('#select1 option:selected') .val());
  //  alert($('#select2 option:selected') .val());
    // alert($('#select3 option:selected') .val());
     var  spId=$(this).parent().parent().find("#spId").val();
     var  dnNum=$("#dnNum").val();
  
       $.ajax({
       //  url:"updateApplyGoodsShelf2",
           contentType:"application/json;charset=utf-8", 
         type:"post",
        // data:'{"gdId":gdId,"dpId":dpId,"anId":anId,"bnId":bnId,"spId":spId}',
        data:"{\"dnNum\":\""+dnNum+"\",\"spId\":\""+spId+"\"}",
          dataType:"json",
         success:function(datas){
        if(datas!=null){
          window.location.href="backStage/tlz/applyGoodsShelvesBack.jsp";
        }
         }
       })
   
               
  }else{
  //alert(2)
   }
  
  });
 
   function tijiaoLast2(){
	   
	   //tijiaoLast();
	 
	 //  alert(22);
   }
 
 
 function tijiaoLast(){
	 var  ucReason=$('#select2 option:selected') .val();
	   var jsonArr=new Array();
	 $('#lastTr  tr').each(function(){                   // 遍历 tr
		   var spId=$(this).children('td').eq(0).html(); 
		   
		   josnStr={"spId":spId,"ucReason":ucReason},
		   
         jsonArr.push(josnStr);
		   
		       });
	   //alert(JSON.stringify(jsonArr));
	 
	   
	   var open=confirm("确认提交申请！！");
	   if(open==true){
	             
	   // $('#testSelect option:selected').text();//选中的文本
	    //alert($('#select1 option:selected') .val());
	   //  alert($('#select2 option:selected') .val());
	     // alert($('#select3 option:selected') .val());
	        $.ajax({
	         url:"updateApplyGoodsShelf2",
	          contentType:"application/json;charset=utf-8", 
		         type:"post",
		        data:JSON.stringify(jsonArr),
		          dataType:"json",
		         success:function(datas){
	         if(datas!=null){
	           window.location.href="backStage/tlz/applyGoodsShelvesBack.jsp";
	         }
	          }
	        })
	    
	                
	   }else{
	   //alert(2)
	    }
	   
 }
 