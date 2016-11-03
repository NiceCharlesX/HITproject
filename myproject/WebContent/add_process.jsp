<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
   <meta charset="utf-8"> 
   <title>添加活动界面</title>
   <meta name="viewport"
          content=" height = device-height,
                    width = device-width,
                    initial-scale = 1.0,
                    minimum-scale = 1.0,
                    maximum-scale = 1.0,
                    user-scalable = no"/>
                   
   	<script src="js/bootstrap.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">

	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css"rel="stylesheet">
	<link href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css"
		rel="stylesheet">
	<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css"/>
		
	<script type="text/javascript" src="js/jquery.min.js">
	</script>
	
	
	<script type="text/javascript" src="js/bootstrap.min.js">
	</script>
	<script type="text/javascript" src="js/moment.js">
	</script>
	<script type="text/javascript" src="js/daterangepicker.js">
	</script>
	
	
	<script src="js/bootstrap-select.js"></script>
  	<link rel="stylesheet" href="css/bootstrap-select.css">
	
	<script src="jquery/jquery-1.8.3.min.js"></script>
	<script> var jq183 = jQuery.noConflict(true); </script>

<script>
jq183(document).ready(function(e) {
    jq183(".btwen_text").val("题目");
	 jq183(".btwen_text_dx").val("单选题目");
	 jq183(".btwen_text_duox").val("多选题目");
	  jq183(".btwen_text_tk").val("填空题目"); 
	
	jq183(".leftbtwen_text").val("例子：CCTV1，CCTV2，CCTV3");
	jq183(".xxk_title li").click(function(){
		var xxkjs = jq183(this).index(); 
		jq183(this).addClass("on").siblings().removeClass("on");
		jq183(".xxk_conn").children(".xxk_xzqh_box").eq(xxkjs).show().siblings().hide();
		 
		});
		
	//鼠标移上去显示按钮
	
	jq183(".movie_box").live("hover",function(event){ 
	if(event.type=='mouseenter'){
		var	html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='del' >删除</a></div>" 
	 		 jq183(this).css({"border":"1px solid #0099ff"}); 
			 jq183(this).children(".wjdc_list").after(html_cz);
	}
	else{
		jq183(this).css({"border":"1px solid #fff"}); 
		jq183(this).children(".kzqy_czbut").remove();
	}
	});
		

	
		//下移
		jq183(".xy").live("click", function() {  
			//文字的长度 
			var leng = jq183(".yd_box").children(".movie_box").length;
			var dqgs = jq183(this).parent(".kzqy_czbut").parent(".movie_box").index();  
			 
			if(dqgs < leng-1){
				var czxx = jq183(this).parent(".kzqy_czbut").parent(".movie_box");  
				var xyghtml = czxx.next().html();
				var syghtml = czxx.html(); 
				czxx.next().html(syghtml);
				czxx.html(xyghtml);
				//序号
				czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
				czxx.next().children(".wjdc_list").find(".nmb").text(dqgs+2);
				}else{
					alert("到底了");
					}  
		});
		//上移
		jq183(".sy").live("click", function() {
			//文字的长度 
		    var leng = jq183(".yd_box").children(".movie_box").length;
			var dqgs = jq183(this).parent(".kzqy_czbut").parent(".movie_box").index(); 
			if(dqgs > 0){
			var czxx = jq183(this).parent(".kzqy_czbut").parent(".movie_box");  
			var xyghtml = czxx.prev().html();
  			var syghtml = czxx.html();   
			czxx.prev().html(syghtml);
			czxx.html(xyghtml);
			//序号
			czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
			czxx.prev().children(".wjdc_list").find(".nmb").text(dqgs);
			
				}else{
					alert("到头了");
					}  
		});
		//删除
		jq183(".del").live("click", function() {  
			var czxx = jq183(this).parent(".kzqy_czbut").parent(".movie_box"); 
			var zgtitle_gs = czxx.parent(".yd_box").find(".movie_box").length;
			var xh_num = 0; 
			//重新编号
			czxx.parent(".yd_box").find(".movie_box").each(function() { 
				jq183(".yd_box").children(".movie_box").eq(xh_num).find(".nmb").text(xh_num);
				 xh_num++;
				//alert(xh_num);
            }); 
			 czxx.remove(); 	  		 
		});
		
		//编辑
		jq183(".bianji").live("click", function() {  
		    //编辑的时候禁止其他操作	
		    jq183(this).siblings().hide();
			//jq183(this).parent(".kzqy_czbut").parent(".movie_box").unbind("hover"); 
			var dxtm = jq183(".dxuan").html();
			var duoxtm = jq183(".duoxuan").html();
			var tktm = jq183(".tktm").html();
			var jztm = jq183(".jztm").html();
			//接受编辑内容的容器
			var dx_rq = jq183(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box");  
		    var title = dx_rq.attr("data-t");
			//alert(title);
			//题目选项的个数
			var timlrxm = jq183(this).parent(".kzqy_czbut").parent(".movie_box").children(".wjdc_list").children("li").length; 
			
			//单选题目
			if(title==0){
				dx_rq.show().html(dxtm);
				//模具题目选项的个数
				var bjxm_length = dx_rq.find(".title_itram").children(".kzjxx_iteam").length;
			    var dxtxx_html = dx_rq.find(".title_itram").children(".kzjxx_iteam").html(); 
				//添加选项题目
				for (var i_tmxx = bjxm_length; i_tmxx < timlrxm-1 ; i_tmxx++) {
                	 dx_rq.find(".title_itram").append("<div class='kzjxx_iteam'>"+dxtxx_html+"</div>"); 
                 }
				 //赋值文本框 
				 //题目标题
					var texte_bt_val = jq183(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
					dx_rq.find(".btwen_text").val(texte_bt_val);  
				 //遍历题目项目的文字
				 var  bjjs=0;
				 jq183(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() { 
					//可选框框
					 var ktksfcz = jq183(this).find("input").hasClass("wenb_input");
				    if(ktksfcz){
					  var jsxz_kk = jq183(this).index(); 
					 dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(jsxz_kk-1).find("label").remove();
					 } 
					 //题目选项
					var texte_val = jq183(this).find("span").text(); 
					dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs-1).find(".input_wenbk").val(texte_val);
					bjjs++
					 
                }); 
				}
			//多选题目	
			 if(title==1){
				dx_rq.show().html(duoxtm);
				//模具题目选项的个数
				var bjxm_length = dx_rq.find(".title_itram").children(".kzjxx_iteam").length;
			    var dxtxx_html = dx_rq.find(".title_itram").children(".kzjxx_iteam").html(); 
				//添加选项题目
				for (var i_tmxx = bjxm_length; i_tmxx < timlrxm-1 ; i_tmxx++) {
                	 dx_rq.find(".title_itram").append("<div class='kzjxx_iteam'>"+dxtxx_html+"</div>");
					 //alert(i_tmxx);
                 }
				 //赋值文本框 
				 //题目标题
					var texte_bt_val = jq183(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text(); 
					dx_rq.find(".btwen_text").val(texte_bt_val); 
				 //遍历题目项目的文字
				 var  bjjs=0;
				 jq183(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {  
					//可选框框
					 var ktksfcz = jq183(this).find("input").hasClass("wenb_input");
				    if(ktksfcz){
					  var jsxz_kk = jq183(this).index(); 
					 dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(jsxz_kk-1).find("label").remove();
					 } 
					//题目选项
					var texte_val = jq183(this).find("span").text(); 
					dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs-1).find(".input_wenbk").val(texte_val);
					bjjs++
					 
                });
			 }
			 //填空题目
			 if(title==2){
			 	dx_rq.show().html(tktm);
				 //赋值文本框 
				 //题目标题
					var texte_bt_val = jq183(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text(); 
					dx_rq.find(".btwen_text").val(texte_bt_val);   
			 }
			 //矩阵题目
			 if(title==3){
				dx_rq.show().html(jztm);
				}     		 
		}); 
		
		//增加选项  
		jq183(".zjxx").live("click", function() {  
			var zjxxx_html = jq183(this).parent(".yd_box").children(".movie_box").html();
			jq183(this).before("<div class='movie_box'>"+zjxxx_html+"</div>");
			var zjxxx = jq183(this).prev(".movie_box");
			var leng = jq183(this).parent(".yd_box").children(".movie_box").length;
			zjxxx.children(".wjdc_list").find(".nmb").text(leng);	
		});
		
	
		
		//删除一行 
		jq183(".del_xm").live("click", function() {  
			//获取编辑题目的个数
			var zuxxs_num = jq183(this).parent(".kzjxx_iteam").parent(".title_itram").children(".kzjxx_iteam").length;
			 if(zuxxs_num > 1){
				  jq183(this).parent(".kzjxx_iteam").remove();
				 }else{
					alert("手下留情");
					 } 
		});
		
		//取消编辑
		jq183(".dx_box .qxbj_but").live("click", function() {  
			 jq183(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();
			  jq183(".movie_box").css({"border":"1px solid #fff"});
			  jq183(".kzqy_czbut").remove(); 
			  // 			  
		});
		
		//完成编辑（编辑）
		jq183(".swcbj_but").live("click", function() {   
		var jcxxxx = jq183(this).parent(".bjqxwc_box").parent(".dx_box");
		//编辑题目选项的个数
		  var bjtm_xm_length = jcxxxx.find(".title_itram").children(".kzjxx_iteam").length;
		  var xmtit_length = jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").length-1;
		 
		 //添加选项题目
		 //添加选项
		 if(bjtm_xm_length > xmtit_length){
			var fzll = jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(1).html(); 
			  for(var toljs_add = 0 ; toljs_add < bjtm_xm_length - xmtit_length ; toljs_add++){
					 jcxxxx.parent(".movie_box").children(".wjdc_list").append("<li>"+fzll+"</li>") 
				  } 
			}
			//删除选项
			if(bjtm_xm_length < xmtit_length) {  
				 for(var toljs = xmtit_length ; toljs > bjtm_xm_length ; toljs--){
					 jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(toljs).remove();
					 } 
				}
			 
			 //赋值文本框 
			 //题目标题
			  var texte_bt_val_bj = jcxxxx.find(".btwen_text").val();  
			  jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text(texte_bt_val_bj); 
			 //遍历题目项目的文字
			  var  bjjs_bj=0;
			  jcxxxx.children(".title_itram").children(".kzjxx_iteam").each(function() { 
				 //题目选项
				 var texte_val_bj = jq183(this).find(".input_wenbk").val(); 
				 jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(bjjs_bj+1).find("span").text(texte_val_bj);
				 bjjs_bj++
				 //可填空  
				 var kxtk_yf = jq183(this).find(".fxk").is(':checked');	 
				 if(kxtk_yf){
					 //第几个被勾选
					 var jsxz = jq183(this).index();
					 //alert(jsxz);
					 jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(jsxz+1).find("span").after("<input name='' type='text' class='wenb_input'>");  
					 }  
                });  
			//清除	 
			 jq183(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();	
		});		
});

$(document).ready(function() {
		$('.reservation').daterangepicker(null, function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
		});
		
		$('.reservationtime').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            format: 'MM/DD/YYYY h:mm A'
          }, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
          });
		
	});

</script>
</head>

<body>
<label for="Name" >填写进程</label>
			<div class="yd_box">	
	
				<div class = "movie_box">
					<br/>
					<ul class="wjdc_list">
					 <li>
          				<div class="tm_btitlt"><i class="btwenzi">活动进程</i><i class="nmb">1</i></div>
       				</li>
					<li>
					<div class="form-group">
						<label for="Name" class="col-md-2">起止时间</label>
	          			<div class="input-prepend input-group col-md-5 ">
	                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
	                       <input type="text" style="width: 250px" name="reservation"  class="form-control reservationtime input-sm" value="08/01/2013 1:00 PM - 08/01/2013 1:30 PM"  class="span4"/>
	                     </div>        			       	         			
					</div>
					</li>
					<li>
					<div class="form-group">
						<label for="Name" class="col-md-2">主持人</label>
	          			<div class = "col-md-10 col-lg-4">
					 		<input type="text" class="form-control input-sm" id="Name" />
					 	</div>	          		      			       	         			
					</div>	
					</li>
					<li>
					<div class="form-group">
						<label for="Name" class="col-md-2">地点</label>
						<div class = "col-md-10 col-lg-4">
							<input type="text" class="form-control input-sm" id="Name"/>
						</div>
					</div>
					</li>
					
					<li>
					<div class="form-group">
						<label for="Name" class="col-md-2">内容</label>
						<div class="textarea col-md-10" >
                  			<textarea rows = "2" cols = "29"> </textarea>
           			 	</div>
					</div>
					</li>
					
					</ul>
					<br/>
					
				</div>
				<a href="javascript:void(0)" class="zjxx">增加活动进程</a> 
			</div>

</body>
</html>