{% block content %}

  {######################}
  {### FRIENDS BLOCK ###}
  {######################}
  <div class="friends">
    <div class="warning">
      <i id="animate" class="fa fa-volume-up"></i>
      <marquee bgcolor="f3f3f3">
        想换个口味？以下为您精选了一些博客，可以欣赏到不一样的精彩！列表排名不分先后，如果您的博客也想在这里展示，请参考“关于”页面！
      </marquee>
    </div>

    <div class="content">
    <ul class="box">
    {% for friend in theme.friends %}
      <li>
        <span> <i class="fa fa-heart-o"></i> {{ friend.name }} </span>
        <a href={{ friend.href }} target="_blank">
          <img src={{ friend.snapshot }} alt= {{ friend.slogan }} />
        </a>
      </li>
    {% endfor %}
    </ul>
    </div>
  </div>
  {##########################}
  {### END FRIENDS BLOCK ###}
  {##########################}

{% endblock %}

