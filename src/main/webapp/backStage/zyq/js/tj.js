var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,15,"","");  //调用layui表格
	tool();
});
var num=0;
function fenye(keyWord,pagenum,limit,beginDate,endDate) {
	table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height : 630,  //表格的高度
		url :'SpinfoOrder/queryAllSpinfoOrderDetail',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			beginDate:beginDate,
			endDate:endDate
		},
		cols : [ [ 
		{field :'soid',title : '交易流水号',sort : true,width:180,}, 
     {field: 'ssId', width:180,title: '销售订单编号', sort: true},
	    {field: 'ssSalePrice',width:180, title: '销售单价', sort: true,},
	    {field: 'ssSaleNum',width:180, title: '销售数量', sort: true,},
{field :'ocId',title : '收银员号',sort : true,width:180,}, 
		{field: 'mpId', width:180,title: '会员卡号',},
		{field: 'mpName', width:180,title: '会员姓名', sort: true},
	
		{field : 'ssDate',title : '消费时间',sort : true,width:180,},
		{field : 'ssPayType',title : '支付方式',sort : true,width:210,},
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
		limit:15,      //每页显示的条数
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
//日期处理
function  endDate(obj){
	var endDate=$(obj).val();
	var beginDate=$("#date1").val();
	if(beginDate>endDate){
		alert("第一个日期不能大于第二个日期");
	}else if(beginDate==""){
		alert("第一个日期不能为空！");
	}else{
		fenye($("#ipt").val(),1,10,beginDate,endDate);
	}
}
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {
    	fenye($("#ipt").val(),1,10,"","");
    }
}
