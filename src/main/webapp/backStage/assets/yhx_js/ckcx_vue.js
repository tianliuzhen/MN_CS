$(function() {
	      /*bootStrap表格   异步查询所有仓库信息*/
		$("#table").bootstrapTable({
			url : "wh/getAllWareHouse",
			method : 'post', // 请求方式（*）
			//striped : true, // 是否显示行间隔色
			cache : true, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			//sortable : true, //用 是否启排序	
			//sortOrder : "asc", // 排序方式		
			sidePagination : "client", // 分页方式：client客户端分页，server服务端分页（*）
			paginationPreText:"上一页",
			paginationNextText:"下一页",
			paginationHAlign:"keft",
			paginationLoop:true,
			pagination : true, // 是否显示分页（*）		
			pageNumber : 1, //如果设置了分页，首页页码	
			pageSize : 10, //每页的记录行数（*）	
			pageList : [ 10, 15, 16 ], //可供选择的每页的行数（*）	
		    onlyInfoPagination:false, //设置为 true 只显示总数据数，而不显示分页	
			//showRefresh : true, // 是否显示刷新按钮//	
			queryParamsType : '',
			//clickToSelect : true, // 是否启用点击选中行	
			//	uniqueId : "fileid", // 每一行的唯一标识，一般为主键列
			//showToggle : false, // 是否显示详细视图和列表视图的切换按钮	
			//	cardView : false, // 是否显示详细视图	
			//	detailView : false, // 是否显示父子表		
			search : true, //是否启用搜索框
		columns : [ 
		            {field : 'whId',title : '仓库编码',align: 'center',valign: 'middle'},
		            {field : 'ocId',title : '负责人id',valign:'middle',align: 'center',
		            cellStyle: function (row, index) {	
		    		 var style = {};    
		    		 style={css:{'display':'none'}};   
		    		 return style; }  },
			        {field : 'whName',title : '仓库名称',align: 'center',valign: 'middle'},
			        {field : 'ocRealName',title : '仓库负责人',align: 'center',valign: 'middle'},
			        {field : 'ocAddress',title : '负责人地址',align: 'center',valign: 'middle'},
			        {field : 'ocPhone',title : '负责人电话',align: 'center',valign: 'middle'},
			        {field : 'whAddress',title : '仓库地址',align: 'center',valign: 'middle'},
		            {field : 'whphone',title : '仓库电话',align: 'center',valign: 'middle'},
		            {field : 'whCreateDate',title : '成立时间',align: 'center',valign: 'middle'},
			        {title : '操作', align: 'center',valign: 'middle',
                         formatter: function (value, row, index) {
                                return '<button onclick="cli(this)" type="button" class="layui-btn" data-toggle="modal" data-target="#myModalThree">修改</button> <button class="layui-btn layui-btn-danger"  onclick="del(this)" >删除</button>';
                 }
		    }
		],
		               silent : true, // 刷新事件必须设置
		})
        /*设置隐藏列*/
		 $('#table').children().children().children('th').eq(1).css("display","none");
	})
	/* 获取到当前点击行  并且赋值*/
	function cli(obj){
	 var ckdh=$(obj).parent().prev().prev().html()
	 var ckdz=$(obj).parent().prev().prev().prev().html()
	 var ocName=$(obj).parent().prev().prev().prev().prev().prev().prev().html()
	 var ckmc=$(obj).parent().prev().prev().prev().prev().prev().prev().prev().html()
	 var ocId=$(obj).parent().prev().prev().prev().prev().prev().prev().prev().prev().html()
	 var whId=$(obj).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().html()
	 $("#ocIdTwo").val(ocId)
	 $("#ckdh").val(ckdh)
	 $("#ckdz").val(ckdz)
	 $("#ocName").val(ocName)
	 $("#ckmc").val(ckmc)
	 $("#whId").val(whId)
	}
/*删除仓库*/
function del(obj){
	var whId=$(obj).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().html()
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
	                	alert(res.status);
	                });
		        }
		    }
		});
        return true;
     }else{
        return false;
    }
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
					      ,{field: 'ocId', title: '员工编号', width:95, sort: true, fixed: 'left'}
					      ,{field: 'ocRealName', width:120,title: '员工姓名', }
					      ,{field: 'ocPhone', width:120,title: '联系电话', sort: true}
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
/*提交数据*/
function add(){
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
	                	alert(res.status);
	                });
		        }
		    }
		});
}
/*更新数据*/
new Vue({
	el:"#box",
	methods:{
		update:function(){
			var data=$("#myFormTwo").serializeArray();
			var url='wh/updateWh';
            //发送 post 请求
            this.$http.post(url,data,{emulateJSON:true}).then(function(res){
            	window.location.reload();
            },function(res){
            	alert(res.status);
            }); 
		}
	}
})
//关闭模态框二时清除table
function closeTwo(){
	$("#myModal").css("display","none")
	$("#myModalThree").css("display","none")
	$(".modal-backdrop").css("display","none")
	$("#ocRealName").val("")
	$("#ocId").val("")
}