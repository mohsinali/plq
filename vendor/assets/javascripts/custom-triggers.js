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
  	$(this).next('.overlay').next('div').next('.courtesy').slideToggle();
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
	});
		
  $(document).tooltip();
		
		
	$("#agentFormButton").click(function() {	
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
			
	$("#venderFormButton").click(function() {	
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

	$("#dialogAgentFormButton").click(function() {
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
		$("#AgentForm").effect("highlight", {color:"#b8dae6"});
	});
		
	$("#dialogVenderFormButton").click(function() {
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
		   height: 320,
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
		service_name = $(this).attr("id");

    // Open popup
	  $( "#servicePopup" ).dialog({
		  modal: true,
      resizable: false,
      draggable: false,
      width: 700,
      height: 500,
      closeText: false,
      open: function( event, ui ) { 
        get_service_data(service_name);
      }
		});
    
    $( "#servicePopup" ).effect( "highlight" );
	
		$( "#servicePopup" ).dialog({
		  beforeClose: function( event, ui ) {
			  $( "#servicePopup" ).dialog( "option", "title", '' );
        $(".service_image").attr('src', '');
        $(".text").html('');
			  }		
    });
	});
		
		
  function get_service_data(service_name){
    data = "";
    $.ajax({
      method: "GET",        
      url: "/visitors/service_content",
      dataType: 'JSON',
      data: {service_name: service_name}
    })
    .done(function( msg ) {
      $( "#servicePopup" ).dialog( "option", "title", msg["title"] );
      $(".service_image").attr('src', msg["image"]);
      $(".text").html(msg["content"]);
    });
  }
	
	$(".servicepopupclose").click(function() {
		$( "#servicePopup" ).hide();
	});


	$( ".userSignupButton" ).click(function() {
		$( "#UserSignUpForm" ).dialog({
		  modal: true,
		  resizable: false,
      draggable: false,
      width: 500,
      height: 320,
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

      languages_obj_array = msg[0].languages
      var languages_name_array = [];
      for (var i in languages_obj_array) {
        languages_name_array.push(languages_obj_array[i].name);
      }
      var languages = languages_name_array.join(", ");
      
	  	$(".detail_name").html(msg[0].name);
	  	$(".detail_location").html(msg[0].country);
      $(".description").html(msg[0].description);
      $(".cities").html(cities);
      $(".tier").html(msg[0].tier);
      $(".detail_services").html(services);
      $(".experience").html(msg[0].experience);
      $(".languages").html(languages);
      $(".contact_agent_from_popup").attr("agent_id", msg[0].id);
      
      if( msg[0].image.url == null )
        $(".profile_image").attr('src', "/assets/default_avatar.jpg");
      else
        $(".profile_image").attr('src', msg[0].image.url);
	  });
	}

  $( ".contact_agent" ).click(function() {
    $( "#ContactAgentForm" ).dialog({
      modal: true,
      resizable: false,
      draggable: false,
      width: 500,
      height: 320,
      closeText: false
    });
    //$( "#ContactAgentForm" ).effect( "bounce", "slow" );
    $( "#ContactAgentForm" ).effect("highlight", {color:"#b8dae6"});
  });

});