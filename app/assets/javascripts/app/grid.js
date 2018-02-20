$(document).on('turbolinks:load', function() {
  if ($('.grid').length && $(window).outerWidth() >= 767) {
    var iso = new Isotope('.grid', {
      itemSelector: '.portfolio-item',
      stagger: 30,
      resizesContainer: false,
      hiddenStyle: {
        opacity: 0,
        transform: 'scale(0.9)'
      },
      visibleStyler: {
        opacity: 1,
        transform: 'scale(1)'
      },
      masonry: {
        columnWidth: '.grid-sizer, .grid-sizer-l, .grid-sizer-m, .grid-sizer-commercial'
      },
      layoutMode: 'packery',
      transitionDuration: '0.3s'

    });
  }
  $('.tags .tag').click(function(e) {
    e.preventDefault();
    var filter;
    $('.tags .tag').removeClass('font-weight-bold');
    $(this).addClass('font-weight-bold');
    filter = $(this).attr('data-filter');
    iso.arrange({ filter: filter });
  });
});
