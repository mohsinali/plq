$(function () {
  $("#btn_agent_signup").click(function(){
    $(".agent_loader").show();
    $("#btn_agent_signup").hide();
  });

  $("#btn_vendor_signup").click(function(){
    $(".vendor_loader").show();
    $("#btn_vendor_signup").hide();
  });

  $(".btn_sign_in").click(function(){
    $(".signin_loader").show();
    $(".btn_sign_in").hide();
  });

  $(document).on("click", ".btn_user_signup", function(e){    
    $(".user_loader").show();
    $(".btn_user_signup").hide();
  });


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
			//$( "#AgentForm" ).effect( "bounce", "slow" );
			$( "#AgentForm" ).effect("highlight", {color:"#b8dae6"});
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
			//$( "#VenderForm" ).effect( "bounce", "slow" );
			$( "#VenderForm" ).effect("highlight", {color:"#b8dae6"});
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
			//$( "#AgentForm" ).effect( "bounce", "slow" );
			$( "#AgentForm" ).effect("highlight", {color:"#b8dae6"});
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
			//$( "#VenderForm" ).effect( "bounce", "slow" );
			$( "#VenderForm" ).effect("highlight", {color:"#b8dae6"});
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
			//$( "#EarlyAccessForm" ).effect( "bounce", "slow" );
			$( "#EarlyAccessForm" ).effect("highlight", {color:"#b8dae6"});
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
			//$( "#LoginForm" ).effect( "bounce", "slow" );
			$( "#LoginForm" ).effect("highlight", {color:"#b8dae6"});
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
			//$( "#MembershipForm" ).effect( "bounce", "slow" );
			$( "#MembershipForm" ).effect("highlight", {color:"#b8dae6"});
      
      // Add Tier name in a hidden field on form.
      var tier = $(this).attr("tier");
      $("#tier").val(tier);

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
			$( "#SignupTypeSelect" ).effect("highlight", {color:"#b8dae6"});
		});
		
		
		$( "#mainmenuButton").click(function() {
			$( "#mainmenu" ).slideToggle();
		});
		
		$(".mainmenuclose").click(function() {
			$( "#mainmenu" ).slideUp();
		});
		
		$( ".service-descp").click(function() {
											
			// $( "#servicePopup" ).slideDown();
			id = $(this).attr("id");
      
		  // Append content in popup.
		  switch(id) {
        case "restaurant":
          var title = "Restaurant Reservations / Suggestions"
          $(".text").html("<p>Restaurant Reservations / Suggestions</p><p>Restaurant Reservations / Suggestions</p>");
          $(".service_image").attr('src', "/assets/restaurant-popup.jpg");
          break;
        case "chauffeur":
          var title = "Chauffeur Services"
          $(".service_image").attr('src', "/assets/driver-services-popup.jpg");
          break;
        case "interior":
          var title = "Interior Design & Home Planning"
          $(".service_image").attr('src', "/assets/interior-design-popup.jpg");
          break;
        case "nightlife":
          var title = "Nightlife & Event Hosting"
          $(".service_image").attr('src', "/assets/nightlife-popup.jpg");
          break;
        case "travel":
          var title = "Travel Coordination"
          $(".service_image").attr('src', "/assets/travel-services-popup.jpg");
          break;
        case "communication":
          var title = "24/7 Direct Communication"
          $(".service_image").attr('src', "/assets/24-7-communication-popup.jpg");
          break;
        case "accomodation":
          var title = "Accommodation Sourcing"
          $(".service_image").attr('src', "/assets/accomodation-popup.jpg");
          break;
        case "fashion":
          var title = "Fashion & Style Consolation"
          $(".service_image").attr('src', "/assets/style-popup.jpg");
          break;
        case "global":
          var title = "Global Lifestyle Management Network"
          $(".service_image").attr('src', "/assets/global-network-popup.jpg");
          break;
      }

        // Open popup
  	  $( "#servicePopup" ).dialog({
  			  modal: true,
  			  resizable: false,
          draggable: false,
          width: 700,
          height: 500,
          closeText: false,
          title: title
  			});
        $( "#servicePopup" ).effect( "highlight" );
    	
    });
		
		$(".servicepopupclose").click(function() {
			$( "#servicePopup" ).hide();
		});


		$( ".userSignupButton" ).click(function() {
			$( "#UserSignUpForm" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 500,
			   height: 270,
			   closeText: false
			});
			//$( "#UserSignUpForm" ).effect( "bounce", "slow" );
			$( "#UserSignUpForm" ).effect("highlight", {color:"#b8dae6"});
		});

    $(document).delegate('.profileDetaillink', 'click', function() {
			id = $(this).attr("id");

			$( "#ProfileDetail" ).dialog({
			  modal: true,
			  resizable: false,
			   draggable: false,
			   width: 700,
			   height: 600,
			   closeText: false,
			   open: function( event, ui ) { 
			   		// alert(id);
			   		get_json_data(id);
			   		
			    }
			});
			//$( "#ProfileDetail" ).effect( "bounce", "fast" );
			$( "#ProfileDetail" ).effect("highlight", {color:"#b8dae6"});
		});

		function get_json_data(id){
			data = "";
			$.ajax({
			  method: "GET",
			  url: "/agents/"+id,
			  dataType: 'JSON'			  
			})
			  .done(function( msg ) {
          cities_obj_array = msg[0].user_cities
          var cities_name_array = [];
          for (var i in cities_obj_array) {
            cities_name_array.push(cities_obj_array[i].name);
          }
          var cities = cities_name_array.join(", ");

          services_obj_array = msg[0].user_services
          var services_name_array = [];
          for (var i in services_obj_array) {
            services_name_array.push(services_obj_array[i].name);
          }
          var services = services_name_array.join(", ");
          
			  	$(".detail_name").html(msg[0].name);
			  	$(".detail_location").html(msg[0].country);
          $(".description").html(msg[0].description);
          $(".cities").html(cities);
          $(".tier").html(msg[0].tier);
          $(".detail_services").html(services);
          
          if( msg[0].image.url == null )
            $(".profile_image").attr('src', "/assets/default_avatar.jpg");
          else
            $(".profile_image").attr('src', msg[0].image.url);
			  });			
		}

  });