$(function () {
      $("#homeslider").responsiveSlides({
        //maxwidth: 800,
        speed: 800,
		nav: false, 
		auto: true
      });
	  $("#testislider").responsiveSlides({
        //maxwidth: 800,
        speed: 800,
		nav: false, 
		pager: false,
		auto: true
		
      });
	  
	  
	  $(".service a").hover(function(){	 
		$(this).next('.overlay').slideToggle();
	  });
	  
	  $.widget("ui.tooltip", $.ui.tooltip, {
			options: {
				content: function () {
					return $(this).prop('title');
				}
			}
		});
	  
	    $('.item').attr('title', function(){
        return $(this).next('.statusRollup').remove().html()
    	})
		
    	$(document).tooltip();
		
		
		$( "#agentFormButton" ).click(function() {
		
		
			$( "#AgentForm" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 600,
			   closeText: false
			});
			$( "#AgentForm" ).effect( "bounce", "slow" );
		});
		
		
		
		$( "#venderFormButton" ).click(function() {
		
		
			$( "#VenderForm" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 600,
			   closeText: false
			});
			$( "#VenderForm" ).effect( "bounce", "slow" );
		});
		
		
		$( "#dialogAgentFormButton" ).click(function() {
		
			$( "#SignupTypeSelect" ).dialog( "close" );
			
			$( "#AgentForm" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 600,
			   closeText: false
			});
			$( "#AgentForm" ).effect( "bounce", "slow" );
		});
		
		
		
		$( "#dialogVenderFormButton" ).click(function() {
		
			$( "#SignupTypeSelect" ).dialog( "close" );
			$( "#VenderForm" ).dialog({
			  modal: true,
			  resizable: false,
			  draggable: false,
			  width: 500,
			  height: 600,
			  closeText: false
			});
			$( "#VenderForm" ).effect( "bounce", "slow" );
		});
		
		
		$( "#earlyAccessSignupButton" ).click(function() {
		
		
			$( "#EarlyAccessForm" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 270,
			   closeText: false
			});
			$( "#EarlyAccessForm" ).effect( "bounce", "slow" );
		});
		
		
		$( "#loginButton" ).click(function() {
		
		
			$( "#LoginForm" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 270,
			   closeText: false
			});
			$( "#LoginForm" ).effect( "bounce", "slow" );
		});
		
		$( ".membershipButtons" ).click(function() {
		
		
			$( "#MembershipForm" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 490,
			   closeText: false
			});
			$( "#MembershipForm" ).effect( "bounce", "slow" );
		});
		
		$( ".askSignupType" ).click(function() {
		
		
			$( "#SignupTypeSelect" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 200,
			   closeText: false
			});
			$( "#SignupTypeSelect" ).effect( "bounce", "slow" );
		});
		
		
		$( "#mainmenuButton").click(function() {
			$( "#mainmenu" ).slideToggle();
		});
		
		$(".mainmenuclose").click(function() {
			$( "#mainmenu" ).slideUp();
		});
		
		$( ".service-descp").click(function() {
			// $( "#servicePopup" ).slideDown();
			$( "#servicePopup" ).effect( "highlight" );
		});
		
		$(".servicepopupclose").click(function() {
			$( "#servicePopup" ).hide();
		});

  });