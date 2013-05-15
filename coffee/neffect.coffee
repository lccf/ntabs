###
" --------------------------------------------------
"   FileName: neffect.coffee
"       Desc: 插件adapter模块
"     Author: chenglf
"      Email: chenglf@ndoo.net
"    Version: ndoo.js(v0.3.2beta)
" LastChange: 03/22/2013 11:56
" --------------------------------------------------
###
( ($)->
  _n = @
  _ne = _n.nEffect ||= {}
  $.extend _ne,

    _effects: {}

    # @TODO 需实现冲突插件备份功能，存储使用
    pluginBack: {}

    jQueryPlugin: (name)->
      fn = (option, callback, version)->
        if typeof callback isnt 'function' and not version
          version = callback
          callback = undefined
        _n.nEffect.getEffect(name, version).call(this, option, callback)
        undefined
      fn.isNEF = true

      fn

    ###
      setEffect 设置效果插件
    ###
    setEffect: (name, fn, type, version)->
      if type is 'jQuery'
        if not jQuery.fn[name] or not jQuery.fn[name].isNEF
          # @TODO 需实现冲突插件备份功能
          jQuery.fn[name] = @jQueryPlugin name

        effectHandel = @_effects[name] ||= {}
        isLastVersion = true

        for key of effectHandel
          if key > version
            isLastVersion = false

        if isLastVersion
          effectHandel._last = version

        effectHandel[version] = fn

        return true

      undefined

    ###
      getEffect 获取效果插件
    ###
    getEffect: (name, version)->
      if effectHandel = @_effects[name]
        version ||= effectHandel._last
        ret = effectHandel[version]

      ret ||= new Function()
      ret


  undefined

).call @N = @ndoo = @ndoo || {}, jQuery

# vim: ts=2 sts=2 sw=2 fdm=marker et
