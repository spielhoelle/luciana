import './flashes';
import './gmap';
import './navbar';
$('.carousel').carousel({
  interval: 3000,
  pause: false
});


function throttle(fn, threshhold, scope) {
  threshhold || (threshhold = 250);
  var last,
    deferTimer;
  return function() {
    var context = scope || this;

    var now = +new Date,
      args = arguments;
    if (last && now < last + threshhold) {
      // hold on to it
      clearTimeout(deferTimer);
      deferTimer = setTimeout(function() {
        last = now;
        fn.apply(context, args);
      }, threshhold);
    } else {
      last = now;
      fn.apply(context, args);
    }
  };
}
var scrollTimeout; // global for any pending scrollTimeout


$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
$(document).on('turbolinks:load', function() {



  //if ($('body').hasClass('welcome')) {
    $('body').scrollspy({
      target: '.navbar',
      offset: 100
    });

    $('a.page-scroll').bind('click', function(event) {
      var $ele = $(this);
      $('html, body').stop().animate({
        scrollTop: ($($ele.attr('href')).offset().top - 60)
      }, 300);
      if ($ele[0].innerText == "Hire me"){
        document.getElementById('contact_name').focus();
      }
      event.preventDefault();
    });
  //}


  // $('#galleryModal').on('show.bs.modal', function(e) {
  //   $('#galleryImage').attr("src", $(e.relatedTarget).data("src"));
  // });
});
