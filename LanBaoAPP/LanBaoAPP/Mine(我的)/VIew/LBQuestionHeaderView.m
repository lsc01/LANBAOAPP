//
//  LBQuestionHeaderView.m
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/6.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBQuestionHeaderView.h"

@implementation LBQuestionHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)showOrHideContentClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    _showContentBlock?_showContentBlock(sender.selected):nil;
}
@end
