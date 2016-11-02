<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			
		</div>
	</div>
	<div class="row clearfix">
	
		<div class="col-md-2 column">
			<img alt="140x140" src="images/touxiang.jpg" class="img-circle" />
			<h2>
				Heading
			</h2>
			<p>
				Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
			</p>
			<p>
				 <a class="btn" href="#">View details »</a>
			</p> <button type="button" class="btn btn-block btn-default">按钮</button>
		</div>
		
		<div class="col-md-10 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
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
				

	
					
					
					<div class="carousel slide" id="carousel-634407">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-634407">
							</li>
							<li data-slide-to="1" data-target="#carousel-634407">
							</li>
							<li data-slide-to="2" data-target="#carousel-634407" class="active">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item">
								<img alt="" src="images/big1.jpg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="images/big2.jpg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item active">
								<img alt="" src="images/big3.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-634407" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-634407" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>
			
			<div class="row clearfix">
				<div class="col-md-12 column">
				
				<div id="grid-gallery" class="grid-gallery">
				<section class="grid-wrap">
					<ul class="grid">
						<li class="grid-sizer"></li><!-- for Masonry column width -->
						<li>
							<figure>
								<img src="images/thumb/1.png" alt="img01"/>
								<figcaption><h3>Letterpress asymmetrical</h3><p>Chillwave hoodie ea gentrify aute sriracha consequat.</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/thumb/2.png" alt="img02"/>
								<figcaption><h3>Vice velit chia</h3><p>Laborum tattooed iPhone, Schlitz irure nulla Tonx retro 90's chia cardigan quis asymmetrical paleo. </p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/thumb/3.png" alt="img03"/>
								<figcaption><h3>Brunch semiotics</h3><p>Ex disrupt cray yr, butcher pour-over magna umami kitsch before they sold out commodo.</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/thumb/4.png" alt="img04"/>
								<figcaption><h3>Chillwave nihil occupy</h3><p>In post-ironic gluten-free deserunt, PBR&amp;B non pork belly cupidatat polaroid. </p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/thumb/5.png" alt="img05"/>
								<figcaption><h3>Kale chips lomo biodiesel</h3><p>Pariatur food truck street art consequat sustainable, et kogi beard qui paleo. </p></figcaption>
							</figure>
						</li>
						
					</ul>
				</section>
				<section class="slideshow">
					<ul>
						<li>
							<figure>
								<figcaption>
									<h3>Letterpress asymmetrical</h3>
									<p>Kale chips lomo biodiesel stumptown Godard Tumblr, mustache sriracha tattooed cray aute slow-carb placeat delectus. Letterpress asymmetrical fanny pack art party est pour-over skateboard anim quis, ullamco craft beer.</p>
								</figcaption>
								<img src="images/large/1.png" alt="img01"/>
							</figure>
						</li>
						
						<li>
							<figure>
								<figcaption>
									<h3>Vice velit chia</h3>
									<p>Chillwave Echo Park Etsy organic Cosby sweater seitan authentic pour-over. Occupy wolf selvage bespoke tattooed, cred sustainable Odd Future hashtag butcher.</p>
								</figcaption>
								<img src="images/large/2.png" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Brunch semiotics</h3>
									<p>IPhone PBR polaroid before they sold out meh you probably haven't heard of them leggings tattooed tote bag, butcher paleo next level single-origin coffee photo booth.</p>
								</figcaption>
								<img src="images/large/3.png" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Chillwave nihil occupy</h3>
									<p>Vice cliche locavore mumblecore vegan wayfarers asymmetrical letterpress hoodie mustache. Shabby chic lomo polaroid, scenester 8-bit Portland Pitchfork VHS tote bag.</p>
								</figcaption>
								<img src="images/large/4.png" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Kale chips lomo biodiesel</h3>
									<p>Chambray Schlitz pug YOLO, PBR Tumblr semiotics. Flexitarian YOLO ennui Blue Bottle, forage dreamcatcher chillwave put a bird on it craft beer Etsy.</p>
								</figcaption>
								<img src="images/large/5.png" alt="img05"/>
							</figure>
						</li>
						
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