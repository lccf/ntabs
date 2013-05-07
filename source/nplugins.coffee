###
" --------------------------------------------------
"   FileName: nplugins.coffee
"       Desc: 插件实现
"     Author: chenglf
"      Email: chenglf@ndoo.net
"    Version: ndoo.js(v0.3.2beta)
" LastChange: 05/07/2013 15:04
" --------------------------------------------------
###
(($)->
  _n = @

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
          target = $elem.data 'labelTarget'
          setLabel text, url, target

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
      setLabel = (text, url, target)->
        $label = $self.find '.tabLabel'
        $label.html "<a href='#{url or 'javascript:;'}' target='#{target or ''}'>#{text}</a>"
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
            else if overflow <= 0
              # 开启循环，允许边缘或溢出
              if config.loop
                if overflow < 0
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

  _n.nEffect.setEffect 'tabs', tabs_new, 'jQuery', 10

  undefined

).call @N = @ndoo = @ndoo || {}, jQuery

# vim: ts=2 sts=2 sw=2 fdm=marker et
