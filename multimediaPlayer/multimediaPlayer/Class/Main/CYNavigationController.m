//
//  CYNavigationController.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/26.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYNavigationController.h"

@interface CYNavigationController ()

@end

@implementation CYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareUI];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tabBarItem.imageInsets                     = UIEdgeInsetsMake(-5, 0, 0, 0);
    self.tabBarItem.titlePositionAdjustment         = UIOffsetMake(0, -1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods by ccy

- (void)prepareUI {
    NSMutableDictionary *normalAttribute            = [NSMutableDictionary dictionary];
    normalAttribute[NSFontAttributeName]            = [UIFont systemFontOfSize:12];
    normalAttribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    [UITabBarItem.appearance setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    NSMutableDictionary *selectAttribute            = [NSMutableDictionary dictionary];
    selectAttribute[NSForegroundColorAttributeName] = [UIColor redColor];
    [UITabBarItem.appearance setTitleTextAttributes:selectAttribute forState:UIControlStateSelected];

}

@end
