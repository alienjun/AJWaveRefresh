//
//  AJWaveRefreshAnimation.h
//  AJWaveRefresh
//
//  Created by AlienJunX on 15/10/16.
//  Copyright (c) 2015 AlienJunX
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface AJWaveRefreshAnimation : UIView
@property (nonatomic) CGFloat frequency;//波浪频率
@property (strong, nonatomic) UIImage *grayLogoImage;
@property (strong, nonatomic) UIImage *redLogoImage;


/**
 *  初始化
 *
 *  @param frame
 *  @param grayImage 底部灰色图片
 *  @param redImage 需要显示出来的图片
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame
                    grayImage:(UIImage *)grayImage
                     redImage:(UIImage *)redImage;

- (void)startAnimating;

- (void)stopAnimating;
@end
