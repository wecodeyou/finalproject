<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="<c:url value = "/resources/vendor/dist/video-js.css"/>" rel="stylesheet" />
<%-- <link href="<c:url value = "/resources/vendor/dist/vsg-skin.css"/>" rel="stylesheet" />
 --%><link href="<c:url value = "/resources/vendor/dist/videojs-playlist-ui.css"/>" rel = "stylesheet"/>
 
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<!--   	<script src="https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
	<script src="https://vjs.zencdn.net/7.7.5/video.js"></script> -->



	<script src="<c:url value = "/resources/vendor/dist/video.js"/>"></script>
	<script src="<c:url value = "/resources/vendor/dist/videojs-playlist.js"/>"></script>
	<script src="<c:url value = "/resources/vendor/dist/videojs-playlist-ui.min.js"/>"></script>



<!-- <link href="//vjs.zencdn.net/4.5/video-js.css" rel="stylesheet">
<script src="//vjs.zencdn.net/4.5/video.js"></script> -->

  
</head>

<body>
 
 <section class="main-preview-player">
 
   <video
    id="vod"
    class="video-js vjs-fluid"
    controls

    autoplay="autoplay"
    preload="auto" 
    data-setup='{

			"playbackRates" : [0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3],
			"userActions" : {"hotkeys" : true}
			    		
    		}'
  
  
  
  
  >
    <source src="<c:url value = "/resources/vendor/videos/Trees.mp4"/>" type="video/mp4" />
<!--     <source src="MY_VIDEO.webm" type="video/webm" /> --> 
      </video>
  
  
  
  
  <div class="playlist-container  preview-player-dimensions vjs-fluid">
    <ol class="vjs-playlist"></ol>
  </div>
  
</section>

<script>
  // Initialize the plugin and build the playlist!
  videojs(document.querySelector('video')).playlistUi();
</script>


<script type = "text/javascript">

	

	let player = videojs('vod');
	
    player.playlistUi(); 

	var pl = player.playlist([{
	
		
			name : 'Lotus.mp4',
			sources: [{
			    src: '<c:url value = "/resources/vendor/videos/Lotus.mp4"/>',
			    type: 'video/mp4'
			  }],
			poster: 'http://media.w3.org/2010/05/bunny/poster.png',

			  
		
	},{
		
			sources: [{
			    src: '<c:url value = "/resources/vendor/videos/Pasta.mp4"/>',
			    type: 'video/mp4'
			  }],
			poster: 'http://media.w3.org/2010/05/bunny/poster.png'

		
	},{
		
			sources: [{
		 	   src: '<c:url value = "/resources/vendor/videos/Dubai.mp4"/>',
		 	   type: 'video/mp4'
			  }],
			poster: 'http://media.w3.org/2010/05/bunny/poster.png'
		

	
	}
	
	
	]);
	player.playlist.autoadvance(3);

</script>





</body>