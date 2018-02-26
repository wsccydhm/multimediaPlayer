//
//  UIImage+CYComond.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/26.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "UIImage+CYComond.h"
#import <GPUImage.h>
@implementation UIImage (CYComond)
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaleImage;
}

+ (UIImage *)blurrWithImage:(UIImage *)image andLevel:(CGFloat)level {
    GPUImageGaussianBlurFilter *gaussianBlurfiltr = [[GPUImageGaussianBlurFilter alloc] init];
    gaussianBlurfiltr.blurRadiusInPixels          = level;
    return [gaussianBlurfiltr imageByFilteringImage:image];
}

@end
