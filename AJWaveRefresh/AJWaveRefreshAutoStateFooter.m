//
//  AJWaveRefreshAutoStateFooter.m
//  AJWaveRefresh
//
//  Created by AlienJunX on 15/10/16.
//  Copyright (c) 2015 AlienJunX
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "AJWaveRefreshAutoStateFooter.h"
#import "AJWaveRefreshAnimation.h"

@interface AJWaveRefreshAutoStateFooter()
@property (weak, nonatomic) AJWaveRefreshAnimation *logoView;
@end

@implementation AJWaveRefreshAutoStateFooter

- (AJWaveRefreshAnimation *)logoView {
    if (!_logoView) {
        AJWaveRefreshAnimation *logoView = [[AJWaveRefreshAnimation alloc] initWithFrame:CGRectMake(100, 100, 75, 20)
                                                                       grayImage:[UIImage imageNamed:@"grayLogo"]
                                                                        redImage:[UIImage imageNamed:@"lightGrayLogo"]];
        [self addSubview:_logoView = logoView];
    }
    return _logoView;
}

#pragma makr - 重写父类的方法
- (void)prepare {
    [super prepare];
    
    self.mj_h = 60;
}

- (void)placeSubviews {
    [super placeSubviews];
    
    CGFloat centerY = self.mj_h * 0.5;
    self.stateLabel.frame = CGRectMake(0, 0, self.frame.size.width, 30);
    self.stateLabel.center = CGPointMake(self.mj_w * 0.5, centerY + 15);
    self.logoView.center = CGPointMake(self.mj_w * 0.5, centerY - 8);
}

- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self.logoView stopAnimating];
        [self setFooterHidden:YES];
    } else if (state == MJRefreshStateRefreshing) {
        [self.logoView startAnimating];
        [self setFooterHidden:NO];
    }
}

- (void)setFooterHidden:(BOOL)hidden {
    self.logoView.hidden = hidden;
    self.stateLabel.hidden = hidden;
}

@end
