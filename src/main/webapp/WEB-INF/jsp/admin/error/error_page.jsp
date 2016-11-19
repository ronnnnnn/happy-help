<%--
  Created by IntelliJ IDEA.
  User: ron
  Date: 16-11-18
  Time: 下午9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ch"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href=".${pageContext.request.contextPath}/static/errorPage/font-awesome.min.css">
    <title>您找的页面跑的比香港记者还快:-(</title>
    <style type="text/css">
    </style>
</head>
    <body bgcolor="#eaeaea">
      <div align="center">
          <br/>
          <br/>
          <br/>
        <h1 style="text-align:center;font-size:350%;font-family:SimHei;"><i class="fa fa-clock-o fa-pulse"></i> ${errorCode} 难再续 </h1>
        <p style="text-align:center;font-family:YouYuan;"> (点击图片一秒返回主页，一个人的浏览啊，当然要靠正确输入地址)</p>

        <a href="/happy-help" style="text-decoration:none;">
            <img src="${pageContext.request.contextPath}/static/errorPage/404.png" alt="螳臂挡车续命" title="螳臂挡车" style="display:block;margin-left:auto;margin-right:auto;"></a>

        <h2 style="text-align:center;font-family:SimHei;">
            我作为一个来访问页面的管理者，怎么把我跳到 ${errorCode} 页面去了呢？
        </h2>
        <h3 style="text-align:center;"></h3>
        <div style="margin: 0 auto;width:50%;">
            <p>
            </p><ol style="font-family:YouYuan;">
            <br/>
            <br/>
            <br/>
        </ol>
            <p></p>
        </div>

        <script type="text/javascript">/* <![CDATA[ */(function(d,s,a,i,j,r,l,m,t){try{l=d.getElementsByTagName('a');t=d.createElement('textarea');for(i=0;l.length-i;i++){try{a=l[i].href;s=a.indexOf('/cdn-cgi/l/email-protection');m=a.length;if(a&&s>-1&&m>28){j=28+s;s='';if(j<m){r='0x'+a.substr(j,2)|0;for(j+=2;j<m&&a.charAt(j)!='X';j+=2)s+='%'+('0'+('0x'+a.substr(j,2)^r).toString(16)).slice(-2);j++;s=decodeURIComponent(s)+a.substr(j,m-j)}t.innerHTML=s.replace(/</g,'&lt;').replace(/>/g,'&gt;');l[i].href='mailto:'+t.value}}catch(e){}}}catch(e){}})(document);/* ]]> */</script>

      </div>
    </body>
</html>
