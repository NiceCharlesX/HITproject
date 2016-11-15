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
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">Brand</a>
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
				<li>
					 <a href="#">Home</a>
				</li>
				<li>
					 <a href="#">Library</a>
				</li>
				<li class="active">
					Data
				</li>
			</ul>
		</div>
	</div>
	<div class="row clearfix">
		<form class="form-horizontal" role="form" action="changeall">
		<div class="row clearfix">
		<div class="col-md-6 column">
				<label for="Name" style="font-size:large;">修改活动</label>
				<input type = "hidden" name="actid" value = "<s:property value = 'act.actid'/>" />
				<input type = "hidden" name="phonenumber" value = "<s:property value = 'phonenumber'/>" />
				<input type = "hidden" name="username" value = "<s:property value = 'username'/>" />
				<input type = "hidden" name="useremail" value = "<s:property value = 'useremail'/>" />
				
				<div>
					<span class="myinput input--jiro">
						<input class="input__field input__field--jiro" style="height: 40px" type="text" id="Name" name="name"  value="<s:property value='act.name'/> "/>
						<label class="input__label input__label--jiro" for="input-10">
							<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">活动名称</span>
						</label>
					</span>
				</div>
				
				<div>
					<span class="myinput input--jiro">
						<input class="input__field input__field--jiro" style="height: 40px" type="text" id="Name" name="cphonenumber"  value="<s:property value='act.phonenumber'/>"  />
						<label class="input__label input__label--jiro" for="input-10">
							<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">联系方式</span>
						</label>
					</span>
				</div>
				

				
				<div>
						<span class="myinput input--jiro">
							<input class="input__field input__field--jiro" style="height:40px" type="text" id="Name" name="creator"  value="<s:property value='act.creator'/>"/>
							<label class="input__label input__label--jiro" for="input-10">
								<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">举办者</span>
							</label>
						</span>
				</div>
				
				<div>
					<span class="myinput input--jiro">
						<input class="input__field input__field--jiro" style="height: 40px" type="text" id="Name" name="aplace"  value="<s:property value='act.place'/>" />
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
                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span><input type="text" readonly style="width: 205px" name="acttime" class="form-control reservation" value="<s:property value='act.sdate'/> - <s:property value='act.edate'/>" /> 
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
                  		<textarea rows = "5" cols = "47" name="brief"><s:property value='act.brief' /> </textarea>
           			 </div>
         		</div>
        	</div>

			<br/>

		</div>
		<div class="col-md-6 column">	
		<label for="Name" style="font-size:large;">修改进程</label>
		
				<s:iterator value="#request.act.slist" var = "var">
					<ul class="wjdc_list">
					 <li >
          				<div class="tm_btitlt"><i class="btwenzi" style="font-size:large;">活动进程</i><i class="nmb" style="font-size:large;"><s:property value = "#var.sid"/></i></div>
       				</li>
					<li>
					<div class="form-group">
						<label for="Name" style="font-size:large;position:relative;left:40px;color: #6a7989">起止时间</label>
	          			<div class="input-prepend input-group" style="position:relative;left:40px">
	                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
	                       <input type="text" style="width: 250px" name="time"  class="form-control reservationtime input-sm" value="<s:property value = '#var.time'/>"  class="span4" />
	                     </div>        			       	         			
					</div>
					</li>
			
					<li>
					<div>
							<span class="myinput input--jiro">
								<input class="input__field input__field--jiro" style="height:40px" type="text" id="Name" name="person"  value="<s:property value = '#var.person'/>"  />
								<label class="input__label input__label--jiro" for="input-10">
									<span class="input__label-content input__label-content--jiro" style="padding:0.3em 0;">主持人</span>
								</label>
							</span>
					</div>	
					</li>
					
					<li>
					<div>
							<span class="myinput input--jiro">
								<input class="input__field input__field--jiro" style="height:40px" type="text" id="Name" name="place"  value="<s:property value = '#var.place'/>" />
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
                  			<textarea rows = "2" cols = "29" name="contents"><s:property value = '#var.contents'/> </textarea>
           			 	</div>
					</div>
					</li>
					</ul>
			</s:iterator>
		</div>
	</div>
	
		<div class="row clearfix">
		 	<div class="col-md-12 column">
		 		<button class="button button--winona buttonbody" data-text="Submit" type="submit"><span>Submit</span></button>
		 	</div>
		 </div>
		</form>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="progress">
				<div class="progress-bar progress-success">
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