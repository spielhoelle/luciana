const BODY_ELEMENT = document.getElementsByTagName('body')[0];

BODY_ELEMENT.addEventListener('click', (event) => {
  var flash = document.querySelectorAll(".flash-alert")
  for (let i = 0; i < flash.length; i++) {
    setTimeout(function() {
      flash[i].classList.remove("show");
    }, 100)
  }
});

setTimeout(function() {
  var flash = document.querySelectorAll(".flash-alert")
  for (let i = 0; i < flash.length; i++) {
    setTimeout(function() {
      flash[i].classList.remove("show");
    }, 100)
  }
}, 2000)
