//
//  LBSelectWLANView.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/20.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBSelectWLANView.h"

@implementation LBSelectWLANView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)nextBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(gotoNextViewWithSelectWLANView)]) {
        [self.delegate gotoNextViewWithSelectWLANView];
    }
}
@end
