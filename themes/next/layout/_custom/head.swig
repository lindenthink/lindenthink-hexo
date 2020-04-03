{#
Custom head.
#}
<!-- 多级分类实现 -->
{% if page.type === 'categories'%}
  <link rel="stylesheet" href="/lib/layui/css/layui.css"  media="all">
  <script src="/lib/layui/layui.js" charset="utf-8"></script>
  <script>
    let srcCats = [];
    {% for cat in site.categories %}
        srcCats.push({
          id: '{{ cat._id }}',
          title: '{{cat.name}}',
          href: '{{cat.permalink}}',
          path: '{{cat.path}}',
          length: '{{cat.length}}'
        });
    {% endfor %}

    srcCats.map((item)=> {
      let sPaths = item.path.split("/");
      if(sPaths.length === 3) {
        item.parent = '';
      } else {
        item.parent = sPaths[sPaths.length - 3];
      }
    });

    let targetCats = toTree(srcCats);

    layui.use(['tree'], function(){
      let tree = layui.tree;
      tree.render({
        elem: '#category-all',
        data: targetCats,
        onlyIconControl: true,  //是否仅允许节点左侧图标控制展开收缩

        // click: function(obj){ // 点击当前页跳转
        //   window.location.href = obj.data.href;
        // }，
        accordion: true, // 是否开启手风琴模式
        isJump: true // 是否允许点击节点时弹出新窗口跳转
    });
  });  

  function toTree(data) {
      let result = []
      if (!Array.isArray(data)) {
          return result
      }
      data.forEach((item) => {
          delete item.children;
      });
      let map = {};
      data.forEach((item) => {
          map[item.title] = item;
          item.title = `${item.title}(${item.length})`; // 节点标题展示文章数
      });
      data.forEach((item) => {
          let parent = map[item.parent];
          if (parent) { 
            (parent.children || (parent.children = [])).push(item);
          } else {
            result.push(item);
          }
      });
      return result;
  }
  </script>
{% endif %}

{% if theme.chatra.enable %}
  <!-- Chatra {literal} -->
  <script>
      (function(d, w, c) {
          w.ChatraID = '{{ theme.chatra.id }}';
          var s = d.createElement('script');
          w[c] = w[c] || function() {
              (w[c].q = w[c].q || []).push(arguments);
          };
          s.async = true;
          s.src = 'https://call.chatra.io/chatra.js';
          if (d.head) d.head.appendChild(s);
      })(document, window, 'Chatra');
  </script>
<!-- /Chatra {/literal} -->
{% endif %}

<!-- 心型点击效果 -->
<script>
  !function (e, t, a) {function r() {for (var e = 0; e < s.length; e++) s[e].alpha <= 0 ? (t.body.removeChild(s[e].el), s.splice(e, 1)) : (s[e].y--, s[e].scale += .004, s[e].alpha -= .013, s[e].el.style.cssText = "left:" + s[e].x + "px;top:" + s[e].y + "px;opacity:" + s[e].alpha + ";transform:scale(" + s[e].scale + "," + s[e].scale + ") rotate(45deg);background:" + s[e].color + ";z-index:99999");requestAnimationFrame(r)}function n() {var t = "function" == typeof e.onclick && e.onclick;e.onclick = function (e) {t && t(), o(e)}}function o(e) {var a = t.createElement("div");a.className = "heart", s.push({el: a,x: e.clientX - 5,y: e.clientY - 5,scale: 1,alpha: 1,color: c()}), t.body.appendChild(a)}function i(e) {var a = t.createElement("style");a.type = "text/css";try {a.appendChild(t.createTextNode(e))} catch (t) {a.styleSheet.cssText = e}t.getElementsByTagName("head")[0].appendChild(a)}function c() {return "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")"}var s = [];e.requestAnimationFrame = e.requestAnimationFrame || e.webkitRequestAnimationFrame || e.mozRequestAnimationFrame || e.oRequestAnimationFrame || e.msRequestAnimationFrame || function (e) {setTimeout(e, 1e3 / 60)}, i(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"), n(), r()}(window, document);
</script>