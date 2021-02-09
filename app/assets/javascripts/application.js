// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).on("turbolinks:load", function(){
    $("#user_form").validate({
        rules: {
            "user[name]": {
                required: true,
                rangelength: [2, 20]
            }
        }
    })
    $("#homepage_form").validate({
        rules: {
            "homepage[title]": { 
                required: true,
                rangelength: [2, 50]
            },
            "homepage[agreement]": { 
                required: true
            }
        }
    })
    
    $(".article-title").hide().fadeIn();
    $(".article-content").hide().slideDown();
    $(".homepage-list").hide().fadeIn(3000);
    
    $(".article-box").hover(function(){
        $(this).stop().animate({"background-color": "yellow" }, 1000).css("border", "3px solid black")
    }, function(){
        $(this).css("border", "").stop().animate({"background-color": ""}, 1000)
    })
    // $(".homepage-title").on({
    //     "mouseenter": function(){
    //         $(this).addClass("relative")
    //         $(this).stop().animate({
    //             fontSize: "20px",
    //         }, 300);
    //     }, 
    //     "mouseleave": function(){
    //         $(this).stop().animate({
    //             fontSize: "30px",
    //         }, 300);
    //         $(this).removeClass("relative");
    //     }
    // });
})