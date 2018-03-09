//
//  LBMineHeaderView.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/9.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBMineHeaderView.h"

@implementation LBMineHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    [super awakeFromNib];
    self.btnHeaderView.layer.cornerRadius = 40;
    self.btnHeaderView.clipsToBounds = YES;
}

- (IBAction)headerBtnClick:(UIButton *)sender {
    _HeaderViewClickBlock?_HeaderViewClickBlock(self.btnHeaderView.currentBackgroundImage):nil;
}
@end
