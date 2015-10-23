//
//  BoRefreshAnimation.h
//  bobohair-iphone
//
//  Created by AlienJunX on 15/10/16.
//  Copyright © 2015年 Shanghai Metis IT Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoRefreshAnimation : UIView
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
-(instancetype)initWithFrame:(CGRect)frame grayImage:(UIImage *)grayImage redImage:(UIImage *)redImage;

-(void)startAnimating;

-(void)stopAnimating;
@end
