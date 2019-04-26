var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,13);  //调用layui表格
	tool();          //渲染分页工具条
	$('.layui-table').children().children().children('th').eq(1).css("display","none");
//	添加仓库验证仓库名字唯一
	$("#whName").blur(function(){
		$.ajax({
			url:"wh/checkWareName",
			type:"post",
			data:{
				whName:$(this).val()
			},
			success:function(data){
				if(data=="false"){
					$("#alert4").slideDown(1000, function() {
						   $(this).slideUp(2000)
					})
					$("#save").css("display","none")
				}else{
					$("#save").css("display","inline")
				}
			}
		})
	})
//	更新仓库验证
	$("#ckmc").blur(function(){
		$.ajax({
			url:"wh/checkWareName",
			type:"post",
			data:{
				whName:$(this).val(),
				whId:$("#whId").val()
			},
			success:function(data){
				if(data=="false"){
					$("#alert5").slideDown(1000, function() {
						   $(this).slideUp(2000)
					})
					$("#upda").css("display","none")
				}else{
					$("#upda").css("display","inline")
				}
			}
		})
	})
});
var num=0;
//查询所有仓库
function fenye(keyWord,pagenum,limit) {
	table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height :570,  //表格的高度
		url : 'wh/getAllWareHouse',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord
		},
		cols : [ [ 
		{field : 'whId',title : '仓库编码',sort : true,width:130}, 
		{field : 'ocId',title : '负责人id',sort : true,style:'display:none'},
		{field : 'whName',title : '仓库名称',sort : true,width:150}, 
		{field : 'ocRealName',title : '仓库负责人',sort : true,width:170}, 
		{field : 'ocAddress',title : '负责人地址',sort : true,width:180},
		{field : 'ocPhone',title : '负责人电话',sort : true,width:180},
		{field : 'whAddress',title : '仓库地址',sort : true,width:200},
		{field : 'whphone',title : '仓库电话',sort : true,width:200},
		{field : 'whCreateDate',title : '成立时间',sort : true,width:160},
		{fixed: 'right', title:'操作', toolbar: '#barDemo',width:190}
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
            url:"wh/getAllWareHouse",
            data:{
                pageNum: 1,
                limit: 13,
                keyWord: $("#ipt").val()
            },
            success:function (data) {
                fenye($("#ipt").val(), 1, 13)
                tool($("#ipt").val(),data.count);
                $('.layui-table').children().children().children('th').eq(1).css("display","none");
            }
        })
    	
    }
}
	/* 获取到当前点击行  并且赋值*/
	function cli(obj){
//		获取仓库ID
	 var whId=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html()
//	 查询
	 $.ajax({
		 url:"wh/getHouseByWhId",
		 type:"post",
		 DataType:"json",
		 data:{
			 WhId:whId
		 },
		 success:function(data){
//			 查到数据赋值
			 $("#ocIdTwo").val(data.ocId)
			 $("#ckdh").val(data.whphone)
			 $("#ckdz").val(data.whAddress)
			 $("#ocName").val(data.ocRealName)
			 $("#ckmc").val(data.whName)
			 $("#whId").val(data.whId)
		 }
	 })
	}
/*删除仓库 
 * 删除之前要先统计仓库里面是否有商品，如果有商品  不能删除
 * */
function del(obj){
	var whId=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html()
//	首先查询此仓库下有无商品
	$.ajax({
		url:"wh/getSpInfoByWhId",
		data:{
			whId:whId
		},
		success:function(data){
			if(data=="true"){
				if(window.confirm('你确定要删除此仓库吗？')){
					new Vue({
					   el:'#box',
					   mounted:function(){
					   this.post();
					   },
					    methods:{
					        post:function(){
					        	//请求传递的参数
					        	var postData={whId:whId};
					        	var url='wh/delWh';
					            //发送 post 请求
					            this.$http.post(url,postData,{emulateJSON:true}).then(function(res){
					            	window.location.reload();
				                },function(res){
				                });
					        }
					    }
					});
			        return true;
			     }else{
			        return false;
			    }
			}else{
				  $("#alert1").slideDown(1000, function() {
					   $(this).slideUp(2000)
					})
			}
		}
	})
/*	*/
}
/* 查询所有用户*/
function selectUser(){
	var table = layui.table;
	   var tableins=table.render({
						 id: 'test'
					    ,elem: '#test'
					    ,url: 'wh/getAllUser'
					    ,cols: [[ //表头
					       {checkbox: true, fixed: true}
					      ,{field: 'ocId', title: '编号', width:75, sort: true, fixed: 'left'}
					      ,{field: 'ocRealName', width:120,title: '员工姓名', }
					      ,{field: 'ocPhone', width:140,title: '联系电话', sort: true}
					      ,{field: 'ocSex',width:120, title: '员工性别', sort: true,} 
					    ]]
					  }); 
	   $("#sure").click(function(){
		    var checkStatus = table.checkStatus('test'); //test即为基础参数id对应的值
			if(checkStatus.data.length>1){
				alert("您只能选择一位负责人！")
				return false;
			}else{
				var ocId=checkStatus.data[0].ocId;
				var ocRealName=checkStatus.data[0].ocRealName;
				$("#ocId").val(ocId)
				$("#ocIdTwo").val(ocId)
				$("#ocRealName").val(ocRealName)
				$("#ocName").val(ocRealName)
				$("#myModalTwo").css("display","none")
			}
	   })
//    在模糊检索员工时 重载表格
	   $("#getUserByKey").click(function(){
		   tableins.reload({
				url: 'wh/getUserByKey'
			  ,where: { //设定异步数据接口的额外参数，任意设
				  "keyWord":$("#keyWord").val()
			  }
			});
	   })
}
//仓库名唯一验证

/*提交数据*/
function add(){
	  var whName=$("#whName").val();
	  var ocRealName=$("#ocRealName").val();
	  var whAddress=$("#whAddress").val();
	  var whphone=$("#whphone").val();
      var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
      var phone=/\d{3}-\d{8}|\d{4}-\d{7}/;
      if(reg.test(whName)&whName!=""&ocRealName!=""&whAddress!=""&phone.test(whphone)&whphone!=""){
    	  var data=$("#myForm").serializeArray();
    		new Vue({
    			   el:'#box',
    			   mounted:function(){
    			      this.post();
    			   },
    			    methods:{
    			        post:function(){
    			        	var url='wh/addWh';
    			            //发送 post 请求
    			            this.$http.post(url,data,{emulateJSON:true}).then(function(res){
    			            	window.location.reload();
    		                },function(res){
    		                });
    			        }
    			    }
    			});
		 }else{
			 $("#alert2").slideDown(1000, function() {
				   $(this).slideUp(2000)
				})
		 }/*esle{
	
		 }*/
}
/*更新数据*/
function update(){
	  var ckmc=$("#ckmc").val();
	  var ocName=$("#ocName").val();
	  var ckdz=$("#ckdz").val();
	  var ckdh=$("#ckdh").val();
	  var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
      var phone=/\d{3}-\d{8}|\d{4}-\d{7}/;
	  if(reg.test(ckmc)&ckmc!=""&ocName!=""&ckdz!=""&phone.test(ckdh)&ckdh!=""){
	var data=$("#myFormTwo").serializeArray();
	new Vue({
		el:"#box",
		 mounted:function(){
		      this.post();
		   },
		methods:{
			post:function(){
				var url='wh/updateWh';
	            //发送 post 请求
	            this.$http.post(url,data,{emulateJSON:true}).then(function(res){
	            	window.location.reload();
	            },function(res){
	            }); 
			}
		}
	})}else{
		 $("#alert3").slideDown(1000, function() {
			   $(this).slideUp(2000)
			})
	}
}

//关闭模态框二时清除table
function closeTwo(){
	$("#whName").val("");
	$("#ocRealName").val("")
	$("#whAddress").val("");
	$("#whphone").val("");
	$("#myModal").css("display","none")
	$("#myModalThree").css("display","none")
	$(".modal-backdrop").css("display","none")
	$("#ocRealName").val("")
	$("#ocId").val("")
}