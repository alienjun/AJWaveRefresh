//
//  UIView+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-7.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (float)x{
    return self.frame.origin.x;
}

- (float)y{
    return self.frame.origin.y;
}

- (float)width{
    return self.frame.size.width;
}

- (float)height{
    return self.frame.size.height;
}

- (void)setX:(float)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(float)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(float)w{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

- (void)setHeight:(float)h{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}

- (void)fadeIn{
    [self fadeInOnComplet:nil];
}

- (void)fadeOut{
    [self fadeOutOnComplet:nil];
}

- (void)fadeInOnComplet:(void(^)(BOOL finished))complet{
    self.alpha = 0;
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 1;
    } completion:complet];
}

- (void)fadeOutOnComplet:(void(^)(BOOL finished))complet{
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 0;
    } completion:complet];
}

- (void)removeAllSubviews{
    for (UIView *temp in self.subviews) {
        [temp removeFromSuperview];
    }
}

- (void)removeSubviewWithTag:(int)tag{
    for (UIView *temp in self.subviews) {
        if (temp.tag==tag) {
            [temp removeFromSuperview];
        }
    }
}

- (void)removeSubviewExceptTag:(int)tag{
    for (UIView *temp in self.subviews) {
        if (temp.tag!=tag) {
            [temp removeFromSuperview];
        }
    }
}

@end
