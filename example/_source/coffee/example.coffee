(->
  $verticalTab= $ '#verticalTab'
  if $verticalTab.length
    $verticalTab.tabs
      current   : 0                # 初始化位置
      type      : "click"          # 动画触发类型
      content   : ".tab_body"      # 内容
      duration  : 400              # 动画时间
      active    : "active"         # 添加的class
      effect    : "slideH"         # 效果
      pause     : 4000             # 动画间隔
      nav       : true             # 是否创建控制
      width     : 220              # 宽
      height    : 365              # 高
      single    : 2                # 显示个数
      easing    : "swing"          # 擦除效果
      move      : 1                # 移动位数
      loop      : true             # 是否循环滚动
      offset    : [0, 130, 0, 130] # 溢出排列
      tabCon    : true             # 创建底部控制
      tabConCtl : true             # 启用con控制
      reverse   : false            # 是否反转运动方向
      label     : false            # 是否显示标题
    , 10

  undefined
)()
(->
  $horizontalTab = $ '#horizontalTab'
  if $horizontalTab.length
    $horizontalTab.tabs
      current   : 2                # 初始化位置
      type      : "click"          # 动画触发类型
      content   : ".tab_body"      # 内容
      duration  : 400              # 动画时间
      active    : "active"         # 添加的class
      effect    : "slideH"         # 效果
      pause     : 4000             # 动画间隔
      nav       : true             # 是否创建控制
      width     : 440              # 宽
      height    : 262              # 高
      single    : 1                # 显示个数
      easing    : "swing"          # 擦除效果
      move      : 1                # 移动位数
      loop      : true             # 是否循环滚动
      offset    : [0, 130, 0, 130] # 溢出排列
      tabCon    : true             # 创建底部控制
      tabConCtl : true             # 启用con控制
      reverse   : false            # 是否反转运动方向
      label     : false            # 是否显示标题
    , 10

  undefined
)()
(->
  $verticalTab= $ '#verticalTab2'
  if $verticalTab.length
    $verticalTab.tabs
      current   : 0              # 初始化位置
      type      : "click"        # 动画触发类型
      content   : ".tab_body"    # 内容
      duration  : 400            # 动画时间
      active    : "active"       # 添加的class
      effect    : "slideH"       # 效果
      pause     : 4000           # 动画间隔
      nav       : true           # 是否创建控制
      width     : 220            # 宽
      height    : 365            # 高
      single    : 2              # 显示个数
      easing    : "swing"        # 擦除效果
      move      : 1              # 移动位数
      loop      : false          # 是否循环滚动
      offset    : [0, 130, 0, 0] # 溢出排列
      tabCon    : true           # 创建底部控制
      tabConCtl : true           # 启用con控制
      reverse   : false          # 是否反转运动方向
      label     : false          # 是否显示标题
    , 10

  undefined
)()
(->
  $horizontalTab = $ '#horizontalTab2'
  if $horizontalTab.length
    window.horizontalTab2 = $horizontalTab.tabs
      current   : 0                # 初始化位置
      type      : "auto"           # 动画触发类型
      content   : ".tab_body"      # 内容
      duration  : 400              # 动画时间
      active    : "active"         # 添加的class
      effect    : "slideH"         # 效果
      pause     : 4000             # 动画间隔
      nav       : true             # 是否创建控制
      width     : 440              # 宽
      height    : 262              # 高
      single    : 1                # 显示个数
      easing    : "swing"          # 擦除效果
      move      : 1                # 移动位数
      loop      : true             # 是否循环滚动
      offset    : [0, 130, 0, 130] # 溢出排列
      tabCon    : true             # 创建底部控制
      tabConCtl : true             # 启用con控制
      reverse   : false            # 是否反转运动方向
      label     : false            # 是否显示标题
      ctrl      : true             # 是否返回控制
    , 10

  undefined
)()
(->
  $horizontalFade = $ '#horizontalFade'
  if $horizontalFade.length
    $horizontalFade.tabs
      current   : 0                # 初始化位置
      type      : "auto"           # 动画触发类型
      content   : ".tab_body"      # 内容
      duration  : 600              # 动画时间
      active    : "active"         # 添加的class
      effect    : "fadeM"          # 效果
      pause     : 4000             # 动画间隔
      nav       : false            # 是否创建控制
      width     : 495              # 宽
      height    : 297              # 高
      single    : 1                # 显示个数
      easing    : "swing"          # 擦除效果
      move      : 1                # 移动位数
      loop      : false            # 是否循环滚动
      offset    : [0, 0, 0, 0]     # 溢出排列
      tabCon    : true             # 创建底部控制
      tabConCtl : true             # 启用con控制
      reverse   : false            # 是否反转运动方向
      label     : false            # 是否显示标题
      ctrl      : true             # 是否返回控制
    , 10

  undefined
)()

