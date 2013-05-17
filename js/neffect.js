/*
" --------------------------------------------------
"   FileName: neffect.coffee
"       Desc: 插件adapter模块
"     Author: chenglf
"      Email: chenglf@ndoo.net
"    Version: ndoo.js(v0.3.2beta)
" LastChange: 05/16/2013 20:01
" --------------------------------------------------
*/
(function($) {
  var _n, _ne;

  _n = this;
  _ne = _n.nEffect || (_n.nEffect = {});
  $.extend(_ne, {
    _effects: {},
    pluginBack: {},
    jQueryPlugin: function(name) {
      var fn;

      fn = function(option, callback, version) {
        if (typeof callback !== 'function' && !version) {
          version = callback;
          callback = void 0;
        }
        return _n.nEffect.getEffect(name, version).call(this, option, callback);
      };
      fn.isNEF = true;
      return fn;
    },
    /*
      setEffect 设置效果插件
    */

    setEffect: function(name, fn, type, version) {
      var effectHandel, isLastVersion, key, _base;

      if (type === 'jQuery') {
        if (!jQuery.fn[name] || !jQuery.fn[name].isNEF) {
          jQuery.fn[name] = this.jQueryPlugin(name);
        }
        effectHandel = (_base = this._effects)[name] || (_base[name] = {});
        isLastVersion = true;
        for (key in effectHandel) {
          if (key > version) {
            isLastVersion = false;
          }
        }
        if (isLastVersion) {
          effectHandel._last = version;
        }
        effectHandel[version] = fn;
        return true;
      }
      return void 0;
    },
    /*
      getEffect 获取效果插件
    */

    getEffect: function(name, version) {
      var effectHandel, ret;

      if (effectHandel = this._effects[name]) {
        version || (version = effectHandel._last);
        ret = effectHandel[version];
      }
      ret || (ret = new Function());
      return ret;
    }
  });
  return void 0;
}).call(this.N = this.ndoo = this.ndoo || {}, jQuery);
