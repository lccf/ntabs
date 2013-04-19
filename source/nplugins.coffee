###
" --------------------------------------------------
"   FileName: nplugins.coffee
"       Desc: 插件实现
"     Author: chenglf
"      Email: chenglf@ndoo.net
"    Version: ndoo.js(v0.3.2beta)
" LastChange: 04/18/2013 15:05
" --------------------------------------------------
###
(($)->
  _n = @

  # tabs_old {{{
  tabs_old = `(function(a){ return function(r,g){var n={current:0,type:"click",content:".tabContent",duration:300,active:"active",effect:"defaultE",pause:6000,nav:false,width:470,height:150,single:0,easing:"swing",move:1,overlap:0};var C=a.extend(n,r);if(!jQuery.easing.def){C.easing="swing"}var p=("string"===typeof C.content)?a(C.content):C.content;var d=p.length;var h=p.parent();var m=C.height;var u=C.width;var D=C.single;var v=C.effect;if(D>0){var c=D-C.move+1;var e="";for(var z=0;z<d;z++){if(d<=D||(D>1&&(d-z<c))){e+='<li class="hidden"></li>'}else{e+="<li></li>"}}var o=a("<ul class='tabCon'>"+e+"</ul>");var k=o.children();h.after(o)}else{var k=a(this);var o=k.parent()}var y=0;var w;var A;var j=0;var l=0;var q=(function(){var i=C.type;if(i=="hover"){i="mouseover"}if(i=="auto"){i="click"}return i})();function x(){k.eq(C.current).addClass(C.active);if(D>1){k.eq(C.current).addClass("sibl").nextUntil(k.eq(C.current+c)).addClass("sibl")}if(C.nav){b()}if(v){s()}if(v!="slide"&&v!="slideV"){p.not(":eq("+C.current+")").hide()}else{if(D&&v=="slideV"){h.parent().css({overflow:"hidden",height:m*D+"px"})}else{h.parent().css({overflow:"hidden",height:m+"px",width:(u+C.overlap*2)+"px"})}}if(v=="slide"){if(D){p.css({width:Math.floor(u/D)+"px","float":"left"});h.css({width:Math.floor(u/D)*d+"px"})}else{p.css({width:u+"px","float":"left"});h.css({width:u*d+"px"})}}if(v=="slideV"){p.css({height:m+"px"})}if(v=="fade"||v=="fadeM"){p.css({position:"absolute",left:"0",top:"0"})}if(g){g.call(k,p,C)}if(d<=1||D>=d){return}if(C.type=="auto"){f();t()}k.bind(q,B)}function t(){h.hover(function(i){clearInterval(w)},function(){f()});o.hover(function(i){clearInterval(w)},function(){f()})}function s(){h.wrap("<div class='tabContent'></div>");A=(D>0)?a(this).parent():a(this).parent().find(".tabContent");A.bind("mouseover",function(i){if(!i.fromElement){clearInterval(w)}})}function b(){var F=h.parent().css("position","relative");if(document.body.id=="apk-detail-page"){var E=a("<a href='javascript:;' class='prev' style='display:block'></a>").appendTo(F);var i=a("<a href='javascript:;' class='next' style='display:block'></a>").appendTo(F)}else{var E=a("<a href='javascript:;' class='prev' style='display:none'></a>").appendTo(F);var i=a("<a href='javascript:;' class='next' style='display:none'></a>").appendTo(F)};if(document.body.id=="apk-detail-page"){F.hover(function(){E.show();i.show()},function(){E.show();i.show()})}else{F.hover(function(){E.show();i.show()},function(){E.hide();i.hide()});};E.click(function(){if(D&&j==0){j=d-D+1}l=-1;k.eq(j-1).trigger(q)});i.click(function(){if(D&&j>=d-D){j=-1}l=1;k.eq(j+1-d).trigger(q)});if(C.type=="auto"){E.hover(function(){clearInterval(w)},function(){f()});i.hover(function(){clearInterval(w)},function(){f()})}}function f(){w=setInterval(function(){if(v=="slideC"){nextBtn.trigger("click");return}y=j+1;if(D&&v=="slide"&&y==Math.floor(d/C.move)+d%C.move-(D-C.move)){y=0}else{if(D&&v=="slideV"&&y==Math.floor(d/C.move)+d%C.move-(D-C.move)){y=0}else{if(y==d){y=0}}}k.eq(y).trigger("click");y++},C.pause)}function B(E){E.stopPropagation();var i=a(this);j=i.index();k.removeClass(C.active);i.addClass(C.active);if(D>1){k.removeClass("sibl");i.addClass("sibl").nextUntil(k.eq(j+c)).addClass("sibl")}C.efts[v]()}C.efts={slideC:function(){if(y==j){return}p.stop(true,true);h.css({overflow:"hidden",width:u+"px",position:"relative",height:m+"px"});p.css({"z-index":"-1",left:"0",position:"absolute",top:"0",display:"block"});var E=function(){p.eq(y).css({"z-index":"0",left:"0"}).animate({left:-u+"px"},C.duration,C.easing);p.eq(j).css({"z-index":"0",left:u+"px"}).animate({left:"0"},C.duration,C.easing)};var i=function(){p.eq(y).css({"z-index":"0",left:"0"}).animate({left:u+"px"},C.duration,C.easing);p.eq(j).css({"z-index":"0",left:-u+"px"}).animate({left:"0"},C.duration,C.easing)};if(l==1){E();l=0}else{if(l==-1){i();l=0}else{if(j>y){E()}else{i()}}}y=j},slideV:function(){h.stop();if(D){h.animate({marginTop:"-"+m*(j*C.move)+"px"},C.duration,C.easing)}else{h.animate({marginTop:"-"+m*j+"px"},C.duration,C.easing)}},fade:function(){p.stop(true,true).css("display","none").eq(j).fadeIn(C.duration,C.easing)},fadeM:function(){p.stop(true,true).fadeOut(C.duration).eq(j).fadeIn(C.duration,C.easing)},slide:function(){h.stop();if(D){h.animate({marginLeft:C.overlap-Math.floor(u*(j/D))*C.move+"px"},C.duration,C.easing)}else{h.animate({marginLeft:C.overlap-(u*j)+"px"},C.duration,C.easing)}},defaultE:function(){p.not(":eq("+j+")").css("display","none");p.eq(j).css("display","block")}};x();return this}})(jQuery)`
  # }}}

  # tabs_new {{{
  tabs_new = (($)->

    (option, callback)->
      config =
        current   : 0             # 初始化位置
        type      : "click"       # 动画触发类型
        content   : ".tabContent" # 内容
        duration  : 400           # 动画时间
        active    : "active"      # 添加的class
        effect    : false         # 效果
        pause     : 4000          # 动画间隔
        nav       : false         # 是否创建控制
        width     : 470           # 宽
        height    : 150           # 高
        single    : 0             # 显示个数
        easing    : "swing"       # 擦除效果
        move      : 1             # 移动位数
        loop      : false         # 是否循环滚动
        offset    : [0, 0, 0, 0]  # 溢出排列
        tabCon    : false         # 创建底部控制
        tabConCtl : true          # 启用con控制
        reverse   : false         # 是否反转运动方向
        label     : false         # 是否显示标题

      config    = $.extend config, option

      $self     = @
      $content  = $self.find config.content

      tick      = -1 #计时器变量
      count     = $content.find('>li').length
      loopstart = 0
      beforeoffset = 0

      # 初始化控制栏
      initNav = ->
        if config.nav
          $nav = $('<a href="javascript:;" class="prev"></a><a href="javascript:;" class="next"></a>').appendTo $self

          $nav.click ->
            if $(@).hasClass 'prev'
              step 'prev', true
            else
              step 'next', true
            undefined

          if config.type is 'auto' or config.type is 'autoclick'
            $nav.hover ->
              run 'stop'
              undefined
            , ->
              run 'start'
              undefined

        undefined

      initLabel = ->
        if config.label
          $label = $('<div class="tabLabel"></div>').appendTo $self
          if config.type is 'auto' or config.type is 'autoclick'
            $label.hover ->
              run 'stop'
              undefined
            , ->
              run 'start'
              undefined
        undefined

      # initTabCon 创建底部显示栏位 {{{
      initTabCon = ->
        if config.tabCon
          $tabCon = $self.find '.tabCon'

          if not $tabCon.length
            len = count
            tabCon = ''
            while len--
              tabCon += '<li></li>'
            if tabCon
              $tabCon = $("<ul class='tabCon'>#{tabCon}</ul>").appendTo $self

          # 是否启用tabCon控制
          if config.tabConCtl

            if config.type is 'auto'
              $tabCon.hover ->
                run 'stop'
                undefined
              , ->
                run 'start'
                undefined
              .find('li').bind 'mouseenter', ->
                step 'set', false, $(@).index()
                undefined

            else if config.type is 'click'
              $tabCon.find('li').bind 'click', ->
                step 'set', true, $(@).index()
                undefined

            else if config.type is 'autoclick'
              $tabCon.hover ->
                run 'stop'
                undefined
              , ->
                run 'start'
                undefined
              .find('li').bind 'click', ->
                step 'set', true, $(@).index()
                undefined

        undefined
      # }}}

      # initTabContent 创建内容区块 {{{
      initTabContent = ->
        # 创建盒子
        width = config.width * config.single + config.offset[1] + config.offset[3]
        height = config.height + config.offset[0] + config.offset[2]
        offset = config.offset

        tabContent = "<div class='tabContent' style='width:#{width}px; height:#{height}px;'></div>"

        # 前重复
        beforeOffset = offset[3] || offset[0]
        # 循环情况下的强制重复
        if beforeOffset
          beforeRepeat = count - Math.ceil(beforeOffset / config.width) - 1
          $beforeEl = $content.find("li:gt(#{beforeRepeat})").clone()
          loopstart = beforeOffset - $beforeEl.length * if config.effect is 'slideV' then config.height else config.width
          # 暂存前缀
          beforeoffset = $beforeEl.length
        else if not beforeOffset and config.loop
          $beforeEl = $content.find("li:gt(#{count-2})").clone()
          loopstart = 0 - if config.effect is 'slideV' then config.height else config.width

        # 后重复
        afterOffset = offset[1] || offset[2]
        if afterOffset
          afterRepeat = Math.ceil(afterOffset / config.width) + count % config.move + 1
          $afterEl = $self.find("li:lt(#{afterRepeat})").clone()
        else if not beforeOffset and config.loop
          $afterEl = $self.find("li:lt(1)").clone()

        # 应用重复
        $beforeEl.prependTo($content) if $beforeEl
        $afterEl.appendTo($content) if $afterEl

        #$content.find('li').css
          #width: config.width
          #height: config.height

        $content.wrap tabContent

        # 悬停
        if config.type is 'auto' or config.type is 'autoclick'
          $content.hover ->
            run 'stop'
            undefined
          , ->
            run 'start'
            undefined

        undefined

      # }}}

      # initState 初始化状态 {{{
      initState = ->
        # 初始化位置
        if config.effect == 'slideV'
          $content.css
            'height': config.height * ($content.find('li').length + 2)
            'marginTop': loopstart
        else if config.effect == 'slideH'
          $content.css
            'width': config.width * ($content.find('li').length + 2)
            'marginLeft': loopstart
        else if config.effect == 'fade' or config.effect == 'fadeM'
          $content.find('li').eq(config.current).siblings().hide()


        # 初始化tabcon选中
        setTabCon(0 - config.current % count) if config.tabCon

        if config.label
          $elem = $content.find "li:eq(#{beforeoffset - config.current})"
          text = $elem.data 'labelText'
          url = $elem.data 'labelUrl'
          setLabel text, url

        undefined
      # }}}

      # setTabCon 设置tabcon {{{
      setTabCon = (curr)->
        $li = $self.find(".tabCon li").removeClass(config.active)
        if curr+config.single > count
          $li.slice(curr).addClass config.active
          $li.slice(0,curr+config.single-count).addClass config.active
        else
          $li.slice(curr, curr + config.single)
          .addClass config.active
        true
      # }}}

      # setTitle 设置title {{{
      setLabel = (text, url)->
        $label = $self.find '.tabLabel'
        $label.html "<a href='#{url or 'javascript:;'}'>#{text}</a>"
        undefined
      # }}}

      # effect {{{
      effect =
        # @TODO reverse 待实现
        _slide: (origin, type)->
          # 变幻对象
          animate = {}
          # 当前索引
          current = config.current
          # 变化名
          animateName = 'marginLeft'

          if origin is 'v'
            animateName = 'marginTop'

          # 增量滚动
          if type is 'next'
            overflow = count + current - config.single
            # 未溢出
            if overflow - config.move > 0
              current -= config.move
              tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width

            # 已溢出或边缘情况
            else if overflow < 0
              # 开启循环，允许边缘或溢出
              if config.loop
                current += count
                tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width
                $content.css animateName, tomargin
                callback('reset', current) if callback
              # 未开启循环，直接重置
              else
                current = 1

              current -= config.move
              tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width

            # 运动后到边缘或溢出
            else
              # 开启环路情况下,允许溢出或边缘
              if config.loop
                current -= config.move
                tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width
              # 闭环
              else
                current = 0 - count + config.single
                tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width
                tomargin += if config.effect is 'slideV' then config.offset[2] else config.offset[1]

          # 减量滚动
          else if type is 'prev'
            # 正常情况
            if current < 0
              current += config.move
              tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width
            # 需重置
            else
              # 开启环路情况下
              if config.loop
                current -= count
                tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width
                $content.css animateName, tomargin
                callback('reset', current) if callback

                current += config.move
                tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width
              # 关闭环路情况下
              else
                current = 0 - count + config.single
                tomargin = loopstart + current * if config.effect is 'slideV' then config.height else config.width
                tomargin += if config.effect is 'slideV' then config.offset[2] else config.offset[1]

          # 同步，设置对象
          config.current = current
          animate[animateName] = tomargin
          # 应用动画
          $content.stop(true, true)
          .animate animate
          , config.duration
          , config.easing
          , ->
            if callback
              callback 'effectover', current
            undefined

          undefined

        slideH: (type)->
          effect._slide 'h', type
          undefined
        slideV: (type)->
          effect._slide 'v', type
          undefined

        _fade: (e, type, useEffect=true)->
          prev = current = config.current
          if type is 'next'
            if count + current - config.move <= 0
              current += count

            current -= config.move
          else if type is 'prev'
            if current + config.move > 0
              current -= count

            current += config.move

          config.current = current

          if e is 'default'
            $content.find('li').stop(true, true).hide()
          else if e is 'out'
            $content.find('li').stop(true, true).css('z-index', 1)
            .eq(beforeoffset - prev).css('z-index',2).end().eq(beforeoffset - current).hide().css('z-index', 3)
            #$content.find('li').stop(true, true).css('z-index', 1).eq(beforeoffset - config.current).hide().css('z-index',2)

          if useEffect
            $content.find("li:eq(#{beforeoffset - config.current})").fadeIn config.duration
            , config.easing
            , ->
              if callback
                callback 'effectover', current
                undefined
          else
            $content.find("li:eq(#{beforeoffset - config.current})").show config.duration
            , config.easing
            , ->
              if callback
                callback 'effectover', current
              undefined

          undefined

        fade: (type)->
          effect._fade 'default', type

          undefined

        fadeM: (type)->
          effect._fade 'out', type
          undefined

        default: (type)->
          effect._fade 'default', type, false
          undefined
      # }}}

      step = (type="next", ctrl=false, index)->
        # 强制停止判断
        ###
        if not ctrl and type isnt 'set' and config.stop
          return;
        ###

        if type is 'set'
          if count - index is 1
            index = index - config.single + 1
          if index == config.current
            return;
          else if index > config.current
            type = 'next'
            config.current = 0 - index + 1
          else
            type = 'next'
            config.current = 0 - index - 1

        # 翻转
        if config.reverse
          type = if type is 'prev' then 'next' else 'prev'

        result = effect[config.effect] type

        # 添加active class
        setTabCon(0 - config.current % count) if config.tabCon

        if config.label
          $elem = $content.find "li:eq(#{beforeoffset - config.current})"
          text = $elem.data 'labelText'
          url = $elem.data 'labelUrl'
          setLabel text, url

        if callback
          callback 'step'

        if config.debug and (config.type is 'auto' or config.type is 'autoclick') and not ctrl
          tick = setTimeout step, config.pause

        undefined

      run = (type)->
        if type is 'stop'
          if config.debug
            clearTimeout tick
          else
            clearInterval tick
          tick = -1
        if type is 'start' and (config.type is 'auto' or config.type is 'autoclick')
          if config.debug
            clearTimeout tick
            tick = setTimeout step, config.pause
          else
            clearInterval tick
            tick = setInterval step, config.pause

        undefined

      # 初始化
      init = ->
        if not $self.length
          return;

        initNav()
        initLabel()
        initTabCon()
        initTabContent()
        initState()

        if callback
          callback 'init'

        run 'start'

        undefined

      # 入口
      init()

  )(jQuery)
  # }}}

  # back for old
  #jQuery.fn.tabs_old = tabs_old
  _n.nEffect.setEffect 'tabs', tabs_old, 'jQuery', 1
  _n.nEffect.setEffect 'tabs', tabs_new, 'jQuery', 10

  undefined

).call @N = @ndoo = @ndoo || {}, jQuery

# vim: ts=2 sts=2 sw=2 fdm=marker et
