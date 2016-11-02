<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>jQuery自定义添加删除表单代码 - 站长素材</title>
<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">
<script src="jquery/jquery-1.8.3.min.js"></script>
<script> var jq183 = jQuery.noConflict(true); </script>

<script type="text/javascript" src="js/jquery.min.js"></script>


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
		var	html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='sy'>上移</a><a href='javascript:void(0)'  class='xy'>下移</a><a href='javascript:void(0)'  class='bianji'>编辑</a><a href='javascript:void(0)' class='del' >删除</a></div>" 
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
			 var zjxx_html =  jq183(this).prev(".title_itram").children(".kzjxx_iteam").html();
			 jq183(this).prev(".title_itram").append("<div class='kzjxx_iteam'>"+zjxx_html+"</div>"); 
		});
		
		
		jq183(".zjxxx").live("click",function(){
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

</script>
</head>

<body>
<div class=" all_660">

  <div class="yd_box">
    

    <div class="movie_box">
      <ul class="wjdc_list">
        <li>
          <div class="tm_btitlt"><i class="nmb">1</i>. <i class="btwenzi">你有多久的公务员资历？</i></div>
        </li>
        <li>
          <label>
            <input name="a" type="radio" value="">
            <span>0-3年</span></label>
        </li>
        <li>
          <label>
            <input name="a" type="radio" value="">
             <span>4-10年</span></label>
        </li>
        <li>
          <label>
            <input name="a" type="radio" value="">
            <span>11-20年</span></label>
        </li>
        <li>
          <label>
            <input name="a" type="radio" value="">
            <span>20年以上</span></label>
        </li>
        <li>
          <label>
            <input name="a" type="radio" value="">
            <span>其他</span> <input name="" type="text" class="wenb_input"></label>
        </li>
      </ul>
      <div class="dx_box" data-t="0"></div>
    </div>
    
    
    <div class="movie_box">
      <ul class="wjdc_list">
        <li>
          <div class="tm_btitlt"><i class="nmb">2</i>. <i class="btwenzi">对目前的工作哪方面不满意？</i><span class="tip_wz">【多选】</span></div>
        </li>
        <li>
          <label>
            <input name="" type="checkbox" value="">
             <span>任务多、压力大</span></label>
        </li>
        <li>
          <label>
            <input name="" type="checkbox" value="">
             <span>人际关系难处理，环境难适应</span></label>
        </li>
        <li>
          <label>
            <input name="" type="checkbox" value="">
            <span> 缺少认同和成就感</span></label>
        </li>
        <li>
          <label>
            <input name="" type="checkbox" value="">
            <span> 其他</span>
            <input name="" type="text" class="wenb_input">
          </label>
        </li>
      </ul>
      <div class="dx_box" data-t="1"></div>
    </div>
    
    
    <div class="movie_box">
      <ul class="wjdc_list">
        <li>
          <div class="tm_btitlt"><i class="nmb">3</i>.  <i class="btwenzi">任务多、压力大任务多、压力大任务多、压力大？</i><span class="tip_wz">【填空】</span></div>
        </li> 
        <li>
          <label> 
            <textarea name="" cols="" rows=""  class="input_wenbk btwen_text btwen_text_dx"    onblur="if(!this.value)this.value='单选题目'" onclick="if(this.value&&this.value=='单选题目' )  this.value=''"></textarea>
          </label>
        </li>
      </ul>
      <div class="dx_box" data-t="2"></div>
    </div>
    
    
    <div class="movie_box">
      <div class="wjdc_list">
        <h4 class="title_wjht"><i class="nmb">4</i>. 对目前的工作哪方面不满意？</h4>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tswjdc_table">
          <tr>
            <td class="lefttd_qk">&nbsp;</td>
            <td>非常喜欢</td>
            <td>喜欢</td>
            <td>一般</td>
            <td>不喜欢</td>
            <td>非常不喜欢</td>
          </tr>
          <tr class="os_bjqk">
            <td class="lefttd_qk">CCTV1</td>
            <td><input name="c1" type="radio" value=""></td>
            <td><input name="c2" type="radio" value=""></td>
            <td><input name="c3" type="radio" value=""></td>
            <td><input name="c4" type="radio" value=""></td>
            <td><input name="c5" type="radio" value=""></td>
          </tr>
          <tr>
            <td class="lefttd_qk">CCTV2</td>
            <td><input name="c1" type="radio" value=""></td>
            <td><input name="c2" type="radio" value=""></td>
            <td><input name="c3" type="radio" value=""></td>
            <td><input name="c4" type="radio" value=""></td>
            <td><input name="c5" type="radio" value=""></td>
          </tr>
          <tr class="os_bjqk">
            <td class="lefttd_qk">CCTV3</td>
            <td><input name="c1" type="radio" value=""></td>
            <td><input name="c2" type="radio" value=""></td>
            <td><input name="c3" type="radio" value=""></td>
            <td><input name="c4" type="radio" value=""></td>
            <td><input name="c5" type="radio" value=""></td>
          </tr>
        </table>
      </div>
      <div class="dx_box" data-t="3"></div>
    </div>
    <a href="javascript:void(0)" class="zjxxx">增加选项</a> 
    
  </div>

 
  <!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
  
  <div class="xxk_box" >
    <ul class="xxk_title">
      <li class="on">单选</li>
      <li>多选</li>
      <li>填空</li>
      <li>矩阵</li>
    </ul>
    <div class="xxk_conn"> 
      <!--单选----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box dxuan ">
        <textarea name="" cols="" rows=""  class="input_wenbk btwen_text btwen_text_dx"    onblur="if(!this.value)this.value='单选题目'" onclick="if(this.value&&this.value=='单选题目' )  this.value=''"></textarea>
        <div class="title_itram">
          <div class="kzjxx_iteam">
            <input name="" type="radio" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
            <label>
              <input name="" type="checkbox" value="" class="fxk">
              <span>可填空</span></label>
            <a href="javascript:void(0);" class="del_xm">删除</a> </div>
          <div class="kzjxx_iteam">
            <input name="" type="radio" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
            <label>
              <input name="" type="checkbox" value="" class="fxk">
              <span>可填空</span></label>
            <a href="javascript:void(0);" class="del_xm">删除</a> </div>
        </div>
        <a href="javascript:void(0)" class="zjxx">增加选项</a> 
        
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but" > 完成编辑</a> </div>
      </div>
      
      <!--多选----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box duoxuan hide">
        <textarea name="" cols="" rows=""  class="input_wenbk btwen_text btwen_text_duox"    onblur="if(!this.value)this.value='多选题目'" onclick="if(this.value&&this.value=='多选题目' )  this.value=''"></textarea>
        <div class="title_itram">
          <div class="kzjxx_iteam">
            <input name="" type="radio" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
            <label>
              <input name="" type="checkbox" value="" class="fxk">
              <span>可填空</span></label>
            <a href="javascript:void(0);" class="del_xm">删除</a> </div>
          <div class="kzjxx_iteam">
            <input name="" type="radio" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
            <label>
              <input name="" type="checkbox" value="" class="fxk">
              <span>可填空</span></label>
            <a href="javascript:void(0);" class="del_xm">删除</a> </div>
        </div>
        <a href="javascript:void(0)" class="zjxx">增加选项</a> 
        
        <!--完成编辑-->
       <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but" > 完成编辑</a> </div>
      </div>
      
      <!-- 填空----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box tktm hide">
        <textarea name=""  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" onblur="if(!this.value)this.value='填空题目'" onclick="if(this.value&&this.value=='填空题目' )  this.value=''"></textarea>
          
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but" > 完成编辑</a> </div>
      </div>
      
      <!-- 矩阵----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box  hide">
        <h4 class="title_wjht">1. 对目前的工作哪方面不满意？</h4>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tswjdc_table">
          <tr>
            <td class="lefttd_qk">&nbsp;</td>
            <td>非常喜欢</td>
            <td>喜欢</td>
            <td>一般</td>
            <td>不喜欢</td>
            <td>非常不喜欢</td>
          </tr>
          <tr class="os_bjqk">
            <td class="lefttd_qk">CCTV1</td>
            <td><input name="c1" type="radio" value=""></td>
            <td><input name="c2" type="radio" value=""></td>
            <td><input name="c3" type="radio" value=""></td>
            <td><input name="c4" type="radio" value=""></td>
            <td><input name="c5" type="radio" value=""></td>
          </tr>
          <tr>
            <td class="lefttd_qk">CCTV2</td>
            <td><input name="c1" type="radio" value=""></td>
            <td><input name="c2" type="radio" value=""></td>
            <td><input name="c3" type="radio" value=""></td>
            <td><input name="c4" type="radio" value=""></td>
            <td><input name="c5" type="radio" value=""></td>
          </tr>
          <tr class="os_bjqk">
            <td class="lefttd_qk">CCTV3</td>
            <td><input name="c1" type="radio" value=""></td>
            <td><input name="c2" type="radio" value=""></td>
            <td><input name="c3" type="radio" value=""></td>
            <td><input name="c4" type="radio" value=""></td>
            <td><input name="c5" type="radio" value=""></td>
          </tr>
        </table>
        <div class="line_dl"></div>
        <div class="jztm">
          <textarea name="" cols="" rows="" class="input_wenbk btwen_text"   onblur="if(!this.value)this.value='题目'" onclick="if(this.value&&this.value=='题目' )  this.value=''"></textarea>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr valign="top">
              <td width="135"><h4 class="ritwenz_xx">左标题</h4>
                <textarea name="" cols="" rows="" class="leftbtwen_text" onblur="if(!this.value)this.value='例子：CCTV1，CCTV2，CCTV3'" onclick="if(this.value&&this.value=='例子：CCTV1，CCTV2，CCTV3' )  this.value=''"></textarea></td>
              <td><h4 class="ritwenz_xx  ">右侧选项文字 <a href="#" class="xzqk">单选</a><a href="#" >多选</a></h4>
                <div class="title_itram">
                  <div class="kzjxx_iteam">
                    <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
                    <label>
                      <input name="" type="checkbox" value="" class="fxk">
                      <span>可填空</span></label>
                    <a href="javascript:void(0);" class="del_xm">删除</a> </div>
                  <div class="kzjxx_iteam">
                    <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
                    <label>
                      <input name="" type="checkbox" value="" class="fxk">
                      <span>可填空</span></label>
                    <a href="javascript:void(0);" class="del_xm">删除</a> </div>
                  <div class="kzjxx_iteam">
                    <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
                    <label>
                      <input name="" type="checkbox" value="" class="fxk">
                      <span>可填空</span></label>
                    <a href="javascript:void(0);" class="del_xm">删除</a> </div>
                </div>
                <a href="javascript:void(0)" class="zjxx" style="margin-left:0;">增加选项</a></td>
            </tr>
          </table>
          
          <!--完成编辑-->
         <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but" > 完成编辑</a> </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
</div>
</body>
</html>

