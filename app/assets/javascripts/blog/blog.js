"use strict";
function spnavInit(hbs, hls, sms, sss) {
  var hamBtn = document.getElementById(hbs);
  var hamLine = document.getElementById(hls);
  var navMenu = document.getElementById(sms);
  var spHeader = document.getElementById(sss);

  function menuToggle(hamLine, spHeader) {
    hamLine.classList.toggle("active");
    spHeader.classList.toggle("active");
  }

  function navOn(navMenu) {
    navMenu.style.display = "block";
    setTimeout(function() {navMenu.classList.add("active");}, 300);
  }

  function navOff(navMenu) {
    navMenu.classList.remove("active");
    setTimeout(function() {navMenu.style.display = "none";}, 200);
  }

  hamBtn.addEventListener('click', function() {
    if(navMenu.classList.contains("active")) {
      navOff(navMenu);
      setTimeout(function() {menuToggle(hamLine, spHeader);}, 300);
    } else {
      menuToggle(hamLine, spHeader);
      navOn(navMenu);
    }
  }, false);
}

function catInit(cbs) {
  var catBtn = document.getElementById(cbs);

  catBtn.addEventListener('click', function(e) {
    catBtn.classList.toggle('active');
  });
}

function scrollTopInit(bstr) {
  var btn = document.getElementById(bstr);
  var doc = document.documentElement;
  var top = (window.pageYOffset || doc.scrollTop)  - (doc.clientTop || 0);

  var scrollPos = debounce(function() {
    var pos = (window.pageYOffset || doc.scrollTop)  - (doc.clientTop || 0);
    if(pos !== 0 && pos > 120 ) {
      btn.classList.add("active");
    } else {
      btn.classList.remove("active");
    }
  }, 250);

  btn.addEventListener("click", function(e) {
    document.body.scrollTop = doc.scrollTop = 0;
  }, false);
  window.addEventListener("scroll", scrollPos);
}

// UTILITY FUNCTIONS
function debounce(func, wait, immediate) {
  var timeout;
  return function() {
    var context = this, args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(function() {
      timeout = null;
      if (!immediate) func.apply(context, args);
    }, wait);
    if (immediate && !timeout) func.apply(context, args);
  };
}

function lazyLoad(imgString, tempImg) {
  var images = Array.prototype.slice.call(document.querySelectorAll(imgString));
  var imgsrc = images.map(function(image) {
    var cloned = image.cloneNode(image);
    image.src = tempImg;//temporary image(or gif)
    cloned.addEventListener("load", function(e) {
      image.src = e.target.src;
      image.classList.add("active");//class to trigger opacity animation
    }, false);
  });
}
