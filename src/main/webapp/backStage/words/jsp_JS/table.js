$(function() {
		$("#table").bootstrapTable({
			url : "emp/getAll.action",
			method : 'post', // 请求方式（*）
			//striped : true, // 是否显示行间隔色
			//cache : true, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			//sortable : true, //用 是否启排序	
			//sortOrder : "asc", // 排序方式		
			//sidePagination : "client", // 分页方式：client客户端分页，server服务端分页（*）	
			pagination : true, // 是否显示分页（*）		
			pageNumber : 1, //如果设置了分页，首页页码	
			pageSize : 4, //每页的记录行数（*）	
			pageList : [ 4, 5, 6 ], //可供选择的每页的行数（*）	
		   // onlyInfoPagination:false, //设置为 true 只显示总数据数，而不显示分页	
			//showRefresh : true, // 是否显示刷新按钮//	
			//queryParamsType : '',
			//clickToSelect : true, // 是否启用点击选中行	
			//	uniqueId : "fileid", // 每一行的唯一标识，一般为主键列
			//showToggle : false, // 是否显示详细视图和列表视图的切换按钮	
			//	cardView : false, // 是否显示详细视图	
			//	detailView : false, // 是否显示父子表		
			search : true, //是否启用搜索框
			columns : [ 
			{
			field : 'sex',
			title : '性别',
			 align: 'center',
             valign: 'middle'
		    },
			{
			field : 'empno',
			title : '编号',
			 align: 'center',
             valign: 'middle'
		    },
			{
			field : 'address',
			title : '地址',
			 align: 'center',
             valign: 'middle'
		    },
			{
			field : 'dname',
			title : '部门',
			 align: 'center',
             valign: 'middle'
		    },
			{
			field : 'ename',
			title : '姓名',
			 align: 'center',
             valign: 'middle'
		    },
			{
			field : 'age',
			title : '年龄',
			 align: 'center',
             valign: 'middle'
		    },
			{
			title : '操作',
			 align: 'center',
             valign: 'middle',
               formatter: function (value, row, index) {
                   return '<button onclick="cli(this)" type="button" class="layui-btn">原始按钮</button>';
                 }
		    }
		],
		silent : true, // 刷新事件必须设置
		})
	})
	/* 获取到当前点击行 */
	function cli(obj){
	 alert($(obj).parent().prev().html())
	}