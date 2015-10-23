# WaveRefresh
下拉刷新过渡动画，实现方式基于BezierPath画正弦曲线，绘制到layer上，并将这个layer设置给ImageView的mask上，这样默认情况下这个Image就是
透明的，为了画出产品需要的波浪对函数的参数尝试了很久。

![Aaron Swartz](https://github.com/alienjun/WaveRefresh/blob/master/Sceenshots/screenshot1.gif)

##知识点：

1.UIBezierPath.

2.CAShapeLayer绘图及CALayer 相关的绘图知识.

3.Sin相关函数知识.

4.CAAnimation.

####Android 实现：<https://github.com/alienjun/WaveRefreshForAndroid>

欢迎一起交流技术学习。

微博：[AlienJunX](http://weibo.com/alienjunx)

特别感谢：

<https://github.com/kevinzhow/Waver>  及Kevin 的相关博文
<https://github.com/CoderMJLee/MJRefresh>
