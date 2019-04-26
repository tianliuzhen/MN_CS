var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
//日期

/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,13,"","");  //调用layui表格
	tool();
});
var num=0;
function fenye(keyWord,pagenum,limit,dateOne,dateTwo) {
	table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height : 570,  //表格的高度
		url :'wh/getAllInHouse',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			dateOne:dateOne,
			dateTwo:dateTwo
		},
		cols : [ [ 
		{field : 'InId',title : '入库单号',sort : true,}, 
		{field : 'whName',title : '所在仓库',sort : true,}, 
		{field : 'ocRealName',title : '仓库负责人',sort : true,}, 
		{field : 'ocAddress',title : '负责人地址',sort : true,},
		{field : 'ocPhone',title : '负责人电话',sort : true,},
		{field : 'whAddress',title : '仓库地址',sort : true,},
		{field : 'whphone',title : '仓库电话',sort : true,},
		{field : 'inDate',title : '入库时间',sort : true,},
		{fixed: 'right', title:'操作', toolbar: '#barDemo',}
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
				fenye($("#ipt").val(),obj.curr,obj.limit,"","");
			}
		}
	});
}
//审核所有待审核的采购单
function cli(obj){
	var InId=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().children().html()
	var tableins=table.render({
				 id: 'test'
			    ,elem: '#test'
			    ,url: 'wh/getAllInHouseInfo',
			    where:{
			    	InId:InId
			    }
			    ,cols: [[ //表头
			       {field: 'inId', title: '入库单号', width:150, sort: true, fixed: 'left'}
			      ,{field: 'spName', width:130,title: '商品名称',}
			      ,{field: 'inuNum', width:130,title: '商品数量', sort: true}
			      ,{field: 'gmName', width:130,title: '计量单位', sort: true}
			      ,{field: 'glName', width:130,title: '商品品牌', sort: true}
			      ,{field: 'sptName', width:130,title: '商品类型', sort: true}
			      ,{field: 'spBuyPrice',width:130, title: '商品进价', sort: true,} 
			      ,{field: 'rtbegDate',width:140, title: '生产日期', sort: true,} 
			      ,{field: 'rtPeriod', width:130,title: '保质期'}
			      ,{field: 'rtEndDate', width:148,title: '到期时间'}
			    ]]	         
			  }); 
	$("#getUserByKey").click(function(){
		var keyword=$("#keyWord").val();
		  tableins.reload({
				url: 'wh/getAllInHouseInfo',
				where:{
					"InId":InId,
					"keyWord":keyword
				}
			  
			});
	})

}
//日期处理
/*function dateTwo(obj){
	alert("123")
	var dateTwo=$(obj).val();
	var dateOne=$("#date1").val();
	if(dateOne>dateTwo){
		alert("第一个日期不能大于第二个日期");
	}else if(dateOne==""){
		alert("第一个日期不能为空！")
	}else{
		fenye($("#ipt").val(),1,10,dateOne,dateTwo);
	}
}*/
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {
        $.ajax({
            url:"wh/getAllInHouse",
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
