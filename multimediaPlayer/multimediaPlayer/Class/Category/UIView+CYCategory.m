//
//  UIView+CYCategory.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/26.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "UIView+CYCategory.h"

@implementation UIView (CYCategory)

- (void)setupCornerWithRadius:(CGFloat)radius {
    self.layer.cornerRadius  = radius;
    self.layer.masksToBounds = YES;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
    CGPoint oldOrigin = self.frame.origin;
    self.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = self.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    self.center = CGPointMake (self.center.x - transition.x, self.center.y - transition.y);
}


@end
