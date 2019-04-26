var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,13);  //调用layui表格
	tool();
	$('.layui-table').children().children().children('th').eq(1).css("display","none");
	$("#close").click(function(){
		window.location.reload();
	})
});
var num=0;
function fenye(keyWord,pagenum,limit) {
	var tableins=table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height : 570,  //表格的高度
		url :'wh/getAllSpInfo',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord
		},
		cols : [ [ 
		     {field: 'spBarCode',title: '商品条形码',width:150}
		    ,{field : 'spId',title :'',style:'display:none'}
		    ,{field: 'spName',title: '商品名称',width:130}
		    ,{field: 'spAllNum',title: '库存数量', sort: true,width:130}
	        ,{field: 'gmName',title: '计量单位', sort: true,width:120}
	        ,{field: 'glName', title: '商品品牌', sort: true,width:150}
	        ,{field: 'sptName',title: '商品类型', sort: true,width:140}
	        ,{field : 'whName',title : '所在仓库',sort : true,width:140}
			,{field : 'ocRealName',title : '仓库负责人',sort : true,width:140}
			,{field : 'whAddress',title : '仓库地址',sort : true,width:140}
			,{field : 'whphone',title : '仓库电话',sort : true,width:150}
			,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:150}
               ] ],
         //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done : function(res) {
			$('.layui-table').children().children().children('th').eq(1).css("display","none");
		  if(num==0){
		  tool($("#ipt").val(),res.count);  //调用tool()函数   启用分页条  并传总数据数  res.count 
		  num+=1;
		  }
		}
	});
//	库存预警操作
$("#danger").click(function(){
 tableins.reload({
		url: 'wh/getAllSpInfo',
		where:{
			"danger":"true",
			"keyWord":"",
			"pageNum":1,
			"limit":13
		},done:function(){
			$('.layui-table').children().children().children('th').eq(1).css("display","none");
		}
	});

})
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
//查看商品详情
function cli(obj){
	var spId=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html()
	var tableins=table.render({
				 id: 'test'
			    ,elem: '#test'
			    ,url: 'wh/getAllRepertory',
			    where:{
			    	spId:spId
			    }
			    ,cols: [[ //表头
			       {field: 'rtId', title: '库存单号',sort: true, fixed: 'left'}
			      ,{field: 'spName',title: '商品名称',}
			      ,{field: 'rtNumber',title: '商品数量', sort: true}
			      ,{field: 'gmName',title: '计量单位', sort: true}
			      ,{field: 'spBuyPrice', title: '商品进价(元)', sort: true,} 
			      ,{field: 'rtbegDate',title: '生产日期', sort: true,} 
			      ,{field: 'rtPeriod',title: '保质期'}
			      ,{field: 'rtEndDate',title: '到期时间'}
			    ]]
			  }); 
	$("#getUserByKey").click(function(){
		var keyword=$("#keyWord").val();
		  tableins.reload({
				url: 'wh/getAllRepertory',
				where:{
					"spId":spId,
					"keyWord":keyword
				}
			});
	})

}
//库存预警

//日期处理
/*function dateTwo(obj){
	var dateTwo=$(obj).val();
	var dateOne=$("#date1").val();
	if(dateOne>dateTwo){
		alert("第一个日期不能大于第二个日期");
	}else if(dateOne==""){
		alert("第一个日期不能为空！")
	}else{
		fenye($("#ipt").val(),1,10);
	}
}*/
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {
        $.ajax({
            url:"wh/getAllSpInfo",
            data:{
                pageNum: 1,
                limit: 13,
                keyWord: $("#ipt").val()
            },
            success:function (data) {
                fenye($("#ipt").val(), 1,13)
                tool($("#ipt").val(),data.count);
                $('.layui-table').children().children().children('th').eq(1).css("display","none");
            }
        })
    	
    }
}
