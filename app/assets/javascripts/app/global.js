import './flashes';
import './gmap';
import './navbar';
import './grid';


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

  var articleFadeIn = function() {
    var articles = jQuery('#content').children();
    var sizes = [];
    articles.each(function(i) {
      sizes[i] = articles[i].offsetTop;
    });
    articles.each(function(i) {
      if (jQuery(window).scrollTop() > sizes[i] - 600 && jQuery(this).hasClass('faded-out')) {
        jQuery(this).removeClass('faded-out');


      }
    });
  };

  articleFadeIn();
  $(window).scroll(throttle(function(e) {
    if (!scrollTimeout) {
      scrollTimeout = setTimeout(articleFadeIn, 500);
    }
    scrollTimeout = null;

  }, 500));



  if ($('body').hasClass('welcome')) {
    $('body').scrollspy({
      target: '.navbar',
      offset: 100
    });

    $('a.page-scroll').bind('click', function(event) {
      var $ele = $(this);
      $('html, body').stop().animate({
        scrollTop: ($($ele.attr('href')).offset().top - 60)
      }, 600);
      if ($ele[0].innerText == "Hire me"){
        document.getElementById('contact_name').focus();
      }
      event.preventDefault();
    });
  }


  // $('#galleryModal').on('show.bs.modal', function(e) {
  //   $('#galleryImage').attr("src", $(e.relatedTarget).data("src"));
  // });
});
