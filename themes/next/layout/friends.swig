{% block content %}

  {######################}
  {### FRIENDS BLOCK ###}
  {######################}
  <div class="friends">
    <div class="warn">
      <i id="animate" class="fa fa-volume-up"></i>
      <marquee bgcolor="f3f3f3">
        可以发送邮件或者每天9:00-18:00在线申请互链，为了保证质量，要求贵方博客内容完整且至少发表十篇以上原创文章，谢谢配合!
      </marquee>
    </div>

    <div class="content">
    {% for friend in theme.friends %}
        <ul>
            <li>
              <span> {{ friend.name }} </span>
              <a href={{ friend.href }} target="_blank">
                <img src={{ friend.snapshot }} alt= {{ friend.slogan }} />
              </a>
            </li>
        </ul>
    {% endfor %}
    </div>
  </div>
  {##########################}
  {### END FRIENDS BLOCK ###}
  {##########################}

{% endblock %}

