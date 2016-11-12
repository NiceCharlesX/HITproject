<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE >
<html>
<head>
   <meta charset="utf-8"> 
   <title>在线尝试 Bootstrap 实例</title>
   <meta name="viewport"
          content=" height = device-height,
                    width = device-width,
                    initial-scale = 1.0,
                    minimum-scale = 1.0,
                    maximum-scale = 1.0,
                    user-scalable = no"/>
   
   <link rel="stylesheet" href="css/bootstrap.min.css"> 
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
  	
  	<link rel="shortcut icon" href="../favicon.ico">
  	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<script src="js/modernizr.custom.js"></script>
	
 
   
</head>
<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			
			
			<nav class="navbar navbar-default  " role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> 
					<a class="navbar-brand" href="<s:url action="showact"> 
					 <s:param name="phonenumber"><s:property value="phonenumber" /></s:param>
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
							 <a href="add.jsp?phonenumber=<s:property value='phonenumber'/>">发布活动</a>
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
			
			
		</div>
	</div>
	<div class="row clearfix">
	
		<div class="col-md-2 column">
			<img alt="140x140" src="images/touxiang.jpg" class="img-circle" />
			<h2>
				<s:property value="phonenumber" />
			</h2>
			<p>
				 此处个人相关信息
			</p>
			<p>
				 <a class="btn" href="#">View details »</a>
			</p> 
			<a style='text-decoration:none;' href="#"><button type="button" class="btn btn-block btn-default">编辑信息</button></a>
			</br>
			<a style='text-decoration:none' href="<s:url action="myact.action">	   
	                  <s:param name="phonenumber"><s:property value="phonenumber" /></s:param>
	                  </s:url>
	                  "><button type="button" class="btn btn-block btn-default">我的活动</button></a>
	         
	         </br>
	         <a style='text-decoration:none' href="<s:url action="mycollection">	
	                  <s:param name="phonenumber"><s:property value="phonenumber" /></s:param>
	                  </s:url>
	                  "><button type="button" class="btn btn-block btn-default">我的收藏</button></a>
		</div>
		
		<div class="col-md-10 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<ol class="breadcrumb">
						<li><a style='text-decoration:none'  href="<s:url action="showact"> 
						 	<s:param name="phonenumber"><s:property value="phonenumber" /></s:param>
						 	<s:param name="orderby">time</s:param>
						 	</s:url>
					      ">主页</a>
					     </li>		
						<li><a href="#">2013</a></li>
						<li class="active">十一月</li>
						<li class="dropdown pull-right">
								 <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li>
										 <a href="#">操作</a>
									</li>
									<li>
										 <a href="#">设置栏目</a>
									</li>
									<li>
										 <a href="#">更多设置</a>
									</li>
									<li class="divider">
									</li>
									<li>
										 <a href="#">分割线</a>
									</li>
								</ul>
							</li>
					</ol>
				</div>
			</div>

			
			<div class="row clearfix">
				<div class="col-md-12 column">
				<div id="grid-gallery" class="grid-gallery">
				<section class="grid-wrap">
					<ul class="grid">					
						<li class="grid-sizer"></li><!-- for Masonry column width -->
						
						<s:iterator value="#request.list" var = "var">
							<li>
								<figure>
									<img src="images/thumb/1.png" alt="img01"/>
									<figcaption><h3><s:property value="#var.name"/></h3>
									<p>开始时间：<s:property value="#var.sdate"/></p>
									<p>结束时间：<s:property value="#var.edate"/></p>
									<p>举办方<s:property value="#var.creator"/></p>	
								</figcaption>
								</figure>
							</li>
						</s:iterator>	
					</ul>
				</section>
				
				
				<section class="slideshow">
					<ul>
						<s:iterator value="#request.list" var = "var">
							<li>
								<figure>
									<figcaption>
										<h3><s:property value="#var.name"/></h3>
										<p><s:property value="#var.brief"/></p>	
									</figcaption>
									<img src="images/large/1.png" alt="img01"/>
									</br>
									<a style='text-decoration:none;' href="#">修改活动</a>
								
									<a style='text-decoration:none;' href="<s:url action = "delact">								
										<s:param name="phonenumber"><s:property value="phonenumber"/></s:param>
										<s:param name="actid"><s:property value="#var.actid"/></s:param>
										</s:url>
									">删除活动</a>

								</figure>
							</li>
						</s:iterator>	
					</ul>
					<nav>
						<span class="icon nav-prev"></span>
						<span class="icon nav-next"></span>
						<span class="icon nav-close"></span>
					</nav>
				</section>
				</div>								
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				
				
				
				</div>
			</div>
			
		</div>
	</div>
	
	
	
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<ul class="nav nav-pills">
				<li class="active">
					 <a href="#">首页</a>
				</li>
				<li>
					 <a href="#">简介</a>
				</li>
				<li class="disabled">
					 <a href="#">信息</a>
				</li>
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							 <a href="#">操作</a>
						</li>
						<li>
							 <a href="#">设置栏目</a>
						</li>
						<li>
							 <a href="#">更多设置</a>
						</li>
						<li class="divider">
						</li>
						<li>
							 <a href="#">分割线</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	
</div>

		<script src="js/imagesloaded.pkgd.min.js"></script>
		<script src="js/masonry.pkgd.min.js"></script>
		<script src="js/classie.js"></script>
		<script src="js/cbpGridGallery.js"></script>
		<script>
			new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
		</script>
</body>
</html>