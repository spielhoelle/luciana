$(document).on('turbolinks:load', function() {


  function throttle(fn, threshhold, scope) {
    threshhold || (threshhold = 250);
    var last,
      deferTimer;
    return function () {
      var context = scope || this;

      var now = +new Date,
        args = arguments;
      if (last && now < last + threshhold) {
        // hold on to it
        clearTimeout(deferTimer);
        deferTimer = setTimeout(function () {
          last = now;
          fn.apply(context, args);
        }, threshhold);
      } else {
        last = now;
        fn.apply(context, args);
      }
    };
  }

  var scrollTimeout;  // global for any pending scrollTimeout

  $(window).scroll(function () {
    if (!scrollTimeout) {
      scrollTimeout = setTimeout(progress, 20);
    }
  });

  var progress = function () {
    var backtotop = $('.backtotop-container');
    var hint = $('#scroll_down');
    var scrolled = $(document).scrollTop();
    if (scrolled > 300) {
      hint.css({
        'opacity': '0'
      })
    } else {
      hint.css({
        'opacity': '1'
      })
    }
    if (scrolled > 500) {
      backtotop.css({
        'bottom': '0'
      })

    } else {
      backtotop.css({
        'bottom': '-50px'
      })
    }
    scrollTimeout = null;
  }



});
