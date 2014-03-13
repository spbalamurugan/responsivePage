<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ticket4bus|home</title>
<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--[if lt IE 9]>
	<script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script>
	<script type="text/javascript" src="js/html5.js"></script>
<![endif]-->
<link href='http://fonts.googleapis.com/css?family=Raleway:400,600' rel='stylesheet' type='text/css'>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/responsive.css" />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/js/modernizr.custom.96930.js" />"></script>
<link href="<c:url value="/css/jquery.fancybox.css" />" rel="stylesheet" type="text/css" />
<style type="text/css">
.tt_22 {
	cursor: pointer;
}
 div#fancy_close {
	background: url(images/close.png);
	width: 42px;
	height: 42px;
}
div#fancy_div {
	background: none;
}
    .arrow2 {
	width: 24px;
	height:24px;
}
    .btn_Table {
	cursor: pointer;
}
.feeFly {
	position: absolute;
	background: #FFF;
	color: #000;
	padding: 5px;
	font-size: 12px;
}
/* MAKE ROW SELECTED ON CLICK - START*/
    .row-selected {
	background:#ef5233;
	color:#fff;
	cursor:pointer;
}
.row-selected a {
	color: #fff;
}
/* MAKE ROW SELECTED ON CLICK - END*/
    
    
    .popup_help2 {
	display: none;
}
</style>
<script>
$(document).ready(function() {
        $("#fancybox_close").click(function(){
			
			document.getElementById('vedio_frame').style.display="none";
          // $("#vedio_frame").hide("");
           
        });
        
        /* bacancy-Search Result side bar-18/01/2013-Start */
        $(".slide").hide();
        
        $(".clickSlide").click(function(){
            $(this).next('.slide').slideToggle("slow");
            
            if($(this).next('.slide').css('height') == '1px'){
//                $(this).children('.arrow2').children().animate("slow",function(){
//                    $(this).attr('src','images/arrow2.png');
//                });
                $(this).children('.arrow2').children().attr('src','images/arrow2.png');
            }
            else{
//                $(this).children('.arrow2').children().animate("slow",function(){
//                    $(this).attr('src','images/arrow_right.png');
//                });
                $(this).children('.arrow2').children().attr('src','images/arrow_right.png');
            }
        })
        /* bacancy-Search Result side bar-18/01/2013-END */
        
        /* bacancy-popup more details-18/01/2013-Start */
        $(".more_details").fancybox({
            frameWidth    : 1250,
            frameHeight   : 1500
        });
        /* bacancy-popup more details-18/01/2013-END */
        
        
        /* bacancy-amount fly on click of button-21/01/2013-Start */
        $(".btn_Table").click(function(){
            $(".feeFly").remove();
            var btn=$(this);
            var p=$(".booking_fee");            
            var position=p.offset();
            
//            alert(position.top);
            
            var width=$(".tb_row2").width();
//            alert(width);
            
            btn.parent().append('<div class="feeFly">'+btn.val()+'</div>');            
            btn.next().animate({opacity:1,left: position.left + (width-40),top:position.top},1000,function(){    
                    $(".booking_fee span:last-child p").text(btn.val());
                    $(".subtotal p").text(btn.val());                    
                    $(this).css("top",0);
                    $(this).css("left",0);
                    $(this).css("opacity",0);
                    $(this).remove();
                });
            $(this).parent().parent().parent().find(".row-selected").removeClass("row-selected");
            
            $(this).parent().parent().addClass("row-selected");
        });
        /* bacancy-amount fly on click of button-21/01/2013-END */
        
       
        $(".seat_panel").hide();
        
//        $(".slidetoggle").live('click',function(){
//            var id1= $(this).attr("id")+"_panel";
//            $(".seat_panel").hide();
//            $(".seat_panel#"+id1).slideToggle();
////            $(".view_seats").html("Close Seats");
//        })

        $('#view_seats').live('click',function(){
            $(".seat_panel").hide();
            $('.seat_panel#view_seats_panel').slideToggle();
        })
        
        $('#view_routes').live('click',function(){
            $(".seat_panel").hide();
            $('.seat_panel#view_routes_panel').slideToggle();
        })
        
        $('#pimp').live('click',function(){
            $(".seat_panel").hide();
            $('.seat_panel#ticket2').slideToggle();
        })
        
        
        $(".close-panel").live('click',function(e){
            e.preventDefault();
            $(this).parent().parent().slideToggle();            
        })
        
        
        
        var selected=0;
        var available=0;
        $(".seat_list img[src$='seat_r.png']").each(function(i,val){
            selected=selected+1;
            $(".selected_seat").html(selected+" Selected");
        })
        
        $(".seat_list img[src$='seats.png']").each(function(i,val){
            available=available+1;
            $(".available_seat").html(available+" available");
        })
        
        $(".seat_list img").live('click',function(e){ e.preventDefault(); 
        
            if($(this).attr("src") !='images/seat_b.png'){
                if($(this).attr("src") != 'images/seat_r.png'){
                    $(this).attr("src","images/seat_r.png");
                    selected=selected+1;
                    available=available-1;
                    $(".selected_seat").html(selected+" Selected");
                    $(".available_seat").html(available+" available");
                }
                else{
                    $(this).attr("src","images/seats.png");
                    selected=selected-1;
                    available=available+1;
                    $(".selected_seat").html(selected+" Selected");
                    $(".available_seat").html(available+" available");
                }
            }
        });  
        
        
        
        
        $(".open-popup_help").live('click',function(e){
            e.preventDefault();

            var position=$(this).position();                    
            $(this).parent().parent().find(".popup_help2").show();
            $(this).parent().parent().find(".popup_help2").css("left",position.left);
        })

        $(document).mouseup(function (e)
        {
            var container = $(".popup_help2");

            if (!container.is(e.target) && container.has(e.target).length === 0)
            {                
                container.hide();
            }
        });
        
        
});


</script>

   <script type="text/javascript">
	$(document).ready(function(){	

		if (!$.browser.opera) {
    
			// select element styling
			$('select.select18').each(function(){
				var title = $(this).attr('title');
				if( $('option:selected', this).val() != ''  ) title = $('option:selected',this).text();
				$(this)
					.css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
					.after('<span class="select18">' + title + '</span>')
					.change(function(){
						val = $('option:selected',this).text();
						$(this).next().text(val);
						})
			});

		};
		
	});
	
	
	
	$(document).ready(function(){	

		if (!$.browser.opera) {
    
			// select element styling
			$('select.select19').each(function(){
				var title = $(this).attr('title');
				if( $('option:selected', this).val() != ''  ) title = $('option:selected',this).text();
				$(this)
					.css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
					.after('<span class="select19">' + title + '</span>')
					.change(function(){
						val = $('option:selected',this).text();
						$(this).next().text(val);
						})
			});

		};
		
	});
	
	
	</script>

</head>
<body id="travel_insurance" class="no-js">

<!--Header start-->

<header id="header">
  <div class="logo"><a href="home.html"><img src="images/logo.png" alt="logo" width="250" height="37" border="0"></a></div>
  <nav class="mid_nav">
    <ul>
      <li><a href="#"><img src="images/icon1.png" width="35" height="35" alt=""><span class="link_sp"> tickets</span></a>
        <ul id="red">
          <li><a href="#">All Departures</a></li>
          <li><a href="#">All Arrivals</a></li>
          <li><a href="#">Bus Arrival on Map</a></li>
          <li><a href="#">Bus Line Departure</a></li>
          <li><a href="#">My  Bus</a></li>
          <li><a href="#"> Shedule</a></li>
        </ul>
      </li>
      <li><a href="#"><img src="images/icon2.png" width="35" height="35" alt=""><span class="link_sp"> TRACKING</span></a>
        <ul id="green">
          <li><a href="#">All Departures</a></li>
          <li><a href="#">All Arrivals</a></li>
          <li><a href="#">Bus Arrival on Map</a></li>
          <li><a href="#">Bus Line Departure</a></li>
          <li><a href="#">My  Bus</a></li>
          <li><a href="#"> Shedule</a></li>
        </ul>
      </li>
      <li><a href="#"><img src="images/icon3.png" width="35" height="35" alt=""><span class="link_sp"> SPECIALS</span></a>
        <ul id="pink">
          <li><a href="#">All Departures</a></li>
          <li><a href="#">All Arrivals</a></li>
          <li><a href="#">Bus Arrival on Map</a></li>
          <li><a href="#">Bus Line Departure</a></li>
          <li><a href="#">My  Bus</a></li>
          <li><a href="#"> Shedule</a></li>
        </ul>
      </li>
      <li><a href="#"><img src="images/icon4.png" width="35" height="35" alt=""><span class="link_sp"> PINWALL</span></a></li>
      
      <!--For the subnaigation link hover color us can use id="blue" in ul -->
      
    </ul>
  </nav>
  <div class="right_header">
    <div class="nav_R">
      <ul>
        <li><a class="open_fancybox" href="#signup">join</a></li>
        <li><a href="#"  id="dropboxnav">login <img src="images/arrow.png" width="7" height="5" alt=""></a>
          <ul id="login">
            <div class="login">
              <div class="comm_md">
                <input type="text" value="Email address" onFocus="if (this.value == 'Email address') {this.value = '';}" onBlur="if (this.value == '') {this.value = 'Email address';}" class="login_fields float-left shadow" name="">
              </div>
              <div class="comm_md m_top">
                <input type="password" value="Password" onFocus="if (this.value == 'Password') {this.value = '';}" onBlur="if (this.value == '') {this.value = 'Password';}" class="login_fields float-left shadow" name="">
              </div>
              <div class="forger_log">
                <div class="frgt">
                  <div class="float-left pt10">
                    <input type="checkbox" name="">
                  </div>
                  <a href="#" id="ttlr" class="border_R">Keep me logged in</a></div>
                <div class="frgt2"><a href="#" id="ttlr">Forgot password?</a></div>
              </div>
              <div class="float-left f12">
                <input type="button" class="seach3" value="LOGIN" >
              </div>
            </div>
          </ul>
        </li>
        <li><a href="#">IMPRINT</a></li>
        <li id="nav_inner"><a href="#">blog</a></li>
        <li id="nav_inner lag" style="background:none;"><a href="#" id="dropboxnav">Language <img src="images/arrow.png" width="7" height="5" alt=""></a>
          <ul id="lang">
            <li><a href="#">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" id="nav_drop">
                <tr>
                  <td align="center" valign="middle"><img src="images/flag1.png" alt=""></td>
                  <td valign="middle">EN</td>
                  <td  align="center" valign="middle"><img src="images/check2.png" alt=""></td>
                </tr>
              </table>
              </a></li>
            <li><a href="#">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" id="nav_drop">
                <tr>
                  <td align="center" valign="middle"><img src="images/flag2.png" alt=""></td>
                  <td valign="middle">DE</td>
                  <td  align="center" valign="middle">&nbsp;</td>
                </tr>
              </table>
              </a></li>
          </ul>
        </li>
        <li id="ask" style="background:none;"><a href="#" id="dropboxnav2">
          <div class="ask text-center">Ask</div>
          </a>
          <ul id="cr_round" class="search-01">
            <li>
              <div class="ask_search">
                <input type="text" value="Search" onFocus="if (this.value == 'Search') {this.value = '';}" onBlur="if (this.value == '') {this.value = 'Search';}" class="ask_inseach float-left shadow" name="">
                <div class="float-right">
                  <input type="button" class="seach3" value="Search" >
                </div>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</header>

<!--Header End-->

<div class="comm_md mb30">
  <div class="nav4">
    <ul>
      <li><a href="#">home</a><span class="arrow_span">></span></li>
      <li><a href="#">Tickets</a><span class="arrow_span">></span></li>
      <li><a href="#" class="selected">travel insurance</a></li>
    </ul>
  </div>
</div>
<section id="content">
 
 
  <div class="form_toppanel">
    <div class="comm">
    
    <div class="f_filed">
   <label>FROM</label>   
   <div class="inform_1">

            <div class="input_md">



                <input type="text" class="input1" name="I want to travel from..." onBlur="if (this.value == '') {this.value = 'I want to travel from...';}" onFocus="if (this.value == 'I want to travel from...') {this.value = '';}" value="I want to travel from..." id="inputFrom">

            <div class="point_1"><img width="18" height="24" alt="" src="images/point_1.png"></div>

            </div>
            
           </div>
           
           </div>
           
           <div class="f_filed">
           <label>DATE</label>
           <div class="inform_2">
           
            
           
            <div class="input_md">



                <input type="text" value="3/11/12" onFocus="if (this.value == '3/11/12') {this.value = '';}" onBlur="if (this.value == '') {this.value = '3/11/12';}" name="" class="input2" id="inputDate">

           <div class="point_1"><img width="22" height="24" src="images/calander.png" alt=""></div>
               

            </div>

            </div>
            </div>
            
             <div class="f_filed2">
              <label>ADULT</label>
   
            <div class="float-left mt4">
<form method="post" action="">  
	
 <div class="select_md_fpass float-right">
            <select class="select18" >
            	
                <option class="select2">active (12)</option>
                <option>active</option>
                <option>active</option>
               
               
              
            </select>
        </div>
</form>
</div>
</div>

<div class="more_pass txt_white fw600"><div class="passener_img"><img src="images/more_passenger.png" alt=""></div><span>MORE passengers 
categories</span></div>


    </div>
    
    <div class="comm m_top">
    
    <div class="f_filed">
   <label>To</label>   
   <div class="inform_1">

            <div class="input_md">



                <input type="text" class="input1" name="I want to travel from..." onBlur="if (this.value == '') {this.value = 'I want to travel from...';}" onFocus="if (this.value == 'I want to travel from...') {this.value = '';}" value="I want to travel from..." id="inputFrom">

            <div class="point_1"><img width="18" height="24" alt="" src="images/point_1.png"></div>

            </div>
            
           </div>
           
           </div>
           
           <div class="f_filed">
           
           <div class="return_form PL_in text-center">
           
            
           <div class="return_img"><img src="images/arrow_lr.png" alt=""><span>RETURN</span></div>
           
         
           
            </div>
            </div>
            
             <div class="f_filed2">
              <label>CHILDREN</label>
   
            <div class="float-left mt4">
<form method="post" action="">  
	
 <div class="select_md_fpass float-right">
            <select class="select18" >
            	
                <option class="select18">active (12)</option>
                <option>active</option>
                <option>active</option>
               
               
              
            </select>
        </div>
</form>
</div>
</div>

<div class="more_pass2"> <div class="btn_cont2"><a href="#"><span class="sp34">Find now </span><img width="22" height="22" alt="" src="images/arrow4.png"></a></div></div>
            
    </div>
    
  </div>
  
  
  <div class="left_panel_outward">
  
  <div class="left_panel_2">
  <div class="comm">
    <div class="sr7_ttl"><h1>Schedules outward  journey</h1></div><div class="adult_count"><span class="red">1</span>Adult</div></div>
<div class="comm m_top">
 <ul class="outword_tabpanel">
 
 <li><a href="#">Th <span>28.11</span></a></li>
 
 <li><a href="#">Fr <span>29.11</span></a></li>
 <li><a href="#">Sa <span>30.11</span></a></li>
 <li><a href="#">Su <span>1.12</span></a></li>
 <li><a href="#">Mo <span>2.12</span></a></li>
 <li><a href="#">Tu <span>3.12</span></a></li>
 <li><a href="#">We <span>4.12</span></a></li>
 
 </ul>
 
 <div class="s4_fpass">
<form method="post" action="">  
	
 <div class="selectfor_fpass float-right">
            <select class="select19" >
            	
                <option class="select19">Sort</option>
                <option>price</option>
                <option>name</option>
               
               
              
            </select>
        </div>
</form>
</div></div>
 
 <div class="outword_tab">
 
    <article class="inn_table">
      <table width="100%" border="0" cellspacing="0px" cellpadding="0" class="table-bordered tabround">
        <tr>
          <th class="bx1 bgtd"><span class="divider">Tip</span></th>
          <th class="bx3 bgtd"><span class="divider routeimg">Route <img src="images/route.png" alt=""></span></th>
          <th class="td_bx1 bgtd"><span class="divider">Departure - 
Arrival Time</span></th>
          <th class="bx1 bgtd"><span class="divider">Durations - 
Stops</span></th>
          <th class="bx2 bgtd"><span class="divider">Services & Pinwall</span></th>
          <th class="td_bx2 bgtd"><span class="divider">Provider</span></th>
          <th class="bx2 bgtd"><span style="display:block;">Price for  3 Person*
incl. all tax and fee´s</span></th>
        </tr>
        <tr class="bg_tr hv1">
          <td class="bx1">
          
          <img src="images/tip.png" class="tips" alt="">
          
          </td>
          <td class="bx3">LONDON (Victoria Coach S <br/>Belgrade, Serbia<br/><a class="btn2">Show more details >></a></td>
          <td class="td_bx1">10:15<br/>15:40</td>
          <td class="bx1">4:10h<br/>non-stop</td>
          <td class="bx2">
          
          <ul class="pinwall_icon">
          
          <li><img src="images/pin_icon1.png" alt=""></li>
           <li><img src="images/pin_icon2.png" alt=""></li>
            <li><img src="images/pin_icon3.png" alt=""></li>
           <li><img src="images/pin_icon4.png" alt=""></li>
           <li><img src="images/pin_icon5.png" alt=""></li>
           
           <li><img src="images/pin_icon6.png" alt=""></li>
            <li><img src="images/pin_icon7.png" alt=""></li>
           <li><img src="images/pin_icon8.png" alt=""></li>
           <li><img src="images/pin_icon9.png" alt=""></li>
           
           
          
          </ul>
          <div class="start_rat mt15">
          <img src="images/star_select.png" alt="">
          <img src="images/star_select.png" alt="">
          <img src="images/star_select.png" alt="">
          <img src="images/star_blank.png" alt="">
          <img src="images/star_blank.png" alt="">
          
          <span class="f14">(2)</span>
          
          </div>
          
          </td>
          <td class="td_bx2"><a href="#popup" class="more_details"><img src="images/city2city_img.png" alt=""></a></td>
          <td class="bx2 yooro" style="padding-left:10px;"><span class="fw600 f20">€225.00</span><input type="button" name="" class="btn_Table" value="Choose"></td>
        </tr>
        
        
        <tr id="recomend"><td><div class="recommenda red f18 fw600 text-left">Tickets4Bus recommendation of Today</div></td></tr>
        
        
        <tr class="bg_tr hv1">
          <td class="bx1">&nbsp;
          
          
          </td>
          <td class="bx3">LONDON (Victoria Coach S <br/>Belgrade, Serbia<br/><a class="btn2">Show more details >></a></td>
          <td class="td_bx1">10:15<br/>15:40</td>
          <td class="bx1">4:10h<br/>non-stop</td>
          <td class="bx2">
          
          <ul class="pinwall_icon">
          
          <li><img src="images/pin_icon1.png" alt=""></li>
           <li><img src="images/pin_icon2.png" alt=""></li>
            <li><img src="images/pin_icon3.png" alt=""></li>
           <li><img src="images/pin_icon4.png" alt=""></li>
           <li><img src="images/pin_icon5.png" alt=""></li>
           
           <li><img src="images/pin_icon6.png" alt=""></li>
            <li><img src="images/pin_icon7.png" alt=""></li>
           <li><img src="images/pin_icon8.png" alt=""></li>
           <li><img src="images/pin_icon9.png" alt=""></li>
           
           
          
          </ul>
          <div class="start_rat mt15">
          <img src="images/star_select.png" alt="">
          <img src="images/star_select.png" alt="">
          <img src="images/star_select.png" alt="">
          <img src="images/star_blank.png" alt="">
          <img src="images/star_blank.png" alt="">
          
          <span class="f14">(2)</span>
          
          </div>
          
          </td>
          <td class="td_bx2"><a href="#popup" class="more_details"><img src="images/city2city_img.png" alt=""></a></td>
          <td class="bx2 yooro"><span class="fw600 f20">€225.00</span><input type="button" name="" class="btn_Table" value="Choose"></td>
        </tr>
        
         <tr id="recomend"><td><div class="recommenda red f18 fw600 text-left">Tickets4Bus recommendation of Today</div></td></tr>
        
        <tr class="last-child">
          <td class="bx1">&nbsp;
          
          
          
          </td>
          <td class="bx3">LONDON (Victoria Coach S <br/>Belgrade, Serbia<br/><a class="btn2">Show more details >></a></td>
          <td class="td_bx1">10:15<br/>15:40</td>
          <td class="bx1">4:10h<br/>non-stop</td>
          <td class="bx2">
          
          <ul class="pinwall_icon">
          
          <li><img src="images/pin_icon1.png" alt=""></li>
           <li><img src="images/pin_icon2.png" alt=""></li>
            <li><img src="images/pin_icon3.png" alt=""></li>
           <li><img src="images/pin_icon4.png" alt=""></li>
           <li><img src="images/pin_icon5.png" alt=""></li>
           
           <li><img src="images/pin_icon6.png" alt=""></li>
            <li><img src="images/pin_icon7.png" alt=""></li>
           <li><img src="images/pin_icon8.png" alt=""></li>
           <li><img src="images/pin_icon9.png" alt=""></li>
           
           
          
          </ul>
          <div class="start_rat mt15">
          <img src="images/star_select.png" alt="">
          <img src="images/star_select.png" alt="">
          <img src="images/star_select.png" alt="">
          <img src="images/star_blank.png" alt="">
          <img src="images/star_blank.png" alt="">
          
          <span class="f14">(2)</span>
          
          </div>
          
          </td>
          <td class="td_bx2"><a href="#popup" class="more_details"><img src="images/city2city_img.png" alt=""></a></td>
          <td class="bx2 yooro"><span class="fw600 f20">€225.00</span><input type="button" name="" class="btn_Table" value="Choose"></td>
        </tr>
      </table>
    </article>
    
    <ul class="pagi_outward">
    <li><a href="#" class="pagi_first">&nbsp;</a></li>
    <li><a href="#" class="pagi_previous">&nbsp;</a></li>
    <li><a href="#">1</a></li>
    
      <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">...</a></li>
        <li><a href="#" class="pagi_nex">&nbsp;</a></li>
        <li><a href="#" class="pagi_last">&nbsp;</a></li>
    
    </ul>
    
    </div>
    
 
  
      
  </div>
  <div class="left_panel_2 mt32">
    <h1>Points of interest close to Hamburg (Germany)</h1>
    
    <div class="comm m_top">
    
    <div class="points_md">    
    <div class="point_img1"><div class="point_couse_txt">London Lions Basketball: Pair of Tickets For 
£20.80 at The Copperbox Arena</div></div>        
    </div>
    
     <div class="points_md">    
    <div class="point_img2"><div class="point_couse_txt">LA fitness: Ten Individual Day Passes 
Including Exercise Classes for £27</div></div>        
    </div>
    
     <div class="points_md2">    
    <div class="point_img3"><div class="point_couse_txt">Winter Wonderland and Santa's Grotto Entry 
for £5 at Gulliver's Land Milton Keynes</div></div>        
    </div>
    
     <div class="points_md">    
    <div class="point_img4"><div class="point_couse_txt">The Yacht London: Two-Course Lunch for 
Two £29</div></div>        
    </div>
    
     <div class="points_md">    
    <div class="point_img5"><div class="point_couse_txt">All-You-Can-Eat Grill for £12 at Rodizio 
Britannia </div></div>        
    </div>
    
     <div class="points_md2">    
    <div class="point_img6"><div class="point_couse_txt">Bungee Jump at Choice of Location 
Nationwide For One (from £49) </div></div>        
    </div>
    
    </div>
    
    </div>
    
    </div>
  <!--Aside bar start-->
  
  <aside class="right_panel">
    <div class="right_inn">
      <div class="tt_22 clickSlide">
        <div class="arrow1"><img src="images/departure.png" width="24" height="24" alt=""></div>
        <div class="ttl_md">
          <h2>Departure</h2>
        </div>
        <div class="arrow2" align="center"><img src="images/arrow_right.png" alt=""></div>
      </div>
      
      <!-- bacancy-Search Result side bar-18/01/2013-Start -->
      
      <div class="inn_bxright m_top13 slide">
        <div class="tb_row">
          <div class="col_1">TIME</div>
          <div class="col_2 blue_txt">
            <div id="showTime1">10:00 on </div>
            <div id="showDate1" class="destination">12/11/2012</div>
          </div>
        </div>
        <div class="tb_row grayBG">
          <div class="col_1">FROM</div>
          <div class="col_2"><span class=" blue_txt">LONDON</span><br/>
            <span class="f13 blue_txt"> Victoria Coach Station</span></div>
        </div>
        <div class="tb_row">
          <div class="col_1">TO</div>
          <div class="col_2"><span class=" red blue_txt">Belgrade, Serbia</span><br/>
          </div>
        </div>
      </div>
      
      <!-- bacancy-Search Result side bar-18/01/2013-END --> 
      
    </div>
    <div class="right_inn m_top">
      <div class="tt_22 clickSlide">
        <div class="arrow1"><img src="images/arrow_3.png" width="24" height="24" alt=""></div>
        <div class="ttl_md">
          <h2>Return</h2>
        </div>
        <div class="arrow2" align="center"><img src="images/arrow_right.png" alt=""></div>
      </div>
      
      <!-- bacancy-Search Result side bar-18/01/2013-Start -->
      
      <div class="inn_bxright m_top13 slide" >
        <div class="tb_row">
          <div class="col_1">TIME</div>
          <div class="col_2 blue_txt">
            <div id="showTime2">20:00 on </div>
            <div id="showDate2" class="destination">12/11/2012</div>
          </div>
        </div>
        <div class="tb_row grayBG">
          <div class="col_1">FROM</div>
          <div class="col_2"><span class=" blue_txt">Belgrade, Serbia</span><br/>
          </div>
        </div>
        <div class="tb_row ">
          <div class="col_1">TO</div>
          <div class="col_2"><span class=" blue_txt">BLONDON</span><br/>
            <span class="f13 blue_txt"> Victoria Coach Station</span></div>
        </div>
      </div>
      
      <!-- bacancy-Search Result side bar-18/01/2013-END --> 
      
    </div>
  </aside>
  
  <!--Aside bar start--> 
  
</section>

<!-- bacancy-popup more details-18/01/2013-Start -->
<div class="popup" id="popup" style="display: none"> 
  
  <!--<span class="close"><a href="#"><img src="images/close.png" alt=""></a></span>-->
  
  <div class="p_head">
    <div class="p_headLeft">Additional Information for  London - Belgrade on November 12th, 2012</div>
    <div class="p_headRgiht">
      <div class="btn2">Choose this journey</div>
    </div>
  </div>
  
  <!--popup content part start-->
  
  <div class="pop_content">
    <div class="p_txt">
      <p>Fares from: Fares based on your passenger selections, date and time. The fares listed are offered only as part of a return journey. Our lowest fares sell out quickly: To avoid personal 
        disappointment please book your trip as soon as possible.</p>
    </div>
    <div class="comm_md">
      <div class="btn_coaches text-center">Show Earlier Coaches</div>
    </div>
    <div class="comm_md m_top">
      <div class="tt_22_2">
        <div class="arrow1"><img width="24" height="24" alt="" src="images/departure.png"></div>
        <div class="ttl_md2">
          <h2>Departure</h2>
        </div>
      </div>
    </div>
    
  
    
    <article class="inn_table m_top">
      <table width="100%" cellspacing="0px" cellpadding="0" border="0" class="table-bordered" id="departure">
        <tbody>
          <tr>
            <th class="bx1 bgtd"><span class="divider">Departs</span></th>
            <th class="bx6 bgtd"><span class="divider lefttxt2">From</span></th>
            <th class="bx1 bgtd"><span class="divider lefttxt2">To</span></th>
            <th class="bx1 bgtd"><span class="divider">Arrives</span></th>
            <th class="bx1 bgtd"><span class="divider">Duration</span></th>
            <th class="bx1 bgtd"><span class="divider">Passengers</span></th>
            <th class="bx1 bgtd"><span class="divider">Changes</span></th>
            <th class="bx1 bgtd"><span class="divider">Stop</span></th>
            <th class="bx1 bgtd"><span class="divider">Fare</span></th>
            <th class="bx1 bgtd"><span class="divider">Seats</span></th>
            <th class="bx1 bgtd"><span class="divider">Operated by</span></th>
            <th class="bx1 bgtd"><span style="display:block;">Bus type</span></th>
          </tr>
          <tr>
            <td class="bx1">20:00</td>
            <td class="bx5 lefttxt2" ><span class="red red14">LONDON</span><br/>
              Victoria Coach Station</td>
            <td class="bx7 lefttxt2"><span class="red red14">Belgrade</span><br/>
              Serbia</td>
            <td class="bx1">10:00</td>
            <td class="bx1">14h</td>
            <td class="bx1">Adults 1</td>
            <td class="bx1">1</td>
            <td class="bx1">stop</td>
            <td class="bx1">£225.00</td>
            <td class="bx1 Lhight">12<br/>
              04</td>
            <td class="bx1"><span class="red red14">Stuttgart</span><br/>
              <span>Tours</span></td>
            <td class="bx1 text-center"><span class="red red14">Volvo 64</span><br/>
              <span>Seater</span></td>
          </tr>
          <tr>
            <td class="bx1">&nbsp;</td>
            <td class="bx5 lefttxt2" ><div class="btn_coaches2 text-center">View Map</div></td>
            <td class="bx1 lefttxt2"><div class="btn_coaches2 text-center">View Map</div></td>
            <td class="bx1">&nbsp;</td>
            <td class="bx1">&nbsp;</td>
            <td class="bx1"><div class="btn_coaches2 text-center">Add More</div></td>
            <td class="bx1"><div class="btn_coaches2 text-center">Route</div></td>
            <td class="bx1"><div class="btn_coaches2 text-center slidetoggle" id="view_routes">Timetable</div></td>
            <td class="bx1"><div class="btn_coaches2 text-center slidetoggle" id="pimp">Pimp</div></td>
            <td class="bx1 Lhight"><div class="btn_coaches2 text-center slidetoggle" id="view_seats">View Seats</div></td>
            <td class="bx1"><div class="btn_coaches2 text-center">Pin</div></td>
            <td class="bx7 text-center"><div class="btn_coaches2 text-center">Images</div></td>
          </tr>
        </tbody>
      </table>
    </article>
    
    
    <!--seat panel start-->
    
    <div class="seat_panel" id="view_seats_panel">
      <div class="comm_md"><a href="#" class="blue_txt float-right p10 f13 close-panel">Close</a></div>
      <div class="seat_md_left">
        <div class="seats">
          <div class="comm_md mt35">
            <div class="seat_list">
              <ul>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
              </ul>
            </div>
            <div class="seat_list">
              <ul>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seat_b.png" alt=""></a></li>
                <li><a href="#"><img src="images/seat_b.png" alt=""></a></li>
                <li><a href="#"><img src="images/seat_b.png" alt=""></a></li>
                <li><a href="#"><img src="images/seat_r.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
              </ul>
            </div>
          </div>
          <div class="comm_md mt35 mb35">
            <div class="seat_list">
              <ul>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seat_r.png" alt=""></a></li>
                <li><a href="#"><img src="images/seat_r.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
              </ul>
            </div>
            <div class="seat_list">
              <ul>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug2"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug2"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug2"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a><span class="plug2"><img src="images/plug.png" alt=""></span></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
                <li><a href="#"><img src="images/seats.png" alt=""></a></li>
              </ul>
            </div>
          </div>
          <div class="availabel mb30  bold">
            <div class="ava">
              <div class="availabel_seat"><img src="images/seat_w.png" alt=""></div>
              <div class="availabel_seat_no available_seat">12 available</div>
            </div>
            <div class="ava">
              <div class="availabel_seat"><img src="images/seat_r.png" alt=""></div>
              <div class="availabel_seat_no selected_seat">5 Selected</div>
            </div>
          </div>
        </div>
      </div>
      <div class="seat_detail">
        <div class="comm_md">
          <div class="s_coinleft"><img src="images/seat_w.png" width="36" height="35" alt=""></div>
          <div class="s_coinRight">Available<span><img width="24" height="24" alt="" src="images/help.png"></span></div>
        </div>
        <div class="comm_md">
          <div class="s_coinleft"><img src="images/seat_r.png" width="36" height="35" alt=""></div>
          <div class="s_coinRight">Selected seat<span><img width="24" height="24" alt="" src="images/help.png"></span></div>
        </div>
        <div class="comm_md">
          <div class="s_coinleft"><img src="images/seat_g.png" width="36" height="35" alt=""></div>
          <div class="s_coinRight">Seats free for handicapped only<img width="24" height="24" alt="" src="images/help.png"></div>
        </div>
        <div class="comm_md">
          <div class="s_coinleft"><img src="images/seat_b.png" width="36" height="35" alt=""></div>
          <div class="s_coinRight pt10">Booked seat</div>
        </div>
        <div class="comm_md">
          <div class="s_btn_74"> <a href="#">
            <div class="btn_cont22"><img width="22" height="22" alt="" src="images/reve.png"> <span class="sp34 uppercase">pinwall </span></div>
            </a> </div>
        </div>
        <div class="comm_md">
          <div class="s_btn_74"> <a href="#">
            <div class="btn_cont"><span class="sp34 uppercase">reserve your seats </span><img width="22" height="22" alt="" src="images/arrow4.png"></div>
            </a> </div>
        </div>
        <div class="comm_md">
          <div class="s_btn_74 text-center f14"> Your reservation fee will be EUR 1,00<img width="24" height="24" alt="" src="images/help.png"></div>
        </div>
      </div>
    </div>
    
    <!--seat panel end--> 
    
    <!--seat panel start-->
    
    <div class="seat_panel" id="view_routes_panel">
      <div class="comm_md"><a href="#" class="blue_txt float-right p10 f13 close-panel">Close</a></div>
      <div class="akk_left">
        <div class="comm_md">
          <div class="ak20"><a href="#">
            <div class="btn_AKK"><span class="sp34 f25">AKK 124 </span></div>
            </a></div>
          <div class="ak60"><span class="f22 bold">LONDON to BELGRADE</span><br/>
            <span class="f16">Sun, January 20th, 2013  / 08:10 AM</span></div>
          <div class="ak20"> <a style="position:relative;" class="open-popup_help" href="#"><img width="20" height="20" alt="" src="images/question.png"></a>
            <div class="popup_help2 float-left f13 Z_in2">
              <div class="info_pop">
                <ul>
                  <li><a href="#"><img src="images/check.png" alt="">Operates daily</a></li>
                  <li><a href="#"><img src="images/check.png" alt="">Uses Eurotunnel</a></li>
                  <li><a href="#"><img src="images/check.png" alt="">Toilet on board</a></li>
                  <li><a href="#"><img src="images/check.png" alt="">Power plugs</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="comm_md">
          <div class="ak_dis_left">1</div>
          <div class="ak_dis_right">
            <div  class="akk_tip">
              <div class="arrowtips"><img src="images/arrow15.png" alt=""></div>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tips23">
                <tr>
                  <th width="45%" align="left"><span class="uppercase red red14 bold">munich</span></th>
                  <th width="22%" align="left">Arrival</th>
                  <th width="21%" align="left">Departure</th>
                  <th width="12%">Map</th>
                </tr>
                <tr>
                  <td><span class="uppercase">Zob</span></td>
                  <td>07:55 AM</td>
                  <td>08:10 AM</td>
                  <td align="center"><img src="images/icon13.png" alt=""></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="comm_md">
          <div class="ak_dis_left">2</div>
          <div class="ak_dis_right">
            <div  class="akk_tip">
              <div class="arrowtips"><img src="images/arrow15.png" alt=""></div>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tips23">
                <tr>
                  <th width="45%" align="left"><span class="uppercase red red14 bold">munich</span></th>
                  <th width="22%" align="left">Arrival</th>
                  <th width="21%" align="left">Departure</th>
                  <th width="12%">Map</th>
                </tr>
                <tr>
                  <td><span class="uppercase">Zob</span></td>
                  <td>07:55 AM</td>
                  <td>08:10 AM</td>
                  <td align="center"><img src="images/icon13.png" alt=""></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="comm_md">
          <div class="ak_dis_left">3</div>
          <div class="ak_dis_right">
            <div  class="akk_tip">
              <div class="arrowtips"><img src="images/arrow15.png" alt=""></div>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tips23">
                <tr>
                  <th width="45%" align="left"><span class="uppercase red red14 bold">munich</span></th>
                  <th width="22%" align="left">Arrival</th>
                  <th width="21%" align="left">Departure</th>
                  <th width="12%">Map</th>
                </tr>
                <tr>
                  <td><span class="uppercase">Zob</span></td>
                  <td>07:55 AM</td>
                  <td>08:10 AM</td>
                  <td align="center"><img src="images/icon13.png" alt=""></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="akk_map">
        <iframe width="100%" height="258" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/?ie=UTF8&amp;ll=80.474065,162.421875&amp;spn=45.378333,344.179688&amp;t=m&amp;z=2&amp;output=embed"></iframe>
        <br />
        <small><a href="http://maps.google.com/?ie=UTF8&amp;ll=80.474065,162.421875&amp;spn=45.378333,344.179688&amp;t=m&amp;z=2&amp;source=embed" style="color:#0000FF;text-align:left">View Larger Map</a></small> </div>
    </div>
    
    <!--seat panel end--> 
    
    <!--tune my ticket part start-->
    
    <div id="ticket2" class="blue_bg seat_panel">
      <div class="comm_md"><a href="#" class="txt_white float-right p10 f13 close-panel">Close</a></div>
      <div class="incontent"> 
        
        <!--Top selector part-->
        <div class="comm_md">
          <div class="dp_select m_b5">
            <form method="post" action="">
              <div class="select_md5 float-left">
                <select class="select2" >
                  <option class="select2">Other departure time</option>
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                </select>
              </div>
            </form>
          </div>
          <div class="top_weeks_MD">
            <div class="tweek_arrow"><img src="images/arrow_week.png" alt="" align="right"></div>
            <div class="tweek_in lineheight36">
              <div class="weekday_2_back float-left lineheight36 f13 blue_txt text-right">Tuesday, Dec 11th</div>
              <div class="weekday_2_back float-right lineheight36 f13 blue_txt text-right">Thursday, Dec 13th</div>
            </div>
            <div class="tweek_arrow"><img src="images/arrow_week2.png" alt="" align="left"></div>
          </div>
        </div>
        <div class="pimp">
          <div class="month_hoverMD">
            <div class="comm_md text-center bold f16 m_top"> Wednesday, Dec 12th </div>
            <div class="comm_md mt46">
              <div class="comm_md border_bottom2 border_top2">
                <div class="mnth_hvleft float-left lineheight36 bold f20 text-center">15,00€</div>
                <div class="mnth_hvright float-left lineheight36 bold f20 graytxt text-left">
                  <input type="button" value="Select Ticket" class="btn_selectticket" name="">
                </div>
              </div>
              <div class="comm_md border_bottom2">
                <div class="mnth_hvleft float-left lineheight36 bold f20 text-center">16,00€</div>
                <div class="mnth_hvright float-left lineheight36 bold f20 graytxt text-left">
                  <input type="button" value="Select Ticket" class="btn_selectticket" name="">
                </div>
              </div>
              <div class="comm_md border_bottom2">
                <div class="mnth_hvleft float-left lineheight36 bold f20 text-center">32,00€</div>
                <div class="mnth_hvright float-left lineheight36 bold f20 graytxt text-left">
                  <input type="button" value="Select Ticket" class="btn_selectticket" name="">
                </div>
              </div>
              <div class="comm_md">
                <div class="mnth_hvleft float-left lineheight36 bold f20 text-center">105,00€</div>
                <div class="mnth_hvright float-left lineheight36 bold f20 graytxt text-left">
                  <input type="button" value="Select Ticket" class="btn_selectticket" name="">
                </div>
              </div>
            </div>
          </div>
          <div class="comm_md border_bottom2">
            <div class="pimp1 uppercase f12 red lineheight36	"> Pimp your ticket by </div>
          </div>
          <div class="comm_md border_bottom2">
            <div class="pimp1 bold f14 lineheight36	"> Advance Purchased Ticket <a href="#" style="position:relative; padding-left:5px;"><img width="20" height="20" class="vertical_img" src="images/question.png" alt=""> </a> </div>
            <div class="weekday_1_back float-left lineheight36 bold f20 graytxt text-right">15,00€</div>
            <div class="weekday_1_back float-right lineheight36 bold f20 graytxt text-right">15,00€</div>
          </div>
          <div class="comm_md border_bottom2">
            <div class="pimp1 bold f14 lineheight36	"> T4B Web Only <a href="#" style="position:relative; padding-left:5px;"><img width="20" height="20" class="vertical_img" src="images/question.png" alt=""> </a> </div>
            <div class="weekday_1_back float-left lineheight36 bold f20 graytxt text-right">16,00€</div>
            <div class="weekday_1_back float-right lineheight36 bold f20 graytxt text-right">16,00€</div>
          </div>
          <div class="comm_md border_bottom2">
            <div class="pimp1 bold f14 lineheight36	"> Standard Ticket <a href="#" style="position:relative; padding-left:5px;"><img width="20" height="20" class="vertical_img" src="images/question.png" alt=""> </a> </div>
            <div class="weekday_1_back float-left lineheight36 bold f20 graytxt text-right">32,00€</div>
            <div class="weekday_1_back float-right lineheight36 bold f20 graytxt text-right">32,00€</div>
          </div>
          <div class="comm_md">
            <div class="pimp1 bold f14 lineheight36	"> Free to ReBook Ticket Cancellation Poss. Without Cost <a href="#" style="position:relative; padding-left:5px;"><img width="20" height="20" class="vertical_img" src="images/question.png" alt=""> </a> </div>
            <div class="weekday_1_back float-left lineheight36 bold f20 graytxt text-right">105,00€</div>
            <div class="weekday_1_back float-right lineheight36 bold f20 graytxt text-right">105,00€</div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- END -->
    
    <div class="comm_md">
      <div class="btn_coaches text-center">Show Later Coaches</div>
    </div>
    <div class="p_txt m_top">
      <p>Fares from: Fares based on your passenger selections, date and time. The fares listed are offered only as part of a return journey. Our lowest fares sell out quickly: To avoid personal 
        disappointment please book your trip as soon as possible.</p>
    </div>
    <div class="comm_md">
      <div class="btn_coaches text-center">Show Earlier Coaches</div>
    </div>
    <div class="comm_md m_top">
      <div class="tt_22_2">
        <div class="arrow1"><img width="24" height="24" src="images/arrow_3.png" alt=""></div>
        <div class="ttl_md2">
          <h2>Arrival</h2>
        </div>
      </div>
    </div>
    <article class="inn_table m_top">
      <table width="100%" cellspacing="0px" cellpadding="0" border="0" id="departure" class="table-bordered">
        <tbody>
          <tr>
            <th class="bx1 bgtd"><span class="divider">Departs</span></th>
            <th class="bx3 bgtd"><span class="divider lefttxt">From</span></th>
            <th class="bx3 bgtd"><span class="divider lefttxt">To</span></th>
            <th class="bx1 bgtd"><span class="divider">Arrives</span></th>
            <th class="bx1 bgtd"><span class="divider">Duration</span></th>
            <th class="bx1 bgtd"><span class="divider">Passengers</span></th>
            <th class="bx1 bgtd"><span class="divider">Changes</span></th>
            <th class="bx1 bgtd"><span class="divider">Fare</span></th>
            <th class="bx1 bgtd"><span class="divider">Seats</span></th>
            <th class="bx1 bgtd"><span class="divider">Operated by</span></th>
            <th class="bx1 bgtd"><span style="display:block;">Bus type</span></th>
          </tr>
          <tr>
            <td class="bx1">20:00</td>
            <td class="bx3 lefttxt"><span class="red red14">LONDON</span><br>
              Victoria Coach Station</td>
            <td class="bx3 lefttxt"><span class="red red14">Belgrade</span><br>
              Serbia</td>
            <td class="bx1">10:00</td>
            <td class="bx1">14h</td>
            <td class="bx1">Adults 1</td>
            <td class="bx1">1</td>
            <td class="bx1">£225.00</td>
            <td class="bx1 Lhight">12<br>
              04</td>
            <td class="bx1"><span class="red red14">Stuttgart</span><br>
              <span>Tours</span></td>
            <td class="bx1 text-center"><span class="red red14">Volvo 64</span><br>
              <span>Seater</span></td>
          </tr>
          <tr>
            <td class="bx1">&nbsp;</td>
            <td class="bx3 lefttxt"><div class="btn_coaches2 text-center">View Map</div></td>
            <td class="bx3 lefttxt"><div class="btn_coaches2 text-center">View Map</div></td>
            <td class="bx1">&nbsp;</td>
            <td class="bx1">&nbsp;</td>
            <td class="bx1"><div class="btn_coaches2 text-center">Add More</div></td>
            <td class="bx1"><div class="btn_coaches2 text-center">Route</div></td>
            <td class="bx1">&nbsp;</td>
            <td class="bx1 Lhight">&nbsp;</td>
            <td class="bx1"><div class="btn_coaches2 text-center">Pin</div></td>
            <td class="bx1 text-center"><div class="btn_coaches2 text-center">Images</div></td>
          </tr>
        </tbody>
      </table>
    </article>
    <div class="comm_md">
      <div class="btn_coaches text-center">Show Earlier Coaches</div>
    </div>
    <div class="comm_md m_top">
      <div class="oprater_MD">
        <div class="comm_md">
          <div class="arrow1"><img width="24" height="24" alt="" src="images/star.png"></div>
          <div class="ttl_md2">
            <h2>Fares available</h2>
          </div>
        </div>
        <div class="p_txt m_top"> <span class="float-right"><strong>£30.00</strong></span>
          <p><strong>Euroline Flexie return</strong><br/>
            Fare you selected is ammendable but not refundable. View More</p>
        </div>
      </div>
      <div class="cus_rating">
        <div class="comm_md">
          <div class="arrow1"><img width="24" height="24" alt="" src="images/heart.png"></div>
          <div class="ttl_md2">
            <h2>Operator Customer Ratings</h2>
          </div>
        </div>
        <div class="sr_MD">
          <div class="comm_md">
            <div class="star"><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""></div>
            <div class="ratting blue_txt"><a href="#">25ratings</a></div>
          </div>
          <div class="comm_md">
            <div class="star"><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_white.png" alt=""></div>
            <div class="ratting blue_txt"><a href="#">5ratings</a></div>
          </div>
          <div class="comm_md">
            <div class="star"><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_white.png" alt=""><img src="images/star_white.png" alt=""></div>
            <div class="ratting blue_txt"><a href="#">7ratings</a></div>
          </div>
          <div class="comm_md">
            <div class="star"><img src="images/star_red.png" alt=""><img src="images/star_red.png" alt=""><img src="images/star_white.png" alt=""><img src="images/star_white.png" alt=""><img src="images/star_white.png" alt=""></div>
            <div class="ratting blue_txt"><a href="#">2ratings</a></div>
          </div>
          <div class="comm_md">
            <div class="star"><img src="images/star_red.png" alt=""><img src="images/star_white.png" alt=""><img src="images/star_white.png" alt=""><img src="images/star_white.png" alt=""><img src="images/star_white.png" alt=""></div>
            <div class="ratting blue_txt"><a href="#">1ratings</a></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- bacancy-popup more details-18/01/2013-END -->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.2.1.js"></script>

</body>
</html>
