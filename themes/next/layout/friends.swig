{% block content %}

  {######################}
  {### FRIENDS BLOCK ###}
  {######################}
 可以发送邮件或者每天9:00-18:00在线申请相互友链，同时为了保证质量，要求贵方博客内容完整且至少发表十篇以上原创文章，谢谢配合!
  <div>
    {% for friend in theme.friends %}
        <ul>
            <li><a href={{ friend.href }} target="_blank">{{ friend.name }}</a></li>
        </ul>
    {% endfor %}
  </div>
  {##########################}
  {### END FRIENDS BLOCK ###}
  {##########################}

{% endblock %}

