//
//  BoRefreshAnimation.m
//  bobohair-iphone
//
//  Created by AlienJunX on 15/10/16.
//  Copyright © 2015年 Shanghai Metis IT Co.,Ltd. All rights reserved.
//

#import "BoRefreshAnimation.h"

@interface BoRefreshAnimation()
@property (nonatomic) CGFloat waveWidth;
@property (nonatomic) CGFloat waveHeight;
@property (nonatomic) CGFloat density;
@property (nonatomic) CGFloat waveMid;
@property (nonatomic) CGFloat maxAmplitude;

@property (nonatomic) CGFloat phaseShift;
@property (nonatomic) CGFloat phase;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (strong, nonatomic) CAShapeLayer *waveLayer;

@property (weak, nonatomic) UIImageView *grayLogo;
@property (weak, nonatomic) UIImageView *redLogo;
@end

@implementation BoRefreshAnimation

-(instancetype)initWithFrame:(CGRect)frame grayImage:(UIImage *)grayImage redImage:(UIImage *)redImage{
    _redLogoImage = redImage;
    _grayLogoImage = grayImage;
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    CALayer *mask = [CALayer layer];
    mask.frame = self.bounds;
    self.waveLayer = [CAShapeLayer layer];
    self.waveLayer.fillColor = [[UIColor greenColor] CGColor];
    self.waveLayer.frame = CGRectMake(0, self.bounds.size.height-5, self.bounds.size.width, self.bounds.size.height);
    
    self.waveHeight = CGRectGetHeight(self.bounds)*0.5;
    self.waveWidth  = CGRectGetWidth(self.bounds);
    self.density = 1.f;
    self.frequency = 1.5f;
    self.phaseShift = -0.25f;
    
    //图片
    UIImageView *grayLogo = [[UIImageView alloc] initWithFrame:self.bounds];
    UIImageView *redLogo = [[UIImageView alloc] initWithFrame:self.bounds];
    grayLogo.image = self.grayLogoImage;
    redLogo.image = self.redLogoImage;
    [self addSubview:grayLogo];
    [self addSubview:redLogo];
    
    self.grayLogo = grayLogo;
    self.redLogo = redLogo;
    
    //mask
    [mask addSublayer:self.waveLayer];
    self.redLogo.layer.mask = mask;
}

-(void)startAnimating{
    
    [self.displayLink invalidate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    CGPoint position = self.waveLayer.position;
    position.y = position.y - self.bounds.size.height-5;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:self.waveLayer.position];
    animation.toValue = [NSValue valueWithCGPoint:position];
    animation.duration = 3.0;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    [self.waveLayer addAnimation:animation forKey:nil];
}

-(void)stopAnimating{
    [self.displayLink invalidate];
    [self.waveLayer removeAllAnimations];
    self.waveLayer.path = nil;
}

//波浪绘制
-(void)update{
    self.phase += self.phaseShift;
    self.waveMid = self.waveWidth / 2.0f;
    self.maxAmplitude = self.waveHeight - 4.0f;
    
    UIGraphicsBeginImageContext(self.frame.size);
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0;
    for(CGFloat x = 0; x<self.waveWidth + self.density; x += self.density) {
        endX=x;
        CGFloat scaling = -pow(x / self.waveMid  - 1, 2) + 1;//波浪中间变大
        CGFloat y = scaling * self.maxAmplitude  * sinf(2 * M_PI *(x / 50) * self.frequency + self.phase) + (self.waveHeight * 0.5);
        if (x==0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        }else {
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }
    }
    CGFloat endY = CGRectGetHeight(self.bounds)+15;
    [wavePath addLineToPoint:CGPointMake(endX, endY)];
    [wavePath addLineToPoint:CGPointMake(0, endY)];
    [wavePath addLineToPoint:CGPointMake(0, 5)];
    
    self.waveLayer.path = [wavePath CGPath];
    UIGraphicsEndImageContext();
}


#pragma mark - getter/setter
-(void)setGrayLogoImage:(UIImage *)grayLogoImage{
    _grayLogoImage = grayLogoImage;
    self.grayLogo.image = grayLogoImage;
}
-(void)setRedLogoImage:(UIImage *)redLogoImage{
    _redLogoImage = redLogoImage;
    self.redLogo.image = redLogoImage;
}

@end
