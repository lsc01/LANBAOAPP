//
//  LBAddSongsUpView.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/13.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBAddSongsUpView.h"

@implementation LBAddSongsUpView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)selectAllClick:(UIButton *)sender {
    if (self.isAllowSelect) {
        sender.selected = !sender.selected;
        _allSelectedBlock?_allSelectedBlock(sender.selected):nil;
    }else{
        _completeBlock?_completeBlock():nil;
    }
    
}
- (IBAction)closeBtnClick:(UIButton *)sender {
    _closeViewBlock?_closeViewBlock():nil;
}
@end
