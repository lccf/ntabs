/*
" --------------------------------------------------
"   FileName: nplugins.coffee
"       Desc: 插件实现
"     Author: chenglf
"      Email: chenglf@ndoo.net
"    Version: ndoo.js(v0.3.3beta)
" LastChange: 06/25/2013 17:21
" --------------------------------------------------
*/
(function($) {
  var tabs_new, _n;

  _n = this;
  tabs_new = (function($) {
    return function(option, callback) {
      var $content, $self, beforeoffset, config, count, ctrl, ctrllock, effect, init, initLabel, initNav, initState, initTabCon, initTabContent, loopstart, run, setLabel, setTabCon, step, tick;

      config = {
        current: 0,
        type: "click",
        content: ".tabContent",
        duration: 400,
        active: "active",
        effect: false,
        pause: 4000,
        nav: false,
        width: 470,
        height: 150,
        single: 0,
        easing: "swing",
        move: 1,
        loop: false,
        offset: [0, 0, 0, 0],
        tabCon: false,
        tabConCtl: true,
        reverse: false,
        label: false,
        ctrl: false
      };
      config = $.extend(config, option);
      if (config.current > 0) {
        config.current = 0 - config.current;
      }
      $self = this;
      $content = $self.find(config.content);
      tick = -1;
      ctrllock = false;
      count = $content.find('>li').length;
      loopstart = 0;
      beforeoffset = 0;
      initNav = function() {
        var $nav;

        if (config.nav) {
          $nav = $('<a href="javascript:;" class="prev"></a><a href="javascript:;" class="next"></a>').appendTo($self);
          $nav.click(function() {
            if ($(this).hasClass('prev')) {
              step('prev', true);
            } else {
              step('next', true);
            }
            return void 0;
          });
          if (config.type === 'auto' || config.type === 'autoclick') {
            $nav.hover(function() {
              run('stop');
              return void 0;
            }, function() {
              run('start');
              return void 0;
            });
          }
        }
        return void 0;
      };
      initLabel = function() {
        var $label;

        if (config.label) {
          $label = $('<div class="tabLabel"></div>').appendTo($self);
          if (config.type === 'auto' || config.type === 'autoclick') {
            $label.hover(function() {
              run('stop');
              return void 0;
            }, function() {
              run('start');
              return void 0;
            });
          }
        }
        return void 0;
      };
      initTabCon = function() {
        var $tabCon, len, tabCon;

        if (config.tabCon) {
          $tabCon = $self.find('.tabCon');
          if (!$tabCon.length) {
            len = count;
            tabCon = '';
            while (len--) {
              tabCon += '<li></li>';
            }
            if (tabCon) {
              $tabCon = $("<ul class='tabCon'>" + tabCon + "</ul>").appendTo($self);
            }
          }
          if (config.tabConCtl) {
            if (config.type === 'auto') {
              $tabCon.hover(function() {
                run('stop');
                return void 0;
              }, function() {
                run('start');
                return void 0;
              }).find('li').bind('mouseenter', function() {
                step('set', true, $(this).index());
                return void 0;
              });
            } else if (config.type === 'click') {
              $tabCon.find('li').bind('click', function() {
                step('set', true, $(this).index());
                return void 0;
              });
            } else if (config.type === 'autoclick') {
              $tabCon.hover(function() {
                run('stop');
                return void 0;
              }, function() {
                run('start');
                return void 0;
              }).find('li').bind('click', function() {
                step('set', true, $(this).index());
                return void 0;
              });
            }
          }
        }
        return void 0;
      };
      initTabContent = function() {
        var $afterEl, $beforeEl, afterOffset, afterRepeat, beforeOffset, beforeRepeat, height, offset, tabContent, width;

        width = config.width * config.single + config.offset[1] + config.offset[3];
        height = config.height + config.offset[0] + config.offset[2];
        offset = config.offset;
        tabContent = "<div class='tabContent' style='width:" + width + "px; height:" + height + "px;'></div>";
        beforeOffset = offset[3] || offset[0];
        if (beforeOffset) {
          beforeRepeat = count - Math.ceil(beforeOffset / config.width) - config.single;
          $beforeEl = $content.find("li:gt(" + beforeRepeat + ")").clone();
          loopstart = beforeOffset - $beforeEl.length * (config.effect === 'slideV' ? config.height : config.width);
          beforeoffset = $beforeEl.length;
        } else if (!beforeOffset && config.loop) {
          $beforeEl = $content.find("li:gt(" + (count - 2) + ")").clone();
          loopstart = 0 - (config.effect === 'slideV' ? config.height : config.width);
        }
        afterOffset = offset[1] || offset[2];
        if (afterOffset) {
          afterRepeat = Math.ceil(afterOffset / config.width) + count % config.move + config.single;
          $afterEl = $self.find("li:lt(" + afterRepeat + ")").clone();
        } else if (!beforeOffset && config.loop) {
          $afterEl = $self.find("li:lt(1)").clone();
        }
        if ($beforeEl) {
          $beforeEl.prependTo($content);
        }
        if ($afterEl) {
          $afterEl.appendTo($content);
        }
        $content.wrap(tabContent);
        if (config.type === 'auto' || config.type === 'autoclick') {
          $content.hover(function() {
            run('stop');
            return void 0;
          }, function() {
            run('start');
            return void 0;
          });
        }
        return void 0;
      };
      initState = function() {
        var $elem, target, text, url;

        if (config.effect === 'slideV') {
          $content.css({
            'height': config.height * ($content.find('li').length + 2),
            'marginTop': loopstart + config.height * config.current
          });
        } else if (config.effect === 'slideH') {
          $content.css({
            'width': config.width * ($content.find('li').length + 2),
            'marginLeft': loopstart + config.width * config.current
          });
        } else if (config.effect === 'fade' || config.effect === 'fadeM') {
          $content.find('li').eq(config.current).siblings().hide();
        }
        if (config.tabCon) {
          setTabCon(0 - config.current % count);
        }
        if (config.label) {
          $elem = $content.find("li:eq(" + (beforeoffset - config.current) + ")");
          text = $elem.data('labelText');
          url = $elem.data('labelUrl');
          target = $elem.data('labelTarget');
          setLabel(text, url, target);
        }
        return void 0;
      };
      setTabCon = function(curr) {
        var $li;

        $li = $self.find(".tabCon li").removeClass(config.active);
        if (curr + config.single > count) {
          $li.slice(curr).addClass(config.active);
          $li.slice(0, curr + config.single - count).addClass(config.active);
        } else {
          $li.slice(curr, curr + config.single).addClass(config.active);
        }
        return true;
      };
      setLabel = function(text, url, target) {
        var $label;

        $label = $self.find('.tabLabel');
        $label.html("<a href='" + (url || 'javascript:;') + "' target='" + (target || '') + "'>" + text + "</a>");
        return void 0;
      };
      effect = {
        _slide: function(origin, type) {
          var animate, animateName, current, overflow, tomargin;

          animate = {};
          current = config.current;
          animateName = 'marginLeft';
          if (origin === 'v') {
            animateName = 'marginTop';
          }
          if (type === 'next') {
            overflow = count + current - config.single;
            if (overflow - config.move > 0) {
              current -= config.move;
              tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
            } else if (overflow <= 0) {
              if (config.loop) {
                if (overflow < 0) {
                  current += count;
                  tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
                  $content.stop(true).css(animateName, tomargin);
                  if (callback) {
                    callback('reset', current);
                  }
                }
              } else {
                current = 1;
              }
              current -= config.move;
              tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
            } else {
              if (config.loop) {
                current -= config.move;
                tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
              } else {
                current = 0 - count + config.single;
                tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
                tomargin += config.effect === 'slideV' ? config.offset[2] : config.offset[1];
              }
            }
          } else if (type === 'prev') {
            if (current < 0) {
              current += config.move;
              tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
            } else {
              if (config.loop) {
                current -= count;
                tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
                $content.stop(true).css(animateName, tomargin);
                if (callback) {
                  callback('reset', current);
                }
                current += config.move;
                tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
              } else {
                current = 0 - count + config.single;
                tomargin = loopstart + current * (config.effect === 'slideV' ? config.height : config.width);
                tomargin += config.effect === 'slideV' ? config.offset[2] : config.offset[1];
              }
            }
          }
          config.current = current;
          animate[animateName] = tomargin;
          $content.stop(true).animate(animate, config.duration, config.easing, function() {
            if (callback) {
              callback('effectover', current);
            }
            return void 0;
          });
          return void 0;
        },
        slideH: function(type) {
          effect._slide('h', type);
          return void 0;
        },
        slideV: function(type) {
          effect._slide('v', type);
          return void 0;
        },
        _fade: function(e, type, useEffect) {
          var current, prev;

          if (useEffect == null) {
            useEffect = true;
          }
          prev = current = config.current;
          if (type === 'next') {
            if (count + current - config.move <= 0) {
              current += count;
            }
            current -= config.move;
          } else if (type === 'prev') {
            if (current + config.move > 0) {
              current -= count;
            }
            current += config.move;
          }
          config.current = current;
          if (e === 'default') {
            $content.find('li').stop(true).hide();
          } else if (e === 'out') {
            $content.find('li').stop(true).css('z-index', 1).eq(beforeoffset - prev).css('z-index', 2).end().eq(beforeoffset - current).hide().css('z-index', 3);
          }
          if (useEffect) {
            $content.find("li:eq(" + (beforeoffset - config.current) + ")").fadeIn(config.duration, config.easing, function() {
              if (callback) {
                callback('effectover', current);
                return void 0;
              }
            });
          } else {
            $content.find("li:eq(" + (beforeoffset - config.current) + ")").show(config.duration, config.easing, function() {
              if (callback) {
                callback('effectover', current);
              }
              return void 0;
            });
          }
          return void 0;
        },
        fade: function(type) {
          effect._fade('default', type);
          return void 0;
        },
        fadeM: function(type) {
          effect._fade('out', type);
          return void 0;
        },
        "default": function(type) {
          effect._fade('default', type, false);
          return void 0;
        }
      };
      step = function(type, ctrl, index) {
        var $elem, result, text, url;

        if (type == null) {
          type = "next";
        }
        if (ctrl == null) {
          ctrl = false;
        }
        /*
        if not ctrl and type isnt 'set' and config.stop
          return;
        */

        if (type === 'set') {
          if (count - index === 1) {
            index = index - config.single + 1;
          }
          if (index === config.current) {
            return;
          } else if (index > config.current) {
            type = 'next';
            config.current = 0 - index + 1;
          } else {
            type = 'next';
            config.current = 0 - index - 1;
          }
        }
        if (config.reverse) {
          type = type === 'prev' ? 'next' : 'prev';
        }
        result = effect[config.effect](type);
        if (config.tabCon) {
          setTabCon(0 - config.current % count);
        }
        if (config.label) {
          $elem = $content.find("li:eq(" + (beforeoffset - config.current) + ")");
          text = $elem.data('labelText');
          url = $elem.data('labelUrl');
          setLabel(text, url);
        }
        if (callback) {
          callback('step');
        }
        if (config.debug && (config.type === 'auto' || config.type === 'autoclick') && !ctrl) {
          tick = setTimeout(step, config.pause);
        }
        return void 0;
      };
      run = function(type) {
        if (type === 'stop') {
          if (config.debug) {
            clearTimeout(tick);
          } else {
            clearInterval(tick);
          }
          tick = -1;
        }
        if (type === 'start' && !ctrllock && (config.type === 'auto' || config.type === 'autoclick')) {
          if (config.debug) {
            clearTimeout(tick);
            tick = setTimeout(step, config.pause);
          } else {
            clearInterval(tick);
            tick = setInterval(step, config.pause);
          }
        }
        return void 0;
      };
      ctrl = function(type) {
        if (type === 'stop' && tick !== -1) {
          ctrllock = true;
          run(type);
        }
        if (type === 'start' && tick === -1) {
          ctrllock = false;
          return run(type);
        }
      };
      init = function() {
        if (!$self.length) {
          return;
        }
        initNav();
        initLabel();
        initTabCon();
        initTabContent();
        initState();
        if (callback) {
          callback('init');
        }
        run('start');
        if (config.ctrl) {
          $self.ctrl = ctrl;
        }
        return void 0;
      };
      init();
      return $self;
    };
  })(jQuery);
  _n.nEffect.setEffect('tabs', tabs_new, 'jQuery', 10);
  return void 0;
}).call(this.N = this.ndoo = this.ndoo || {}, jQuery);
