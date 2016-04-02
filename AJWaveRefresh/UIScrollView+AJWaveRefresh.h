//
//  UIScrollView+AJWaveRefresh.h
//  AJWaveRefresh
//
//  Created by AlienJunX on 15/10/16.
//  Copyright (c) 2015 AlienJunX
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
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
