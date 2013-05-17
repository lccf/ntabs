#ntabs

一款jquery插件，用来实现各类图片幻灯及切换效果。是对公司tabs插件代码的重构，在此感谢原作者，以及对此插件做出过修改贡献的同事。

##安装

需求

- jquery

##使用说明

###调用示例

	$('elem').tabs(option [, version])
	option: object类型，设置相关调用参数
	version: int类型，设置调用插件的版本号，可选。
	#具体见example文件夹中的示例，后面会陆续补全更多的示例。

###参数说明
	参数名    默认值          说明
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
	ctrl      : false         # 是否返回控制函数
