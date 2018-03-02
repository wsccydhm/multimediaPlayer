//
//  CYLyricTableView.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/28.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYLyricView.h"
#import "CYLyricTableViewCell.h"
@interface CYLyricView()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CYLyricView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tableView.dataSource     = self;
    self.tableView.delegate       = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource by ccy
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CYLyricTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CYLyricTableViewCellID" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 32;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"结束移动%@",NSStringFromCGRect(self.tableView.frame));
}

@end
