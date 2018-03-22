//
//  LBConnectBoxView1.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/20.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBConnectBoxView1.h"

@implementation LBConnectBoxView1

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(gotoNextViewWithConnectBoxView:)]) {
        [self.delegate gotoNextViewWithConnectBoxView:self];
    }
}

@end
