//
//  UIScrollView+BBWRefresh.h
//  boboconsumer
//
//  Created by AlienJunX on 15/12/29.
//  Copyright © 2015年 Shanghai Metis IT Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AJWaveRefreshProtocol<NSObject>

@optional
- (void)headerRereshing;
- (void)footerRereshing;

@end

@interface UIScrollView (AJWaveRefresh)

- (void)setupRefresh:(id<AJWaveRefreshProtocol>)target;

- (void)setupRefreshHeader:(id<AJWaveRefreshProtocol>)target;

- (void)setupRefreshFooter:(id<AJWaveRefreshProtocol>)target;

- (void)startHeaderRefreshing;

- (void)endRefreshing;

@end
