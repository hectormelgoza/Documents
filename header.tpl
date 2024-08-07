<!DOCTYPE html>

<!--[if IE 7]>                  <html class="ie7 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">  <!--<![endif]-->

<head>

	<base href="<?php echo $base; ?>" />

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<?php 
	$this->language->load('module/clearshop');
	$layout = $this->config->get('clearshop_main_layout');
	$clearshop_status = $this->config->get('clearshop_status'); 
	($layout=='large') ? $layout_extra=' responsive-large' : $layout_extra=''; 

	if(($clearshop_status == 1 && $layout!='fixed') || ($clearshop_status)!= 1) {

		$base_class = 'responsive'.$layout_extra; ?>

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<?php } else { $base_class = ""; } ?>

	<title><?php echo $title; ?></title>

	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php if ($icon) { ?>
	<link rel="shortcut icon" href="<?php echo $icon; ?>" />
	<?php } else { ?>
	<link rel="shortcut icon" href="catalog/view/theme/clearshop/favicon.ico">
	<?php } ?>

	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

	<?php foreach ($styles as $style) { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/bootstrap.min.css"/>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/stylesheet.css" media="screen"/>

	<?php if(($clearshop_status == 1 && $layout!='fixed') || ($clearshop_status)!= 1) { ?>
	<?php if ($layout=='large') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/stylesheet-responsive-large.css" media="screen"/>
	<?php } ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/stylesheet-responsive.css" media="screen"/>
	<?php } ?>

	<?php if($direction=='rtl'){?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/stylesheet.rtl.css" media="screen"/>
	<?php }?>

	

	<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/font-awesome-ie7.min.css" media="screen"/>
	<![endif]-->

	<!-- css3-mediaqueries.js for IE less than 9 -->
	 <!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>

	<script type="text/javascript" src="catalog/view/theme/clearshop/js/modernizr.full.min.js"></script>
		
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>

	<?php if($this->config->get('slider_general_status') == '1') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/rev_settings.css" media="screen"/>
	<script type="text/javascript" src="catalog/view/theme/clearshop/js/jquery.themepunch.plugins.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/clearshop/js/jquery.themepunch.revolution.min.js"></script>
	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/font-awesome.min.css" media="screen"/>

	<?php if ($this->config->get('clearshop_slider') == 'camera') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/camera.css" media="screen"/>
	<?php } ?>

	

	<script type="text/javascript" src="catalog/view/theme/clearshop/js/cloud-zoom.1.0.3-min.js"></script>

	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

	<?php 
	if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = $this->config->get('config_ssl') . 'image/';
	else $path_image = $this->config->get('config_url') . 'image/'; 
	?>

	<?php if($this->config->get('clearshop_full_background') == 1) { ?>

		<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/js/supersized/supersized.core.css">

		<script type="text/javascript" src="catalog/view/theme/clearshop/js/supersized/supersized.core.3.2.0.min.js"></script>

		<script type="text/javascript">
		jQuery(function($){
			$.supersized({
				slides:[ {image: '<?php echo $path_image . $this->config->get('clearshop_custom_image') ?>'} ]
			});
	    });
		</script>

	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
	<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>

	<script type="text/javascript" src="catalog/view/theme/clearshop/js/jquery.cycle.js"></script>

	<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>

	<?php

	// If Clearshop module is enabled

	if($this->config->get('clearshop_status')== '1') {

		if($this->config->get('clearshop_skins')!='') {
			
			$base_class .= " ". $this->config->get('clearshop_skins') . "_skin "; ?>
			
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/<?php echo $this->config->get('clearshop_skins'); ?>.css" media="screen"/>

		<?php }

		$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida+Grande', 'Trebuchet+MS', 'Times+New+Roman', 'Tahoma', 'Georgia' );			
			
		// Titles font
		if (($this->config->get('clearshop_title_font')!='') && (in_array($this->config->get('clearshop_title_font'), $regfonts)==false)) { 
			?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('clearshop_title_font') ?>:400,300,200,700,800,500&amp;v1' rel='stylesheet' type='text/css'>
		<?php } 
		// Body font
		if (($this->config->get('clearshop_body_font')!='') && (in_array($this->config->get('clearshop_body_font'), $regfonts)==false)) { 
			?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('clearshop_body_font') ?>:400,300,200,700,800,500&amp;v1' rel='stylesheet' type='text/css'>
		<?php } 
		// Small text font
		if (($this->config->get('clearshop_small_font')!='') && (in_array($this->config->get('clearshop_small_font'), $regfonts)==false)) { 
			?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('clearshop_small_font') ?>:400,300,200,700,800,500&amp;v1' rel='stylesheet' type='text/css'>
		<?php } ?>

		<style type="text/css">

			body {
				
			<?php

			if ($this->config->get('clearshop_status') == 1 && $this->config->get('clearshop_responsive')!='') { ?>
				min-width: 960px;
			<?php }

			if($this->config->get('clearshop_skins') == 'boxed') {

				if($this->config->get('clearshop_custom_image')!='') { ?>
					background-image: url("<?php echo $path_image . $this->config->get('clearshop_custom_image') ?>"); ?>;
					background-position: top center;
					background-repeat: no-repeat;
				<?php } else if($this->config->get('clearshop_custom_pattern')!='') { ?>
					background-image: url("<?php echo $path_image . $this->config->get('clearshop_custom_pattern') ?>"); ?>;
				<?php } else if($this->config->get('clearshop_pattern_overlay')!='none') { ?>
					background-image: url("catalog/view/theme/clearshop/images/patterns/<?php echo $this->config->get('clearshop_pattern_overlay'); ?>.png");
				<?php } else { ?>
					background-image: none;
				<?php }
				 } ?>
			}

			<?php if($this->config->get('clearshop_custom_colors') == '1') { ?>

				body {
					background-color: <?php echo $this->config->get('clearshop_background_color'); ?>;
				}

				#thickbar {
					background: <?php echo $this->config->get('clearshop_thickbar_color'); ?>;
					border-color: <?php echo $this->config->get('clearshop_thickbar_color'); ?>;
				}
				.navbar .nav > li > a {
					color: <?php echo $this->config->get('clearshop_menu_color'); ?>;
				}
				.navbar .nav > li:hover > a, .navbar .nav > li > a:hover {
					color: <?php echo $this->config->get('clearshop_menu_hover'); ?>;
				}
				.dropdown-menu li > a {
					color: <?php echo $this->config->get('clearshop_dropdown_color'); ?>;
				}
				.dropdown-menu li > a:hover, .dropdown-menu li > a:focus, .dropdown-submenu:hover > a {
					<?php $hover_bg = $this->config->get('clearshop_dropdown_hover'); ?>
					background: <?php echo $hover_bg; ?>;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $hover_bg; ?>', endColorstr='<?php echo $hover_bg; ?>', GradientType=0);
				}
				.cart-total .total {
					color: <?php echo $this->config->get('clearshop_cart_total_color'); ?>;
				}
				.cart-total .count {
					background: <?php echo $this->config->get('clearshop_cart_count_background'); ?>;
					color: <?php echo $this->config->get('clearshop_cart_count_color'); ?>;
				}

				/* active tabs */

					.nav-tabs > .active > a, .nav-tabs > .active > a:hover, .htabs a.selected {
						border-bottom-color: <?php echo $this->config->get('clearshop_active_tab_color'); ?>;
					}

				/* slideshow dots */

					.tp-bullets.simplebullets.round div.bullet,
					.flex-control-paging li a {
						background: <?php echo $this->config->get('clearshop_carousel_dots_normal'); ?>;
					}
					.tp-bullets.simplebullets.round div.bullet.selected,
					.flex-control-paging li a.flex-active {
						background: <?php echo $this->config->get('clearshop_carousel_dots_active'); ?>;
					}
					.tp-bullets.simplebullets.round div.bullet:hover,
					.flex-control-paging li a:hover {
						background: <?php echo $this->config->get('clearshop_carousel_dots_hover'); ?>;
					}
					
				.page-header h1 {
					color: <?php echo $this->config->get('clearshop_title_color'); ?> !important;
				}
				.mainborder a {
					color: <?php echo $this->config->get('clearshop_content_links_color'); ?>;	
				}
				.mainborder, .mainborder .nav-tabs > li > a, .category-list a, .product-info, .product-list .description, #full-info {
					color: <?php echo $this->config->get('clearshop_bodytext_color'); ?>;
				}
				.breadcrumb, .breadcrumb a, .pagination .results, .product-info .price-tax, .product-info .price .reward {
					color: <?php echo $this->config->get('clearshop_lighttext_color'); ?>;
				}
				#footer, #footer h3 {
					color: <?php echo $this->config->get('clearshop_footer_text_color'); ?>;
				}
				#footer a, #footer a:link, #footer a:visited {
					color: <?php echo $this->config->get('clearshop_footer_links_color'); ?>;
				}
				
				<?php 
				$btncarttop = $this->config->get('clearshop_button_top_color');
				$btncartbot = $this->config->get('clearshop_button_bottom_color');
				?>

				.payment .button,
				.cart .button,
				.button-cart,
				#button-confirm {
					border-color: <?php echo $this->config->get('clearshop_button_border_color'); ?>;
					color: <?php echo $this->config->get('clearshop_button_text_color'); ?> !important;

					background-color: <?php echo $btncarttop; ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btncarttop; ?>), to(<?php echo $btncartbot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btncarttop; ?>', endColorstr='<?php echo $btncartbot; ?>', GradientType=0);
				}
				.payment .button:hover,
				.payment .button:active,
				.cart .button:hover,
				.cart .button:active,
				.button-cart:hover,
				.button-cart:active {
					background-color: <?php echo $btncartbot; ?>;
				}

				<?php 
				$btninversetop = $this->config->get('clearshop_2button_top_color');
				$btninversebot = $this->config->get('clearshop_2button_bottom_color');
				?>

				.button-inverse {
					border-color: <?php echo $this->config->get('clearshop_2button_border_color'); ?>;
					color: <?php echo $this->config->get('clearshop_2button_text_color'); ?> !important;

					background-color: <?php echo $this->config->get('clearshop_2button_top_color'); ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btninversetop; ?>), to(<?php echo $btninversebot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btninversetop; ?>', endColorstr='<?php echo $btninversebot; ?>', GradientType=0);

				}
				.button-inverse:hover, .button-inverse:active, .button-inverse.active, .button-inverse.disabled, .button-inverse[disabled] {
					background-color: <?php echo $this->config->get('clearshop_2button_bottom_color'); ?>;
				}

				.grid-box .name a, .product-list .name a, .product-slider .name a  {
					color: <?php echo $this->config->get('clearshop_product_name_color'); ?>;	
				}
				.grid-box .price, .product-list .price, .product-slider .price, .product-info .price-normal {
					color: <?php echo $this->config->get('clearshop_normal_price_color'); ?>;	
				}
				.price-old {
					color: <?php echo $this->config->get('clearshop_old_price_color'); ?>;	
				}
				.price-new {
					color: <?php echo $this->config->get('clearshop_new_price_color'); ?>;	
				}
			
				.onsale span {
					background-color: <?php echo $this->config->get('clearshop_onsale_background_color'); ?>;
					color: <?php echo $this->config->get('clearshop_onsale_text_color'); ?>;
				}

				.box.category-accordion, .box.account, .box.mod-information, .box.affiliate {
					border-color: <?php echo $this->config->get('clearshop_category_box_border'); ?>;
					background-color: <?php echo $this->config->get('clearshop_category_box_background'); ?>;
				}
				
				.box-category > ul > li > a {
					color: <?php echo $this->config->get('clearshop_categories_menu_color'); ?>;
				}
				.box-category a {
					color: <?php echo $this->config->get('clearshop_categories_sub_color'); ?>;		
				}
				.box-category > ul > li a.active {
					color: <?php echo $this->config->get('clearshop_categories_active_color'); ?>;
				}
		
			<?php  } /* clearshop_custom_colors END */

			if ($this->config->get('clearshop_zoom_position') == 'inside') { ?>
				.cloud-zoom-big { left:0 !important; }
			<?php }

			if ($this->config->get('clearshop_display_cart_button') ==1) { ?>
				.product-box .grid-box .cart .button,
				.product-grid .grid-box .cart .button,
				.product-slider ul li .cart .button,
				.product-box .grid-box .outstock,
				.product-grid .grid-box .outstock,
				.product-slider ul li .outstock {
					margin-left: 0 !important;
				}
			<?php }

			if ($this->config->get('clearshop_quickview_modules') != 1) { ?>
				.content-top .quickview, .content-bottom .quickview { display:none !important; }
			<?php }

			if ($this->config->get('clearshop_quickview_categories') != 1) { ?>
				#maincontent .quickview { display:none !important; }
			<?php }

			if ($this->config->get('clearshop_quickview_zoom') != 1) { ?>
				.quickview-box .cloud-zoom-big { display:none !important; }
				.cloud-zoom-lens {background: transparent !important; cursor: default;}
			<?php }

			if ($this->config->get('clearshop_toggle_sidebar') != 1) { ?>
				#toggle_sidebar { display:none !important; }
			<?php }

			if ($this->config->get('clearshop_show_wishlist') != 1) { ?>
				.wishlist, .wishlist-link { display:none !important; }
			<?php }

			if ($this->config->get('clearshop_show_compare') != 1) { ?>
				.compare, .product-compare { display:none !important; }
			<?php }

			if ($this->config->get('clearshop_show_sale_bubble') != 1) { ?>
				.onsale { display:none !important; }
			<?php }

			if ($this->config->get('clearshop_subcat_status') == 1) { 
				$thumb_width = $this->config->get('clearshop_subcat_thumb_width') + 3;;
				?>
				.subcat_thumb a { width: <?php echo $thumb_width; ?>px; }
			<?php }

			if ($this->config->get('clearshop_body_font') != '' ) {
				$fontpre =  $this->config->get('clearshop_body_font');
				$font = str_replace("+", " ", $fontpre);
			?>

			body, p { 
				font-family: <?php echo $font ?>; 
				font-size: <?php echo $this->config->get('clearshop_body_font_size'); ?>px;
			}

			<?php } 
				if($this->config->get('clearshop_title_font')!='') {
				$fontpre =  $this->config->get('clearshop_title_font');
				$font = str_replace("+", " ", $fontpre);
			?>

			h1 {
				font-family:<?php echo $font ?>;
				font-size: <?php echo $this->config->get('clearshop_title_font_size'); ?>px;
			}
			.name {
				font-family:<?php echo $font ?>;
			}
			
			<?php }

			if ($this->config->get('clearshop_small_font') != '') {
				$fontpre =  $this->config->get('clearshop_small_font');
				$font = str_replace("+", " ", $fontpre);
			?>
			small, .product-compare, .product-filter, .product-filter .display li, .product-list .price-tax, .product-info .price-tax, .product-info .price .reward, span.error, #copy, #footer .info, /*.breadcrumb a,*/ .help {
				font-family:<?php echo $font ?>;
				font-size: <?php echo $this->config->get('clearshop_small_font_size'); ?>px;
			}
			<?php } 
			
			if ($this->config->get('clearshop_custom_css') != '') { 
				echo htmlspecialchars_decode( $this->config->get('clearshop_custom_css'), ENT_QUOTES );
			} ?>

		</style>

		<?php if ($this->config->get('clearshop_custom_stylesheet') == 1) { ?>
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/custom.css" />
		<?php } ?>

	<?php } ?> <!-- clearshop_status END -->

	<?php if ($this->config->get('clearshop_custom_stylesheet') == 1) { ?>
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/clearshop/stylesheet/custom.css" />
		<?php } ?>

	<?php if ($stores) { ?>
		<script type="text/javascript"><!--
		$(document).ready(function() {
		<?php foreach ($stores as $store) { ?>
		$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
		<?php } ?>
		});
		//--></script>
	<?php } ?>

	<?php echo $google_analytics; ?>

</head>
<body class="<?php echo $base_class; ?>">

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TVN6HC9"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div id="supercontainer">

	<div id="thickbar"></div>

	<header id="header">

		<div class="container">

			<?php if($this->config->get('clearshop_logo_position') == 'left') { ?>

				<div class="row-fluid leftlogo">

					<div id="logo" class="span4">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>" id="logo-black"><img src="catalog/view/theme/clearshop/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

					<div class="span4 middlebox">

						<?php if($this->config->get('clearshop_header_info_text') != '') { ?>
							<div class="info">
								<?php echo html_entity_decode($this->config->get('clearshop_header_info_text'), ENT_QUOTES, 'UTF-8');?>
							</div>
						<?php } ?>

						<?php if(($this->config->get('clearshop_searchbox') == 1 && $this->config->get('clearshop_searchbox_position') == 'top')  || $clearshop_status != 1) { ?>

							<div id="search">
								<div class="searchbox input-append">
									<input type="search" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
									<button class="button button-search" type="button" aria-label="Search"><i class="icon-search"></i></button>
								</div>
							</div>

						<?php } ?>
					</div> <!-- .middlebox -->

					<div class="span4">

						<?php echo $cart; ?>

						<div class="top_options">

							<div class="inner">
							
								<div id="welcome">
									<?php if (!$logged) { ?>
									<?php echo $text_welcome; ?>
									<?php } else { ?>
									<div class="logged">
									<?php echo $text_logged; ?>
									</div>
									<?php } ?>
								</div>

								<div id="wrapselector">
									<?php echo $language; ?>
									<?php echo $currency; ?>
								</div>
								
							</div>

						</div>
						
					</div>

					
				</div> <!-- .leftlogo -->

			<?php } else { ?>

				<div class="row-fluid">
				
				<div class="span4 leftbox">

						<div id="welcome">
							<?php if (!$logged) { ?>
							<?php echo $text_welcome; ?>
							<?php } else { ?>
							<?php echo $text_logged; ?>
							<?php } ?>
						</div>

					</div> <!-- .leftbox -->

					<div id="logo" class="span4">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>" id="logo-black"><img src="catalog/view/theme/clearshop/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

					<div class="span4 rightbox">
						
						<?php echo $cart; ?>

						<div class="top_options">
							<div class="inner">
								<div id="wrapselector">
									<?php echo $language; ?>
									<?php echo $currency; ?>
								</div>
							</div>
						</div>

					</div> <!-- .rightbox -->

				</div>

			<?php } ?> 

		</div>

		<div id="outernav">

			<div class="container">

			<?php if ($categories) { ?>
		
				<nav id="mainnav" class="navbar" role="navigation">
					<div class="navbar-inner">
						<div class="container">

							<?php if ($this->config->get('clearshop_searchbox') == 1 && $this->config->get('clearshop_searchbox_position') == 'navbar') { ?>

								<div id="search" class="pull-right">
									<div class="searchbox input-append">
										<input type="search" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
										<button class="button button-search" type="button" aria-label="Search"><i class="icon-search"></i></button>
									</div>
								</div>

							<?php } ?>

							<button type="button" class="button button-navbar" data-toggle="collapse" data-target=".nav-collapse">
								<span><?php echo $this->language->get('text_button_menu'); ?></span><i class="icon-sort"></i>
							</button>

							<div class="nav-collapse">
							<ul class="nav">
								<li><a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>"><i class="icon-home"></i></a></li>

								<?php $linkidcount=0; ?>

									<?php foreach ($categories as $category) { ?>
										<li id="m<?php echo $linkidcount; ?>" <?php if ($category['children']) { ?> class="dropdown"<?php } ?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>

										<?php if ($category['children']) { ?>
											<ul class="dropdown-menu">
											<?php for ($i = 0; $i < count($category['children']);) { ?>
											<?php if ($category['column'] > 1) { ?>
												<li class="column-menu">
													<ul>
											<?php } ?>
											<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
											<?php for (; $i < $j; $i++) { ?>
												<?php if (isset($category['children'][$i])) { ?>
													<li id="m<?php echo $linkidcount.$i; ?>"><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
												<?php } ?>
											<?php } ?>
											<?php if ($category['column'] > 1) { ?>
													</ul>
												</li>
											<?php } ?>
											<?php } ?>
											</ul>
										<?php } ?>
										</li>
										<?php $linkidcount++; ?>
									<?php } ?>									
								</ul>
							</div>
						</div>

					</div>
				</nav><!-- #navbar -->

			<?php } ?>
		
			</div>

		</div>

	</header> <!-- #header -->

	<section id="content-wrapper">
			
