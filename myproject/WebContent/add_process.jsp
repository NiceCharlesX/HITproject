<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
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
	<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
		
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
		
		$('.reservationtime').daterangepicker(
				{
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
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
			
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> 
					 <a class="navbar-brand" href="<s:url action="showallact"> 
					 <s:param name="phonenumber"><s:property value="phonenumber" /></s:param>
					 <s:param name="username"><s:property value="username" /></s:param>
	                  <s:param name="useremail"><s:property value="useremail" /></s:param>
					 <s:param name="orderby">time</s:param>
					 </s:url>
					 ">主页</a>					 
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="#">Link</a>
						</li>
						<li>
							 <a href="#">Link</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">One more separated link</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">Link</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<ul class="breadcrumb">
				<li><a style='text-decoration:none'  href="<s:url action="showallact"> 
					 <s:param name="phonenumber"><s:property value="phonenumber" /></s:param>
					 <s:param name="username"><s:property value="username" /></s:param>
	                  <s:param name="useremail"><s:property value="useremail" /></s:param>
					 <s:param name="orderby">time</s:param>
					 </s:url>
					 ">主页</a></li>
				<li class="active">
					 添加活动
				</li>
				<li>
					添加进程
				</li>
			</ul>
		</div>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="progress progress-striped active">
			    <div class="progress-bar" role="progressbar" aria-valuenow="60" 
			        aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
			        <span class="sr-only">100% 完成</span>
			    </div>
			</div>
		</div>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-12 column">
				<ul class="nav nav-tabs">
					<li>
						 <a href="#panel-0" data-toggle="tab">空模版</a>
					</li>
					<li class="active">
						 <a href="#panel-307605" data-toggle="tab">模版一</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane " id="panel-0">

						<form class="form-horizontal" role="form" action="createschedule">
						<input type="hidden" name="actid" value="<s:property value = "actid"/>" />
						<input type="hidden" name="phonenumber" value="<s:property value = "phonenumber" />" />	
						<input type="hidden" name="username" value="<s:property value = "username" />" />	
						<input type="hidden" name="useremail" value="<s:property value = "useremail" />" />			
						</br>
						<label for="Name" style="font-size:large;">填写进程</label>
							<div class="yd_box">		
								<div class = "movie_box">
									<br/>
									<ul class="wjdc_list">
									 <li >
				          				<div class="tm_btitlt"><i class="btwenzi" style="font-size:large;">活动进程</i><i class="nmb" style="font-size:large;">1</i></div>
				       				</li>
									<li>
									<div class="form-group">
										<label for="Name" style="font-size:large;position:relative;left:40px;color: #6a7989">起止时间</label>
					          			<div class="input-prepend input-group" style="position:relative;left:40px">
					                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
					                       <input type="text" style="width: 250px" name="time"  class="form-control reservationtime input-sm" value="11/16/2016 8:00 PM - 11/16/2016 8:30 PM"  class="span4" />
					                     </div>        			       	         			
									</div>
									</li>
									
									<li>
									<div>
											<span class="myinput input--jiro">
												<input class="input__field input__field--jiro" style="height:40px" type="text" id="Name" name="person"  />
												<label class="input__label input__label--jiro" for="input-10">
													<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">主持人</span>
												</label>
											</span>
									</div>	
									</li>
									
									<li>
									<div>
											<span class="myinput input--jiro">
												<input class="input__field input__field--jiro" style="height:40px" type="text" id="Name" name="place"  />
												<label class="input__label input__label--jiro" for="input-10">
													<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">地点</span>
												</label>
											</span>
									</div>
									</li>
									
									<li>
									</br>
									<div class="form-group" style="font-size:large;position:relative;left:40px;color: #6a7989">
										<label for="Name" >内容</label>
										<div class="textarea" >
				                  			<textarea rows = "2" cols = "29" name="contents"> </textarea>
				           			 	</div>
									</div>
									</li>		
									</ul>
									<br/>
								</div>
								<a href="javascript:void(0)" class="zjxx">增加活动进程</a> 
							</div>
							<br/>
							<button class="button button--winona buttonbody" data-text="Submit" type="submit"><span>Submit</span></button>
							</form>
					</div>
					<div class="tab-pane active" id="panel-307605">
						<p>
							此处应是模版一的内容
						</p>
					</div>
				</div>
		</div>
	</div>
	
</div>

<script src="js/classie.js"></script>
		<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
</script>

</body>
</html>