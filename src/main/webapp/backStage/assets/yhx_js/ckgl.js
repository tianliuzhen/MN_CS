var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,15,"","");  //调用layui表格
	tool();
});
var num=0;
function fenye(keyWord,pagenum,limit,dateOne,dateTwo) {
	table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height :570,  //表格的高度
		url :'wh/getAllBuGoods',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			dateOne:dateOne,
			dateTwo:dateTwo
		},
		cols : [ [ 
		{field : 'bgid',title : '补货单号',sort : true,}, 
		{field : 'ocid',title : '补货员',sort : true,}, 
		{field: 'spName', title: '商品名称',},
		{field: 'bgNum', title: '出库数量',},
		{field: 'gmName', title: '计量单位', sort: true},
	    {field: 'glName', title: '商品品牌', sort: true},
	    {field: 'sptName',title: '商品类型', sort: true},
	    {field: 'whName', title: '所出仓库', sort: true,},
		{field : 'whAddress',title : '仓库地址',sort : true,},
		{field : 'bgDate',title : '出库时间',sort : true,},
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
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {
        $.ajax({
            url:"wh/getAllBuGoods",
            data:{
                pageNum: 1,
                limit: 15,
                keyWord: $("#ipt").val()
            },
            success:function (data) {
                fenye($("#ipt").val(), 1, 15)
                tool($("#ipt").val(),data.count);
            }
        })
    }
}
