//
//  UIScrollView+AJWaveRefresh.m
//  AJWaveRefresh
//
//  Created by AlienJunX on 15/10/16.
//  Copyright (c) 2015 AlienJunX
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
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
