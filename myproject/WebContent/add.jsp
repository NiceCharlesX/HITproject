<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
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
	<link rel="stylesheet" type="text/css" href="css/cs-select.css" />
	
	<link rel = "stylesheet" type="text/css" href="css/bootstrap-responsive.css"/>

	
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
	
	<script src="js/image-picker.min.js" type="text/javascript"></script>

<script>
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
		
		$("select.image-picker").imagepicker({
			hide_select:false
		});
		
		$("select.image-picker.show-labels").imagepicker({
			hide_select:false, 
			show_label:true
		});
		
		$("select.image-picker.limit_callback").imagepicker({
			limit_reached:function(){
				alert('We are full!')
			},hide_select:false
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
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">主页</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
					
				</div>
			</nav>
			<ul class="breadcrumb">
				<li><a style='text-decoration:none'  href="<s:url action="showallact"> 
					 <s:param name="phonenumber"><%=request.getParameter("phonenumber") %></s:param>
					 <s:param name="username"><%=request.getParameter("username") %></s:param>
	                  <s:param name="useremail"><%=request.getParameter("useremail") %></s:param>
					 <s:param name="orderby">time</s:param>
					 </s:url>
					 ">主页</a></li>
				
				<li class="active">
					添加活动
				</li>
			</ul>
		</div>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="progress progress-striped active">
			    <div class="progress-bar" role="progressbar" aria-valuenow="60" 
			        aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
			        <span class="sr-only">50% 完成</span>
			    </div>
			</div>
		</div>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-6 column">
			<form class="form-horizontal" role="form" action="createact">
				<div>
					<span class="myinput input--jiro">
						<input class="input__field input__field--jiro" style="height: 40px" type="text" id="Name" name="name"  />
						<label class="input__label input__label--jiro" for="input-10">
							<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">活动名称</span>
						</label>
					</span>
				</div>
				
				<div>
					<span class="myinput input--jiro">
						<input class="input__field input__field--jiro" style="height: 40px" type="text" id="Name" name="cphonenumber"  value="<%=request.getParameter("phonenumber") %>" />
						<label class="input__label input__label--jiro" for="input-10">
							<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">联系方式</span>
						</label>
					</span>
				</div>
				
				<input type="hidden" name="phonenumber" value=<%=request.getParameter("phonenumber") %> />
				<input type="hidden" name="username" value=<%=request.getParameter("username") %> />
				<input type="hidden" name="useremail" value=<%=request.getParameter("useremail") %> />
				
				<div>
						<span class="myinput input--jiro">
							<input class="input__field input__field--jiro" style="height:40px" type="text" id="Name" name="creator"  />
							<label class="input__label input__label--jiro" for="input-10">
								<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">举办者</span>
							</label>
						</span>
				</div>
				
				<div>
					<span class="myinput input--jiro">
						<input class="input__field input__field--jiro" style="height: 40px" type="text" id="Name" name="place"  />
						<label class="input__label input__label--jiro" for="input-10">
							<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">地点</span>
						</label>
					</span>
				</div>
				
				
				</br>
				<div class="form-group">
					<label for="Name" style="font-size:large;position:relative;left:40px;color: #6a7989">起止时间</label>
					</br>			
					
					<div class="input-prepend input-group " style="position:relative;left:40px" >
                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span><input type="text" readonly style="width: 205px" name="time" class="form-control reservation" value="2016-12-16 - 2016-12-16" /> 
                   </div>
				</div>
				
				</br>
				 <div class="form-group">
      				<label for="Name"  style="font-size:large;position:relative;left:40px;color: #6a7989">选择类别</label>
     					<div style="position:relative;left:40px">
        					<select id="basic" class="selectpicker show-tick " name="type" >
         						<option selected>请选择类别</option>
         						<option>课程</option>
          						<option>体育</option>
          						<option>歌唱</option>
          						<option>讲座</option>
          						<option>舞蹈</option>
        					</select>
      					</div>
    			</div>

			<br/>
			<div class="control-group"  style="font-size:large;position:relative;left:25px;color: #6a7989">
          		<label class="Name">活动简介</label>
          		<div class="controls"  >
            		<div class="textarea">
                  		<textarea rows = "5" cols = "47" name="brief"> </textarea>
           			 </div>
         		</div>
        	</div>

			<br/>
			<button  style="position:relative;left:10px" class="button button--winona buttonbody" data-text="Submit" type="submit" ><span>Submit</span></button>
			</form>
		</div>
		
		<div class="col-md-6 column">
			<h4>海报选择：</h4>
			<div class="picker" >
			<select class="image-picker show-labels  show-tick selectpicker" >
				<option data-img-src='images/posts1.jpg' value='1'>海报1</option>
				<option data-img-src='images/posts2.jpg' value='2'>海报2</option>
				<option data-img-src='images/posts3.jpg' value='3'>海报3</option>
				<option data-img-src='images/posts4.jpg' value='4'>海报4</option>
			
			</select>
			</div>
		</div>
	</div>
	

	
</div>


<link rel="stylesheet" type="text/css" href="css/image-picker.css">

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