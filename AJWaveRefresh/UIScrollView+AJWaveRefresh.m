//
//  UIScrollView+BBWRefresh.m
//  boboconsumer
//
//  Created by AlienJunX on 15/12/29.
//  Copyright © 2015年 Shanghai Metis IT Co.,Ltd. All rights reserved.
//

#import "UIScrollView+AJWaveRefresh.h"
#import "AJWaveRefreshAutoStateFooter.h"
#import "AJWaveRefreshHeader.h"

@implementation UIScrollView (AJWaveRefresh)

- (void)setupRefresh:(id<AJWaveRefreshProtocol>)target {
    [self setupRefreshHeader:target];
    [self setupRefreshFooter:target];
}

- (void)setupRefreshHeader:(id<AJWaveRefreshProtocol>)target {
    self.header = [AJWaveRefreshHeader headerWithRefreshingTarget:target refreshingAction:@selector(headerRereshing)];
}

- (void)setupRefreshFooter:(id<AJWaveRefreshProtocol>)target {
    self.footer = [AJWaveRefreshAutoStateFooter footerWithRefreshingTarget:target refreshingAction:@selector(footerRereshing)];
}

- (void)startHeaderRefreshing {
    [self.header beginRefreshing];
}

- (void)endRefreshing {
    if ([self.header isRefreshing]) {
        [self.header endRefreshing];
    }
    
    if ([self.footer isRefreshing]) {
        [self.footer endRefreshing];
    }
}

@end
