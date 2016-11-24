// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.slick
//= require turbolinks
//= require bootstrap
//= require lightbox
//= require_tree .


jQuery(document).ready(function(){
  $('.scroller').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    dots: true
  });
});

 $(document).ready(function(){
   setTimeout(function(){
     $('.alert-wrapper').fadeOut("slow", function(){
       $(this).remove();
     })
   }, 3000);
});

$(document).ready(function() {
 var uploadObj = $("#clip_video").uploadFile({
    url: "/clips",
    multiple: false,
    fileName: "movie[video]",
    autoSubmit: false,
    formData: {
      "clip[caption]": $('#clip_caption').text(),
    },
    onSuccess:function(files,data,xhr)
    {
      window.location.href = data.to;
    }
  });

  $("#fileUpload").click(function(e) {
    e.preventDefault();
    $.rails.disableFormElements($($.rails.formSubmitSelector));
    uploadObj.startUpload();
  });
});
