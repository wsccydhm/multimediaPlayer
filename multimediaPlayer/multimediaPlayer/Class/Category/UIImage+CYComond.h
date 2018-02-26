//
//  UIImage+CYComond.h
//  multimediaPlayer
//
//  Created by ccy on 2018/2/26.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CYComond)
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size;
+ (UIImage *)blurrWithImage:(UIImage *)image andLevel:(CGFloat)level;
@end
