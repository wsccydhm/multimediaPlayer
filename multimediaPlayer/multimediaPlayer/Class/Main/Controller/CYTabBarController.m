
//
//  CYTabBarController.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/26.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYTabBarController.h"
#import "CYAudioNavigationController.h"
#import "CYVideoNavigationController.h"
@interface CYTabBarController ()

@end

@implementation CYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareUI];
}


#pragma mark - Private methods by ccy

- (void)prepareUI {
    CYAudioNavigationController *firstVC  = self.viewControllers.firstObject;
    CYVideoNavigationController *secondVC = self.viewControllers.lastObject;
    UIImage *firstImage                   = [[UIImage imageWithCGImage:[UIImage imageNamed:@"audio"].CGImage scale:8 orientation:0] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstVC.tabBarItem.image              = firstImage;
    UIImage *secondImage                  = [[UIImage imageWithCGImage:[UIImage imageNamed:@"video"].CGImage scale:8 orientation:0] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secondVC.tabBarItem.image             = secondImage;
}


@end
