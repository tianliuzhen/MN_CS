var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
var num2=0;
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,13);  //调用layui表格
	tool();
});
//在这处理到期时间
function bbb(obj){
	  var bzq=$(obj).parent().parent().prev().prev().prev().children().html()//保质期
	  if($(obj).val()!=""){
		   var date_old = new Date($(obj).val()); 
		   date_old.setDate(date_old.getDate() + parseInt(bzq)*30);
	       var ti_end=date_old.getFullYear() + '-' + (date_old.getMonth() + 1) + '-' + date_old.getDate();//到期时间
	       var mydate = new Date();
	       var str = "" + mydate.getFullYear() + "-";
	       str += (mydate.getMonth()+1) + "-";
	       str += mydate.getDate() + "-";
//	       判断日期大小
	       var start=new Date(ti_end.replace("-", "/").replace("-", "/"));
	       var end=new Date(str.replace("-", "/").replace("-", "/"));
	       var startTwo=new Date($(obj).val().replace("-", "/").replace("-", "/"));
	       if(startTwo>end){
	    	      $("#alert4").slideDown(1000, function() {
				  $(this).slideUp(2000)
				})
		    	  $("#autoCheck").css("display","none")
		    	  $("#sure").css("display","none")
		      }else if(start<end){
		    	  $("#alert5").slideDown(1000, function() {
					   $(this).slideUp(2000)
					})
	    	      $("#autoCheck").css("display","none")
	    	      $("#sure").css("display","none")
	      }else{
	    	      $("#autoCheck").css("display","inline")
	    	      $("#sure").css("display","inline")
	      }
	     $(obj).parent().parent().next().children().children().val(ti_end); 
	  }else{
		  $("#autoCheck").css("display","inline")
    	  $("#sure").css("display","inline")
		  $(obj).parent().parent().next().children().children().val("")
	  }//生产日期
   
}
//在这处理数量
function aaa(obj){
	 var sl=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().children().html()//保质期
	 var reg=/^[0-9]*$/;
	 if(reg.test($(obj).val())){
		 if(parseInt($(obj).val())>parseInt(sl)){
			 num2=1;
			 $("#alert1").slideDown(1000, function() {
				   $(this).slideUp(2000)
				   $(obj).val("")
				   $("#autoCheck").css("display","none")
	    	       $("#sure").css("display","none")
				})
		 }else{
			 num2=0;
			  $("#autoCheck").css("display","inline")
	    	  $("#sure").css("display","inline")
		 }
	 }else{
		 num2=1;
		 $("#alert2").slideDown(1000, function() {
			   $(this).slideUp(2000)
			   $(obj).val("")
			   $("#autoCheck").css("display","none")
	    	   $("#sure").css("display","none")
			})
	 }
}
var num=0;
function fenye(keyWord,pagenum,limit) {
	table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height : 570,  //表格的高度
		url : 'wh/getAllStockInfo',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
		},
		cols : [ [ 
		{field : 'stkId',title : '进货单号',sort : true,}, 
		{field : 'ocRealName',title : '进货人',sort : true,},
		{field : 'ocPhone',title : '进货人电话',sort : true,},
		{field : 'stkDate',title : '进货日期',sort : true,},
		{field : 'Stauts',title : '单据状态',templet: function(d){
	    	 if(d.Stauts==3){
	    		 return "<span class='status' style='color:red'>待验收</span>";
	    	 }else if(d.Stauts==4){
	    		 return "<span  class='status' style='color:green'>已验收</span>";
	    	 }
	          },sort : true,},
		{fixed: 'right', title:'操作', toolbar: '#barDemo', }
               ] ],
         //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done : function(res) {
		  if(num==0){
		  tool($("#ipt").val(),res.count);  //调用tool()函数   启用分页条  并传总数据数  res.count 
		  num+=1;
		  }
		}
	});
	
}
/*渲染分页工具条
  同样传入两个参数   关键字   总数据
*/
function tool(keyWord,count) {
	laypage.render({
		elem : 'fenye',//分页条的作用域   页面中di'v的id
		count : count,  //总数据数
		limit:13,      //每页显示的条数
		layout : [ 'prev', 'page', 'next','limit','skip' ],
		jump : function(obj, first) {
		/*判断如果不是第一页执行里面的方法*/
			if (!first) {
			/*重新调用分页方法*/
				fenye($("#ipt").val(),obj.curr,obj.limit);
			}
		}
	});
}
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {
        $.ajax({
            url:"wh/getAllStockInfo",
            data:{
                pageNum: 1,
                limit: 13,
                keyWord: $("#ipt").val()
            },
            success:function (data) {
                fenye($("#ipt").val(), 1, 13)
                tool($("#ipt").val(),data.count);
            }
        })
    }
}
//审核所有待审核的采购单
function cli(obj){
	var status=$(obj).parent().parent().prev().children().children().html()
	var stkId=$(obj).parent().parent().prev().prev().prev().prev().prev().children().html()
	var tableins=table.render({
				 id: 'test'
			    ,elem: '#test'
			    ,url: 'wh/getStockdetail',
			    where:{
			    	stkId:stkId
			    }
			    ,cols: [[ //表头
			       {checkbox: true, fixed: true/*,LAY_CHECKED:true*/}
			      ,{field: 'sdId', title: '单号', width:155, sort: true, fixed: 'left'}
			      ,{field: 'spName', width:150,title: '商品名称',}
			      ,{field: 'spNumber', width:120,title: '商品数量', sort: true}
			      ,{field: 'gmName', width:120,title: '计量单位', sort: true}
			     /* ,{field: 'glName', width:120,title: '商品品牌', sort: true}*/
			      ,{field: 'sptName', width:120,title: '商品类型', sort: true}
			      ,{field: 'rtPeriod', width:120,title: '保质期(月)'}
			      ,{field: 'spBuyPrice',width:120, title: '商品进价', sort: true,} 
			      ,{field: 'whName',width:130, title: '录入仓库', sort: true,} 
			      /*,{field: 'ocRealName',width:120, title: '进货人', sort: true,} */
			      ,{field: 'rtbegDate',width:220, title: '生产日期', sort: true,templet: function(){
			    	  return "<input type='date' onchange='bbb(this)' style='text-align:center;padding:0 0 0 0;border:0px;width:180px;height:40px;font-size:16px;' class='bbb'>"
			      }} 
			     /* ,{field: 'rtEndDate', width:120,title: '到期时间',style:'display:none'}*/
			      ,{field: 'rtEndDate', width:120,title: '到期时间',templet: function(){
			    	  return "<input readonly='readonly' style='padding:0 0 0 0;border:0px;width:80px;height:40px' class='ccc'>"
			      }}
			      ,{field: 'srsl',width:143, title: '实入数量', sort: true,templet: function(){
			    	  return "<input onblur='aaa(this) 'style='padding:0 0 0 0;border:0px;width:80px;height:40px' class='aaa'>"
			      }}
			      ,{field: 'stkId', width:120,title: '单号id',style:'display:none'}
			      ,{field: 'ocId', width:120,title: '负责人id',style:'display:none'}
			      ,{field: 'whId', width:120,title: '仓库id',style:'display:none'}
			      ,{field: 'spId', width:120,title: '商品id',style:'display:none'}
			      ,{field: 'id', title: '序号号', width:155, sort: true, style:'display:none'}
			    ]]
	          ,done:function(){
	        	 $(".laytable-cell-2-id").css("display","none")
	        	 $(".laytable-cell-2-spId").css("display","none")
	        	 $(".laytable-cell-2-whId").css("display","none")
	        	/* $(".laytable-cell-2-rtPeriod").css("display","none")*/
	        	// $(".laytable-cell-2-rtEndDate").css("display","none")
	        	 $(".laytable-cell-2-ocId").css("display","none")
	        	 $(".laytable-cell-2-stkId").css("display","none")
	          }
			  }); 
	//分批次验收
	$("#autoCheck").click(function(){
		var num0=0;
		 var checkStatus = table.checkStatus('test'); //test即为基础参数id对应的值checkStatus.data.length
			if(checkStatus.data.length>0){
				if(window.confirm('是否确认验收？（验收数量如果不填默认为0)')){
				 for(var i=0;i<checkStatus.data.length;i++){
//			 如果数量没填  让他为空
				if($("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val()==""||$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val()==0){
					$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").remove()
				    $("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".laytable-cell-2-0-9").append("<input readonly='readonly' style='text-align:center;padding:0 0 0 0;border:0px;width:180px;height:40px;font-size:16px;'class='bbb'>")
				    $("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").val("无")
					$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".ccc").val("无")
					$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val(0);
				}
				 }
				}else{
					return false;
				}
//			判断是否有选中行
			
						var list=[];
						var count=0;
						 for(var i=0;i<checkStatus.data.length;i++){
							 if($("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").val()!=""){
								 count=0;
								 var jsonData="{"
									 jsonData+="\"spId\":\""+checkStatus.data[i].spId+"\",";
								     jsonData+="\"sdId\":\""+checkStatus.data[i].sdId+"\",";
									 jsonData+="\"stkId\":\""+checkStatus.data[i].stkId+"\",";
									 jsonData+="\"ocId\":\""+checkStatus.data[i].ocId+"\",";
									 jsonData+="\"whId\":\""+checkStatus.data[i].whId+"\",";
									 jsonData+="\"spNumber\":\""+checkStatus.data[i].spNumber+"\",";
									 jsonData+="\"srsl\":\""+$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val()+"\",";
									 jsonData+="\"rtbegDate\":\""+$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").val()+"\",";
									 jsonData+="\"rtPeriod\":\""+checkStatus.data[i].rtPeriod+"\",";
									 jsonData+="\"rtEndDate\":\""+$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".ccc").val()+"\",";
									 jsonData+="\"spBuyPrice\":\""+checkStatus.data[i].spBuyPrice+"\",";
									 jsonData=jsonData.substring(0,jsonData.length-1)+"}"
									 list.push(JSON.parse(jsonData))
							 }else{
								 count=1;
							 }
						 }
//						 验证数据没错  提交
						 if(count==0&num2!=1){
							 var keyword=$("#keyWord").val();
						 tableins.reload({
									url: 'wh/inHouse',
									where:{
										 list:list,
										"stkId":stkId,
										"keyWord":keyword,
										"status":0
									}
								});
						 }else if(count==1){
							 $("#alert6").slideDown(1000, function() {
								   $(this).slideUp(2000)
								})
						 }
				}else{
					 $("#alert3").slideDown(1000, function() {
						   $(this).slideUp(2000)
						})
				}	
	})
//	全部验收
	$("#sure").click(function(){
		 var checkStatus = table.checkStatus('test'); 
		 if(checkStatus.isAll){
//			var num0=0;
			 var checkStatus = table.checkStatus('test'); //test即为基础参数id对应的值checkStatus.data.length
				if(window.confirm('验收数量如果不填默认为0')){
					 for(var i=0;i<checkStatus.data.length;i++){
//				 如果数量没填  让他为空
					if($("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val()==""||$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val()==0){
						//if(window.confirm('您选择了一个什么都没填的商品。如果不填将默认')){
						$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").remove()
					    $("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".laytable-cell-2-0-9").append("<input readonly='readonly' style='text-align:center;padding:0 0 0 0;border:0px;width:180px;height:40px;font-size:16px;'class='bbb'>")
					    $("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").val("无")
						$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".ccc").val("无")
						$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val(0);
				/*		return true;
						}else{
							return false;
						}*/
					}
					 }
					}else{
						return false;
					}
//				判断是否有选中行
					if(checkStatus.data.length>0){
							var list=[];
							var count=0;
							 for(var i=0;i<checkStatus.data.length;i++){
								 if($("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").val()!=""){
									 count=0;
									 var jsonData="{"
										 jsonData+="\"spId\":\""+checkStatus.data[i].spId+"\",";
									     jsonData+="\"sdId\":\""+checkStatus.data[i].sdId+"\",";
										 jsonData+="\"stkId\":\""+checkStatus.data[i].stkId+"\",";
										 jsonData+="\"ocId\":\""+checkStatus.data[i].ocId+"\",";
										 jsonData+="\"whId\":\""+checkStatus.data[i].whId+"\",";
										 jsonData+="\"spNumber\":\""+checkStatus.data[i].spNumber+"\",";
										 jsonData+="\"srsl\":\""+$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".aaa").val()+"\",";
										 jsonData+="\"rtbegDate\":\""+$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".bbb").val()+"\",";
										 jsonData+="\"rtPeriod\":\""+checkStatus.data[i].rtPeriod+"\",";
										 jsonData+="\"rtEndDate\":\""+$("#myModal .layui-table tbody").children("tr").eq(checkStatus.data[i].id).find(".ccc").val()+"\",";
										 jsonData+="\"spBuyPrice\":\""+checkStatus.data[i].spBuyPrice+"\",";
										 jsonData=jsonData.substring(0,jsonData.length-1)+"}"
										 list.push(JSON.parse(jsonData))
								 }else{
									 count=1;
								 }
							 }
//							 验证数据没错  提交
							 if(count==0&num2!=1){
								 var keyword=$("#keyWord").val();
					    $.ajax({
									 url:"wh/inHouse",
									 data:{
										 list:list,
											"stkId":stkId,
											"keyWord":keyword,
											"status":1 
									 },
									 success:function(data){
										 window.location.reload();
									 }
								 })
							 }else if(count==1){
								 $("#alert6").slideDown(1000, function() {
									   $(this).slideUp(2000)
									})
							 }
					}else{
						 $("#alert3").slideDown(1000, function() {
							   $(this).slideUp(2000)
							})
					}	
		 }else{
			 $("#alert8").slideDown(1000, function() {
				   $(this).slideUp(2000)
				}) 
		 }
	})
//	模糊检索采购单详细
	$("#getUserByKey").click(function(){
		var keyword=$("#keyWord").val();
		  tableins.reload({
				url: 'wh/getStockdetail',
				where:{
					"stkId":stkId,
					"keyWord":keyword
				}
			});
	})
	if(status=="待验收"){
		$("#sure").css("display","inline")
	}else{
	/*	$("#myModal").css("width","1300px;")
		$("#myModal .layui-table-box").css("width","1500px")*/
		$("#sure").css("display","none")
		/*$("#myModal .layui-table-header table th").css("width","200px")*/
	}

}
//关闭模态框二时清除table
function closeTwo(){
	$("#myModal").css("display","none")
	$("#myModalThree").css("display","none")
	$(".modal-backdrop").css("display","none")
	$("#ocRealName").val("")
	$("#ocId").val("")
}
