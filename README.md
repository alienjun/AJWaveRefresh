
介绍
==============
下拉刷新过渡动画，下拉的处理依赖[MJRefresh](https://github.com/CoderMJLee/MJRefresh)。<br/><br/><br/>
![Aaron Swartz](https://github.com/alienjun/AJWaveRefresh/blob/master/Sceenshots/screenshot1.gif)
![Aaron Swartz](https://github.com/alienjun/AJWaveRefresh/blob/master/Sceenshots/screenshot2.gif)


描述
==============
下拉刷新过渡动画，实现方式基于BezierPath画正弦曲线，绘制到layer上，并将这个layer设置给ImageView的mask上，这样默认情况下这个Image就是
透明的，为了画出产品需要的波浪对函数的参数尝试了很久。


特性
==============
- 基于MJRefresh。
- 支持所有基于UIScorllView实现的控件。



用法
==============
###集成刷新控件
	//#import   UIScrollView+AJWaveRefresh.h

	=======UITableView======
    //同时支持Header和Footer刷新
    [self.tableView setupRefresh:self];
    
    //如果只需要Header刷新
    [self.tableView setupRefreshHeader:self];
    
    //如果只需要Footer
    [self.tableView setupRefreshFooter:self];
    
    =======UICollectionView======
    //同时支持Header和Footer刷新
    [self.collectionView setupRefresh:self];
    
    //如果只需要Header刷新
    [self.collectionView setupRefreshHeader:self];
    
    //如果只需要Footer
    [self.collectionView setupRefreshFooter:self];


###实现委托
	//头部刷新
	- (void)headerRereshing;
	
	//底部刷新
	- (void)footerRereshing;

###结束刷新
	//tableView刷新
	[self.tableView endRefreshing];
	
	//collectionView刷新
	[self.collectionView endRefreshing];


安装
==============
### 手动安装

1. 下载 AJWaveRefresh 文件夹内的所有内容。
2. 将 AJWaveRefresh 内的源文件添加(拖放)到你的工程(如果你的工程中有MJRefresh，可以将AJWaveRefresh下的Vendor/MJRefresh删除)。
3. 导入 `UIScrollView+AJWaveRefresh.h`。



系统要求
==============
该项目最低支持 `iOS 7.0` 和 `Xcode 7.0`。


许可证
==============
AJWaveRefresh 使用 MIT 许可证，详情见 LICENSE 文件。



