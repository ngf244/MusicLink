<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
	
<title>Insert title here</title>

<style>
	/* Slider */
	.slick-slider
	{
	        position: relative;
	        display: block;
	        box-sizing: border-box;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	        -webkit-touch-callout: none;
	        -khtml-user-select: none;
	        -ms-touch-action: pan-y;
	        touch-action: pan-y;
	        -webkit-tap-highlight-color: transparent;
	}
	.slick-list
	{
	        position: relative;
	        display: block;
	        overflow: hidden;
	        margin: 0;
	        padding: 0;
	}
	.slick-list:focus
	{
	        outline: none;
	}
	.slick-list.dragging
	{
	        cursor: pointer;
	        cursor: hand;
	}
	.slick-slider .slick-track,
	.slick-slider .slick-list
	{
	        -webkit-transform: translate3d(0, 0, 0);
	        -moz-transform: translate3d(0, 0, 0);
	        -ms-transform: translate3d(0, 0, 0);
	        -o-transform: translate3d(0, 0, 0);
	        transform: translate3d(0, 0, 0);
	}
	.slick-track
	{
	        position: relative;
	        top: 0;
	        left: 0;
	        display: block;
	}
	.slick-track:before,
	.slick-track:after
	{
	        display: table;
	        content: '';
	}
	.slick-track:after
	{
	        clear: both;
	}
	.slick-loading .slick-track
	{
	        visibility: hidden;
	}
	.slick-slide
	{
	        display: none;
	        float: left;
	        height: 100%;
	        min-height: 1px;
	}
	[dir='rtl'] .slick-slide
	{
	        float: right;
	}
	.slick-slide img
	{
	        display: block;
	}
	.slick-slide.slick-loading img
	{
	        display: none;
	}
	.slick-slide.dragging img
	{
	        pointer-events: none;
	}
	.slick-initialized .slick-slide
	{
	        display: block;
	}
	.slick-loading .slick-slide
	{
	        visibility: hidden;
	}
	.slick-vertical .slick-slide
	{
	        display: block;
	        height: auto;
	        border: 1px solid transparent;
	}
	.slick-arrow.slick-hidden {
	        display: none;
	}
	.slick-prev,
	.slick-next {
	        position: absolute;
	        display: block;
	        width: 60px;
	        height: 100px;
	        cursor: pointer;
	        background: transparent;
	        top: 50%;
	        margin-top: -45px;
	        font-size: 0;
	        border: none;
	        z-index: 2;
	}
	.slick-prev:before,
	.slick-next:before,
	.slick-prev:after,
	.slick-next:after {
	        content: '';
	        position: absolute;
	        background: #fff;
	        height: 2px;
	        width: 50px;
	        top: 50%;
	        left: 5px;
	        -webkit-transition: all 0.2s ease-in-out;
	        transition: all 0.2s ease-in-out;
	}
	.slick-prev:before,
	.slick-next:before {
	        margin-top: -22px;
	}
	.slick-prev:after,
	.slick-next:after {
	        margin-top: 22px;
	        margin-top: 2.2rem;
	}
	.slick-prev:hover:before,
	.slick-next:hover:before {
	        margin-top: -18px;
	        margin-top: -1.8rem;
	}
	.slick-prev:hover:after,
	.slick-next:hover:after {
	        margin-top: 18px;
	        margin-top: 1.8rem;
	}
	.slick-prev {
	        left: -7px;
	        left: 1em;
	}
	.slick-prev:before {
	        -webkit-transform: rotate(-60deg);
	        -ms-transform: rotate(-60deg);
	        transform: rotate(-60deg);
	}
	.slick-prev:after {
	        -webkit-transform: rotate(60deg);
	        -ms-transform: rotate(60deg);
	        transform: rotate(60deg);
	}
	.slick-prev:hover:before {
	        -webkit-transform: rotate(-45deg);
	        -ms-transform: rotate(-45deg);
	        transform: rotate(-45deg);
	}
	.slick-prev:hover:after {
	        -webkit-transform: rotate(45deg);
	        -ms-transform: rotate(45deg);
	        transform: rotate(45deg);
	}
	.slick-next {
	        right: -7px;
	        right: 1rem;
	}
	.slick-next:before {
	        -webkit-transform: rotate(60deg);
	        -ms-transform: rotate(60deg);
	        transform: rotate(60deg);
	}
	.slick-next:after {
	        -webkit-transform: rotate(-60deg);
	        -ms-transform: rotate(-60deg);
	        transform: rotate(-60deg);
	}
	.slick-next:hover:before {
	        -webkit-transform: rotate(45deg);
	        -ms-transform: rotate(45deg);
	        transform: rotate(45deg);
	}
	.slick-next:hover:after {
	        -webkit-transform: rotate(-45deg);
	        -ms-transform: rotate(-45deg);
	        transform: rotate(-45deg);
	}
	.ct-slick-arrows--type2 .slick-prev,
	.ct-slick-arrows--type2 .slick-next {
	        opacity: 0.85;
	        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=85);
	        -webkit-transition: all 250ms ease-in-out;
	        transition: all 250ms ease-in-out;
	}
	.ct-slick-arrows--type2 .slick-prev:before,
	.ct-slick-arrows--type2 .slick-next:before,
	.ct-slick-arrows--type2 .slick-prev:after,
	.ct-slick-arrows--type2 .slick-next:after {
	        background-color: #fff;
	        height: 15px;
	        height: 1.5rem;
	        width: 70px;
	        width: 7rem;
	}
	.ct-slick-arrows--type2 .slick-prev:before,
	.ct-slick-arrows--type2 .slick-next:before {
	        margin-top: -20px;
	        margin-top: -2rem;
	}
	.ct-slick-arrows--type2 .slick-prev:after,
	.ct-slick-arrows--type2 .slick-next:after {
	        margin-top: 20px;
	        margin-top: 2rem;
	}
	.ct-slick-arrows--type2 .slick-prev:hover:before,
	.ct-slick-arrows--type2 .slick-next:hover:before {
	        margin-top: -20px;
	        margin-top: -2rem;
	}
	.ct-slick-arrows--type2 .slick-prev:hover:after,
	.ct-slick-arrows--type2 .slick-next:hover:after {
	        margin-top: 20px;
	        margin-top: 2rem;
	}
	.ct-slick-arrows--type2 .slick-prev:hover:active,
	.ct-slick-arrows--type2 .slick-next:hover:active {
	        opacity: 1;
	        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100);
	}
	.ct-slick-arrows--type2 .slick-prev {
	        left: 10px;
	        left: 1rem;
	}
	.ct-slick-arrows--type2 .slick-prev:before {
	        -webkit-transform: rotate(-45deg);
	        -ms-transform: rotate(-45deg);
	        transform: rotate(-45deg);
	}
	.ct-slick-arrows--type2 .slick-prev:after {
	        -webkit-transform: rotate(45deg);
	        -ms-transform: rotate(45deg);
	        transform: rotate(45deg);
	}
	.ct-slick-arrows--type2 .slick-prev:hover:before {
	        margin-top: -27px;
	        margin-top: -2.7rem;
	        -webkit-transform: rotate(-60deg);
	        -ms-transform: rotate(-60deg);
	        transform: rotate(-60deg);
	}
	.ct-slick-arrows--type2 .slick-prev:hover:after {
	        margin-top: 27px;
	        margin-top: 2.7rem;
	        -webkit-transform: rotate(60deg);
	        -ms-transform: rotate(60deg);
	        transform: rotate(60deg);
	}
	.ct-slick-arrows--type2 .slick-next {
	        right: 10px;
	        right: 1rem;
	}
	.ct-slick-arrows--type2 .slick-next:before,
	.ct-slick-arrows--type2 .slick-next:after {
	        left: auto;
	        right: 0;
	}
	.ct-slick-arrows--type2 .slick-next:before {
	        -webkit-transform: rotate(45deg);
	        -ms-transform: rotate(45deg);
	        transform: rotate(45deg);
	}
	.ct-slick-arrows--type2 .slick-next:after {
	        -webkit-transform: rotate(-45deg);
	        -ms-transform: rotate(-45deg);
	        transform: rotate(-45deg);
	}
	.ct-slick-arrows--type2 .slick-next:hover:before {
	        margin-top: -27px;
	        margin-top: -2.7rem;
	        -webkit-transform: rotate(60deg);
	        -ms-transform: rotate(60deg);
	        transform: rotate(60deg);
	}
	.ct-slick-arrows--type2 .slick-next:hover:after {
	        margin-top: 27px;
	        margin-top: 2.7rem;
	        -webkit-transform: rotate(-60deg);
	        -ms-transform: rotate(-60deg);
	        transform: rotate(-60deg);
	}
	#home.ct-header.ct-header--slider {
	        background-size: cover;
	}
	.ct-header .ct-slick {
	        margin-bottom: 0;
	}
	.slick-initialized .slick-slide {
	        display: block;
	}
	.ct-u-display-tablex {
	        display: table;
	        width: 100%;
	        height: 600px;
	  margin: -650px 0 0;
	}
	.ct-u-display-tablex > .inner {
	        display: table-cell;
	        width: 100%;
	        vertical-align: middle;
	}
	.ct-header h1.big {
	        font-size: 6.7rem;
	        line-height: 1;
	        color: #fff;
	        font-family: 'Open Sans Condensed', sans-serif;
	        font-weight: 700;
	        padding-top: 50px;
	}
	.ct-header p {
	        font-size: 2.3rem;
	        line-height: 1.1;
	        margin: 30px 0 40px;
	        color: #fff;
	}
	.btn {
	        text-transform: uppercase;
	    font-weight: bold;
	    padding: 15px 26px;
	    padding: 1.5rem 2.6rem;
	    color: #fff;
	    border-radius: 0;
	    border: none;
	    font-size: 22px;
	    font-size: 2.2rem;
	}
	* {
	outline: none !important;
	}
	.btn:hover,
	.btn:focus,
	.btn:active {
	        color: #fff;
	}
	.btn-transparent {
	        background-color: transparent;
	        border: 3px solid #fff;
	}
	.ct-slick .slick-track,
	.ct-slick .slick-list,
	.ct-slick .item,
	.ct-slick .slick-item {
	        min-height: inherit;
	}
	.ct-slick .item {
	        background-size: cover;
	}
	.slick-list {
	        height: 600px;
	}
</style>

</head>
<body>
	
	<div class="ct-header ct-header--slider ct-slick-custom-dots" id="home">
	<div class="ct-slick-homepage" data-arrows="true" data-autoplay="true">
	  
	<div class="ct-header tablex item">
	        <img data-lazy="../../images/poster/banner/poster_banner_1.jpg" style="width:100%;">
	      <div class="ct-u-display-tablex">
	        <div class="inner">
	          <div class="container">
	            <div class="row">
	              <div class="col-md-8 col-lg-6 slider-inner">
	                <h1 class="big">Lorem Ipsum Dolor sit Amet</h1>
	                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem.</p>
	                <a class="btn btn-transparent btn-lg text-uppercase" href="#">Learn More</a>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	<div class="ct-header tablex item">
	        <img data-lazy="../../images/poster/banner/poster_banner_2.jpg" style="width:100%;">
	      <div class="ct-u-display-tablex">
	        <div class="inner">
	          <div class="container">
	            <div class="row">
	              <div class="col-md-8 col-lg-6 slider-inner">
	                <h1 class="big">Lorem Ipsum Dolor sit Amet</h1>
	                <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.</p>
	                <a class="btn btn-transparent btn-lg text-uppercase" href="">Learn More</a>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	<div class="ct-header tablex item"> 
	        <img data-lazy="../../images/poster/banner/poster_banner_3.jpg" style="width:100%;">
	      <div class="ct-u-display-tablex">
	        <div class="inner">
	          <div class="container">
	            <div class="row">
	              <div class="col-md-8 col-lg-6 slider-inner">
	                <h1 class="big">Lorem Ipsum Dolor sit Amet</h1>
	                <p>Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore.</p>
	                <a class="btn btn-transparent btn-lg text-uppercase" href="">Learn More</a>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	  </div>
	</div>
	
	<script>
		$(document).ready(function(){
		  $('.ct-slick-homepage').slick({
		      lazyLoad: 'ondemand',
		    });
		});
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js" type="text/javascript"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="lazy-load.js"></script>
	<link href="lazy-slide.css">
</body>
</html>