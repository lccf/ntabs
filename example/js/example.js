(function() {
  var $horizontalTab;

  $horizontalTab = $('#horizontalTab');
  if ($horizontalTab.length) {
    $horizontalTab.tabs({
      current: 0,
      type: "click",
      content: ".tab_body",
      duration: 400,
      active: "active",
      effect: "slideH",
      pause: 4000,
      nav: true,
      width: 440,
      height: 262,
      single: 1,
      easing: "swing",
      move: 1,
      loop: true,
      offset: [0, 130, 0, 130],
      tabCon: true,
      tabConCtl: true,
      reverse: false,
      label: false
    }, 10);
  }
  return void 0;
})();

(function() {
  var $verticalTab;

  $verticalTab = $('#verticalTab');
  if ($verticalTab.length) {
    $verticalTab.tabs({
      current: 0,
      type: "click",
      content: ".tab_body",
      duration: 400,
      active: "active",
      effect: "slideH",
      pause: 4000,
      nav: true,
      width: 220,
      height: 365,
      single: 2,
      easing: "swing",
      move: 1,
      loop: true,
      offset: [0, 130, 0, 130],
      tabCon: true,
      tabConCtl: true,
      reverse: false,
      label: false
    }, 10);
  }
  return void 0;
})();

(function() {
  var $verticalTab;

  $verticalTab = $('#verticalTab2');
  if ($verticalTab.length) {
    $verticalTab.tabs({
      current: 0,
      type: "click",
      content: ".tab_body",
      duration: 400,
      active: "active",
      effect: "slideH",
      pause: 4000,
      nav: true,
      width: 220,
      height: 365,
      single: 2,
      easing: "swing",
      move: 1,
      loop: false,
      offset: [0, 130, 0, 0],
      tabCon: true,
      tabConCtl: true,
      reverse: false,
      label: false
    }, 10);
  }
  return void 0;
})();
