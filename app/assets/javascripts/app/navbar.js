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


  //var toggleAffix = function(affixElement, scrollElement, wrapper) {

    //var height = affixElement.outerHeight(),
      //top = wrapper.offset().top;

    //if (scrollElement.scrollTop() >= top){
      //wrapper.height(height);
      //affixElement.addClass("affix");
    //}
    //else {
      //affixElement.removeClass("affix");
      //wrapper.height('auto');
    //}

  //};


  //$('[data-toggle="affix"]').each(function() {
    //var ele = $(this),
      //wrapper = $('<div></div>');

    //ele.before(wrapper);
    //$(window).on('scroll resize', function() {
      //toggleAffix(ele, $(this), wrapper);
    //});

    //// init
    //toggleAffix(ele, $(window), wrapper);
  //});



  // if (jQuery(window).width() > 800 && !jQuery.browser.mozilla || jQuery.browser.safari){
  if ($(window).width() > 800){
    var movementStrength = 25;
    var height = movementStrength / $(window).height();
    var width = movementStrength / $(window).width();
    var centerX = $('.parallax').width() / 2
    var centerY = $('.parallax').height() / 2

    $(".parallax").mousemove(throttle(function(e){
      var pageX = e.pageX - (centerX);
      var pageY = e.pageY - (centerY);
      var newvalueX = Math.round(width * pageX);
      var newvalueY = Math.round(height * pageY);

      $('#hero').css({"transform":"translate("+(newvalueX*0.5)+"px, " + (newvalueY*0.5)+"px"+")"});
      $('#hexagon-title').css({"transform":"translate("+(newvalueX*1)+"px, " + (newvalueY*1)+"px"+")"});

      $('#typed-header-target').css({"transform":"translate("+(newvalueX*1.5)+"px, " + (newvalueY*1.5)+"px"+")"});

    }, 50));
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
