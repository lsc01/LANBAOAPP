//
//  LBAddNewKindListView.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/15.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBAddNewKindListView.h"

@implementation LBAddNewKindListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)addNewList:(UIButton *)sender {
    _addNewListBlock?_addNewListBlock():nil;
}
@end
