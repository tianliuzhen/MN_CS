<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'ckcx.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="backStage/assets/yhx_js/jquery.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap-table.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap.min.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/layui.all.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap-table-zh-CN.min.js"></script>
<link rel="stylesheet" href="backStage/assets/yhx_css/table.css" type="text/css"></link>
<link rel="stylesheet"
	href="backStage/assets/yhx_css/bootstrap-table.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/layui.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/kccx.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/layui.css"
	type="text/css"></link>
<script type="text/javascript" src="backStage/assets/yhx_js/vue.js"></script>
<script type="text/javascript"
	src="backStage/assets/yhx_js/vue-resource.min.js"></script>
<style>
.layui-table th {
	font-size: 17px;
	text-align: center;
}
.layui-table td {
	font-size: 16px;
	text-align: center;
}
.layui-btn{
  text-align:center;
  margin-top:-5px;
}
#ipt,#ipt2 {
	height: 40px;
	width: 200px;
	font-size: 16px;
}

.layui-laypage-limits select {
	width: 90px;
}
 
#table_stock_before{ 
   position:relative;
   border:1px solid #cad9ea; 
      color:#666;}
#table_stock_before th { 
       background-repeat::repeat-x; 
          height:40px;}
 #table_stock_before th,#table_stock_before td{  
            border:1px solid #cad9ea;
                padding:0 1em 0;
                width:280px;
                 height:40px;
                 text-align:center;
                }
 #table_stock_before   tr { 
                   background-color:#f5fafe;}
 
 #addWh{
	width:400px;
}
#addWh td{
	
	height:20px;
	margin-bottom:0px;
}
#addWh td input{
	height:40px;
	width:300px;

}                  
 
 
  
.layui-table img {
    max-width: 48px;min-height: 48px;
}

 select{
  
  height:40px;
 }
</style>
</head>
<body style="background-color: #ececec;padding:20px;padding-top: 0px; height:1500px">
  </br>
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:500px;left:800px;">
	<div class="modal-dialog"  >
		<div class="modal-content"  >
			<div class="modal-header" id="top">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					采购确认
				</h4>
			</div>
			<div class="modal-body">
			<center>
			<form id="myForm" method="post">
				<table id="addWh">
				   <tr style="display:none">
				      <td>商品编号</td>
				      <td><input type="text"   id="add_spId" readonly></td>
				   </tr>
				   <tr>
				      <td>商品名称</td>
				      <td><input type="text"   id="add_spName" readonly>
				      </td>
				   </tr>
				  
				   <tr  >
				      <td>商品类型</td>
				      <td>
                         
						     <input   id="add_sptName"   type="text" class="validate"  readonly>
						     <input   id="add_sptId"  style="display:none" type="text" class="validate"  readonly>
                        </td>
				   </tr>
				   <tr>
				      <td>进价</td>
				      <td><input type="text"   id="add_spBuyPrice"  readonly></td>
				   </tr>
				  
				     <tr>
				      <td>进货单位</td>
				      <td>
                             <select id="ingm_sel" onchange="ingm_change()">
						      
						   </select> 
                       </td>
				   </tr>  
				     <tr>
				      <td>库存单位</td>
				      <td><input type="text" style="width:80px;display:none"  id="add_gmId"   readonly>
				          <input type="text" style="width:80px"  id="add_gmName" readonly> 
				           <input type="text" style="width:180px"  id="add_gmName_text" placeholder="容量数量"
				               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
                          onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"
				           ></td>
				   </tr>  
				    <tr>
				      <td>进货数量</td>
				      <td><input type="text"   id="add_BuyNumber" 
				          onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
                          onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"
				       ></td>
				   </tr>
				   <tr>
				      <td>仓库</td>
				      <td>
                        
						  <select id="ware_sel" onchange="ware_change()">
						      
						   </select>             
                      </td>
				   </tr>
				    <tr>
				      <td>供货商</td>
				      <td>
                          
						   <select id="sup_sel"  >
						      
						   </select>  
                      </td>
				   </tr>
				</table>
				</form>
				</center>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"  onclick="add_table()"> 
					确认添加
				</button>
				<button type="button" class="btn btn-default" id="closetan" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


	</div>
		<div style="background-color: #fff;padding: 20px;">
	<div id="title">
		<ul  >
		<h3  >&nbsp;&nbsp;采购管理</h3> <input value="${relaname}" style="display:none" id="relaname">
		  <input value="${ocId}" style="display:none" id="ocIdd">
		</ul>
	 </div></br>
	<div id="serch">
		<input type="text" id="ipt" placeholder="商品名称 回车查询" onkeyup="serch()">
		<input type="text" id="ipt2" placeholder="缺货数量查询 十万" onkeyup="serchnum()"
		   	           
		>
		 <button class="layui-btn layui-btn-normal"   onclick="chonggg()" style="position:relative;top:-3px;left:10px;z-index:400px;">重置</button> 
	  
  </div>
	<div id="date" style="position:absolute;left:1200px;top:110px;">
		 
          <span style="font-size:20px;color:gray;top:-15px;position:relative">  采购日期  </span>  
          <input   id="date_btn"  style="height:40px;top:-15px;position:relative"    onkeydown = "return false" readonly>
  </div>
	
	 
	<!-- layui表格渲染 -->
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	  
	   <table  id="table_stock_before">
                                    <thead>
                                        <tr>
									   <th>编号</th>
									  <th>商品名称</th> 
									  <th>进价</th>
									  <th>进货单位</th>
									  <th>单位容量</th>
									  <th>进货数量</th>
									  <th>储存仓库</th>
									  <th>供货商</th>
								        </tr>
								        
                                    </thead>
                                     <tbody id="tbody_stock_before">
                                    
                                    </tbody>
                                </table>
                   <button class="layui-btn layui-btn-normal" onclick="stock_add()" style="position:relative;top:10px;left:1400px">确认提交采购</button>             
	</div>
	<script type="text/html" id="barDemo">
     <button onclick="cli(this)"  class="layui-btn" data-toggle="modal" data-target="#myModal">采购</button>
    </script>
    
</body>
</html>
<script>
 var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,10);  //调用layui表格
	tool();
	$('.layui-table').children().children().children('th').eq(3).css("display","none");
	 
});
var num=0;
function fenye(keyWord,pagenum,limit) {
	var tableins=table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height : 430,  //表格的高度
		url :'stock/getspinfoalllay',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			spAllNum:$("#ipt2").val() 
		},
		cols : [ [ 
		     {field: 'spId', title: '编号' ,width:90, sort: true}
		    ,{field : 'spName',width:160, title :'商品名称' }
	        ,{field: 'spImage', width:160, title: '商品图片', templet:
	                                   '<div><img src="{{ d.spImage}}"></div>'}
	        ,{field: 'sptId', width:160, title: '类型编号', sort: true,style:"display:none"}
	        ,{field: 'sptName',width:175,  title: '商品类型', sort: true }
		    ,{field: 'gmName', width:150, title: '最小单位'}
		   ,{field: 'gsName', width:160, title: '规格', sort: true}
		   ,{field: 'spBuyPrice', width:160, title: '进价', sort: true}
		   ,{field: 'spAllNum', width:160,title: '库存数量', sort: true}
		   ,{field: 'spSalePrice',width:160,  title: '售价', sort: true}
	         ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:150,} 
               ] ],
               
         //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done : function(res) {
		      $("[data-field='spAllNum']").children().each(function(){
				if( $(this).text()<500){	
					  
					  $(this).css({"color":"red"})
				} 	
			 	  	});
		  
		      $('.layui-table').children().children().children('th').eq(3).css("display","none"); 
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
		limit:10,      //每页显示的条数
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
 var sel_ocId=$("#ocIdd").val();   
var check_id=0;
//选择采购选项
function cli(obj){
            //清除进货单位容量不可更改属性
           $("#add_gmName_text").removeAttr('readonly');
            
	   $("#addWh input").val("");
	   $("#addWh select").val("");
     
        $("#add_spId").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html());
        $("#add_spName").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html());
        $("#add_sptId").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html());
        $("#add_sptName").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().children().html());
        $("#add_spBuyPrice").val($(obj).parent().parent().prev().prev().prev().children().html());
        $("#add_gmName").val($(obj).parent().parent().prev().prev().prev().prev().prev().children().html());
     
	    $("#ware_btn2").val(2);
        $("#sup_btn2").val(2);
         var sptId_ti=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html()
        
        
         $.ajax({
          url:"stock/getSupplier",
          type:"post",
          data:{sptId:sptId_ti},
          dataType:"json",
            async:false,
          success:function(data){
               $("#sup_sel").html("");
            var option="";
                option+="<option selected='selected'>--请选择--</option>";
                 for(var i=0;i<data.length;i++){

                option+="<option value='"+data[i].supId+"'>"+data[i].supName+"</option>";
             }  
                $("#sup_sel").append(option);
          }     
        })
       
}
    var last_td=0;
 function add_table(){
		     var  wareopt=document.getElementById("ware_sel");
		
		   var wareindex=wareopt.selectedIndex ;            
		   /*  wareopt.options[wareindex].value;
		
		   wareopt.options[wareindex].text;     */
		              
		                 var  supopt=document.getElementById("sup_sel");
		
		   var supindex=supopt.selectedIndex ;            
		  
		   
		                 var  ingmopt=document.getElementById("ingm_sel");
		
		   var ingmindex=ingmopt.selectedIndex ;            
		    
		   
		    
          if(  $("#add_BuyNumber").val()=="" ||  $("#add_BuyNumber").val()<1 || $("#add_BuyNumber").val()>10000  ){
            alert("数量输入有误         注：最大10000");
            $("#add_BuyNumber").val("");
            $("#add_BuyNumber").focus();
            }else if($("#ingm_sel").val()==""){
              alert("进货单位未选择");
           }/* else if(ingmopt.options[ingmindex].text==$("#add_gmName").val() &&  $("#add_gmName_text").val()!=1){
                   $("#add_gmName_text").val(1);
		      $("#add_gmName_text").attr("readOnly","true");
           } */
           else if($("#add_gmName_text").val()==null || $("#add_gmName_text").val()=="" || $("#add_gmName_text").val()>500 ){
                    
                  alert("进货容量输入错误  注：最大500");
                  $("#add_gmName_text").val("");
                  $("#add_gmName_text").focous();
           }else if(wareindex==0){
                 alert("收入仓库未选择");
             //   $("#ware_btn").click();
           }else if(supindex==0){
                 alert("供货商未选择");
               // $("#sup_btn").click();
           } else{
              
        //      $("#closetan").click();
                          
                

              //表格为空时
                 if($("#table_stock_before tr").length==1){
                      $("#closetan").click();///////////////////////////////////
                             $("#table_stock_before").append("<tr ondblclick='del_old_add(this)'>"+
                                            "<td>"+ $("#add_spId").val( )+"</td>"+
                                            "<td>"+ $("#add_spName").val( )+"</td>"+
                                            "<td>"+ $("#add_spBuyPrice").val( )+"</td>"+
                                            
                                            "<td style='display:none'>"+ ingmopt.options[ingmindex].value+"</td>"+
                                            "<td>"+ ingmopt.options[ingmindex].text+"</td>"+
                                            "<td>"+ $("#add_gmName_text").val( )+"</td>"+
                                            "<td>"+ $("#add_BuyNumber").val( )+"</td>"+
                                            "<td style='display:none'>"+ wareopt.options[wareindex].value+"</td>"+
                                            "<td>"+ wareopt.options[wareindex].text+"</td>"+
                                              "<td style='display:none'>"+ supopt.options[supindex].value+"</td>"+
                                             "<td>"+ supopt.options[supindex].text+"</td>"+
                                               "<td style='display:none'>"+ last_td+"</td>"+
                                            "</tr>");  
               }else{ //表格不为空时  
                       var arr = [];  //定义数组 储存表格id
                // 循环表格获取id
               for ( var i = 1; i <$("#table_stock_before tr").length; i++) {
                       var tdid= $("#table_stock_before tr").eq(i).children().eq(0).text();
                                // 把id储存在arr数组中
								arr.push(tdid );
			}

               var arr2 = [];  //定义数组 储存单个供货商id
               var arrxu = [];  //定义数组 储存单个供货商的table序列
               var arrxuall = [];  //定义数组 储存所有的table序列
                // 循环表格获取id
               for ( var i = 1; i <$("#table_stock_before tr").length; i++) {
                  //     supopt.options[supindex].value
                       var supiddd= $("#table_stock_before tr").eq(i).children().eq(9).text();
                       var tdid2= $("#table_stock_before tr").eq(i).children().eq(0).text();
                       var table_xu= $("#table_stock_before tr").eq(i).children().eq(11).text();
                            if(supiddd== supopt.options[supindex].value){
                                // 把id储存在arr数组中
								arr2.push(tdid2 );     //商品id
                                arrxu.push(table_xu);   //table序列
                            }   
                               arrxuall.push(table_xu);
                                
			}
                           last_td++;     
                        // 当有这个供货商提供的同样商品时
                       if(arr2.indexOf($("#add_spId").val( ))>-1){
                             var arr2onee=arr2.indexOf($("#add_spId").val( ));
                   //     alert("商品编号"+arr2onee);
                            var xu_id=  arrxu[arr2onee];
                     //      alert("table序列"+xu_id);
                          //得到表格中已有要添加商品的table id
                            var muns=arrxuall.indexOf(xu_id);
                      //      alert("muns"+muns);
                          //获取已有列供货商的id
					   var issup=$("#table_stock_before tr").eq(muns+1).children().eq(9).html();
                           //获取已有列商品进货单位
                        var jin_gs=$("#table_stock_before tr").eq(muns+1).children().eq(3).html();    
                        var jin_gsname=$("#table_stock_before tr").eq(muns+1).children().eq(4).html();  
                   //     alert("进货单位"+jin_gsname);  
                        
                          if(confirm("已有此操作,是否覆盖？")){ 
		       $("#closetan").click();//////////////////////////////////////////
                      $("#table_stock_before tr").eq(muns+1).children().eq(6).html(parseInt($("#add_BuyNumber").val()));//更改采购数量
                      $("#table_stock_before tr").eq(muns+1).children().eq(3).html(ingmopt.options[ingmindex].value);//更改商品单位id
                      $("#table_stock_before tr").eq(muns+1).children().eq(4).html(ingmopt.options[ingmindex].text);//更改商品单位name
                      $("#table_stock_before tr").eq(muns+1).children().eq(7).html(wareopt.options[wareindex].value);//更改商品录入仓库id
                      $("#table_stock_before tr").eq(muns+1).children().eq(8).html(wareopt.options[wareindex].text);//更改商品录入仓库name
                      $("#table_stock_before tr").eq(muns+1).children().eq(5).html($("#add_gmName_text").val( ));//更改商品单位的容量
                        }
                           
					}else{
					 $("#closetan").click();///////////////////////////
					   // 判断  表格中没有添加过的商品
                              //添加进货商品列表
                                        $("#table_stock_before").append("<tr ondblclick='del_old_add(this)'>"+
                                            "<td>"+ $("#add_spId").val( )+"</td>"+
                                            "<td>"+ $("#add_spName").val( )+"</td>"+
                                            "<td>"+ $("#add_spBuyPrice").val( )+"</td>"+
                                              
                                            "<td style='display:none'>"+ ingmopt.options[ingmindex].value+"</td>"+   //进货单位
                                            "<td>"+ ingmopt.options[ingmindex].text+"</td>"+
                                            "<td>"+ $("#add_gmName_text").val( )+"</td>"+
                                            
                                            "<td>"+ $("#add_BuyNumber").val( )+"</td>"+
                                             "<td style='display:none'>"+ wareopt.options[wareindex].value+"</td>"+
                                            "<td>"+ wareopt.options[wareindex].text+"</td>"+
                                              "<td style='display:none'>"+ supopt.options[supindex].value+"</td>"+
                                             "<td>"+ supopt.options[supindex].text+"</td>"+
                                             "<td style='display:none'>"+ last_td+"</td>"+
                                            
                                            "</tr>");       
					}
           
         }  }
       
   }
 
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {  
      num=0;
    	fenye($("#ipt").val(),1,10);
    	$('.layui-table').children().children().children('th').eq(3).css("display","none");
    }
}
 function serchnum(){          
    
          var regu = /^([1-9][0-9]*){1,3}$/;
          
    if(  regu.test( $("#ipt2").val()) && parseInt($("#ipt2").val())<99999 )
    {  
              if(event.keyCode==13){ 
				      num=0;
				    	fenye($("#ipt").val(),1,10);
				    	$('.layui-table').children().children().children('th').eq(3).css("display","none");
                  }
    }else{
      
      $("#ipt2").val("")
    }
    
     
}
 function chonggg(){
 num==0;
     $("#ipt").val("");
     $("#ipt2").val("");
     fenye("",1,10); 
   }
   
 //商品添加    添加到进货单 提交审核     table_stock_before
   function stock_add(){  
               //验证供货商仓库日期商品不为空
              if( $("#tbody_stock_before tr:visible").length==0){
                       alert("无商品");
              }else{
               
			                  $.ajax({                            //添加进货单
					          url:"stock/addstock",
					          type:"post",
					          data:{ 
					                
					                "stkDate":$("#date_btn").val(),
					                "ocId":$("#ocIdd").val(),
					               },  
					          dataType:"json",
					           async:false,
					          success:function(data){
					               
					          }
			                })
   
   
   
   
   
						 var ss= $("#tbody_stock_before").find("tr");
					       var i_num=$("#tbody_stock_before tr").length; //得到table的行数
					   for (var i = 0; i< i_num; i++) {                    //循环添加进货明细表
							     $.ajax({
							          url:"stock/addstockdetail",
							          type:"post",
							          data:{"spId":ss.eq(i).find("td").eq(0).text() ,
							                 "spName":ss.eq(i).find("td").eq(1).text(),
							                "spPrice":ss.eq(i).find("td").eq(2).text(),
							                "gmId":ss.eq(i).find("td").eq(3).text(),
							                "gmIdMark":ss.eq(i).find("td").eq(5).text(),
							                "spNumberdan":ss.eq(i).find("td").eq(6).text(),
							                "whId": ss.eq(i).find("td").eq(7).text(),
							                "supId": ss.eq(i).find("td").eq(9).text(),
							               },  
							          dataType:"json",
							          async:false,
							          success:function(data){
							             // 提交采购申请后清除table tbody_stock_before   
							             $("#tbody_stock_before").html("");      
							          }
							        })  
					        }
           }
   }
   
    $(function(){
	    //采购日期默认今天
	    var date = new Date();
   
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + "-" + month + "-" + strDate 
    $("#date_btn").val(currentdate);
	      
	     })
 
	     
   
    //   查询所有商品单位
    $(function(){
     
        $.ajax({
          url:"stock/getgoodsmeasure",
          type:"post",
          dataType:"json",
        //  async:false,
          success:function(data){
            var option="";
                option+="<option selected='selected' value=''>--请选择--</option>";
                for(var i=0;i<data.length;i++){
                option+="<option value='"+data[i].gmId+"'>"+data[i].gmName+"</option>";
             } 
                $("#ingm_sel").append(option);
          }
        })
      });
      //进货商品单位验证
    function ingm_change(){
      
       var  ingmopt=document.getElementById("ingm_sel");
		   var ingmindex=ingmopt.selectedIndex ;  
		  if( ingmopt.options[ingmindex].text==$("#add_gmName").val()){
                   $("#add_gmName_text").val(1);
		      $("#add_gmName_text").attr("readOnly","true");
		      }else{
		        $("#add_gmName_text").removeAttr('readonly');
		        $("#add_gmName_text").val("");
		      }
    }
  //ware_sel  查询仓库  ware_change()
  $(function(){
        $.ajax({
          url:"stock/getwarehouse",
          type:"post",
          dataType:"json",
        //  async:false,
          success:function(data){
            var option="";
                option+="<option selected='selected'>--请选择--</option>";
                for(var i=0;i<data.length;i++){
                option+="<option value='"+data[i].whId+"'>"+data[i].whName+"</option>";
             } 
                $("#ware_sel").append(option);
          }
        })
      });
     
       function del_old_add(a){
       
     
       var i=a.rowIndex; 
       
  if (confirm("是否删除这一列")){
       document.getElementById('tbody_stock_before').deleteRow(i-1); 
         } 
     }  
     function find(str,cha,num){
    var x=str.indexOf(cha);
    for(var i=0;i<num;i++){
        x=str.indexOf(cha,x+1);
    }
    return x;
    }
    
    $(function(){
   /*  alert(2);
      var str=[1,2,3]
      alert(str[1]); */
    })
</script>