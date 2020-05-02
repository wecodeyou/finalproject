<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<style>
	.cd-auto-hide-header {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 60px;
	  transition: transform .5s;
	}
	.cd-auto-hide-header.is-hidden {
	  transform: translateY(-100%);
	}    
	
	.cd-secondary-nav.fixed {
	  position: fixed;
	  top: 60px;
	}
	.cd-secondary-nav.slide-up {
	  transform: translateY(-60px);
	}
</style>

</head>
<body>

<header class="cd-auto-hide-header">
    
   <div class="logo"><a href="#0"><img src="img/cd-logo.svg" alt="Logo"></a></div>

   <nav class="cd-primary-nav">
      <a href="#cd-navigation" class="nav-trigger">
         <span>
            <em aria-hidden="true"></em>
            Menu
         </span>
      </a> <!-- .nav-trigger -->

      <ul id="cd-navigation">
         <li><a href="#0">The team</a></li>
         <li><a href="#0">Our Services</a></li>
         <li><a href="#0">Our Projects</a></li>
         <li><a href="#0">Contact Us</a></li>
      </ul>
   </nav> <!-- .cd-primary-nav -->
    
</header> <!-- .cd-auto-hide-header -->

<section class="cd-hero">
   <!-- content here -->
</section> <!-- .cd-hero -->
    
<nav class="cd-secondary-nav">
      <ul>
         <li><a href="#0">Intro</a></li>
         <!-- additional links here -->
      </ul>
</nav> <!-- .cd-secondary-nav -->

<main class="cd-main-content sub-nav-hero">
   <!-- content here -->
</main> <!-- .cd-main-content -->


<script type="text/javascript">

	var scrolling = false;
	$(window).on('scroll', function(){
	   if( !scrolling ) {
	      scrolling = true;
	      (!window.requestAnimationFrame)
	         ? setTimeout(autoHideHeader, 250)
	         : requestAnimationFrame(autoHideHeader);
	   }
	});

</script>

</body>
</html>