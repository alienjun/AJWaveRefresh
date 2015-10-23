//
//  BoRefreshAutoStateFooter.m
//  bobohair-iphone
//
//  Created by AlienJunX on 15/10/16.
//  Copyright © 2015年 Shanghai Metis IT Co.,Ltd. All rights reserved.
//

#import "BoRefreshAutoStateFooter.h"
#import "BoRefreshAnimation.h"

@interface BoRefreshAutoStateFooter()
@property (weak, nonatomic) BoRefreshAnimation *logoView;
@end

@implementation BoRefreshAutoStateFooter

-(BoRefreshAnimation *)logoView{
    if (!_logoView) {
        BoRefreshAnimation *logoView = [[BoRefreshAnimation alloc] initWithFrame:CGRectMake(100, 100, 75, 20)
                                                                       grayImage:[UIImage imageNamed:@"grayLogo"]
                                                                        redImage:[UIImage imageNamed:@"lightGrayLogo"]];
        [self addSubview:_logoView = logoView];
    }
    return _logoView;
}

#pragma makr - 重写父类的方法
- (void)prepare{
    [super prepare];
    
    self.mj_h = 60;
}

- (void)placeSubviews{
    [super placeSubviews];
    
    CGFloat centerY = self.mj_h * 0.5;
    self.stateLabel.frame = CGRectMake(0, 0, self.width, 30);
    self.stateLabel.center = CGPointMake(self.mj_w * 0.5, centerY + 15);
    self.logoView.center = CGPointMake(self.mj_w * 0.5, centerY - 8);
}

- (void)setState:(MJRefreshState)state{
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


-(void)setFooterHidden:(BOOL)hidden{
    self.logoView.hidden = hidden;
    self.stateLabel.hidden = hidden;
}

@end
