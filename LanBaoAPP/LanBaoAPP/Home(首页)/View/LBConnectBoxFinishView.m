//
//  LBConnectBoxFinishView.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/20.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBConnectBoxFinishView.h"

@implementation LBConnectBoxFinishView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)blueToothClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(gotoNextViewWithConnectBoxFinishView)]) {
        [self.delegate gotoNextViewWithConnectBoxFinishView];
    }
}

- (IBAction)DLNAClick:(UIButton *)sender {

}

- (IBAction)LZCONNECTCLick:(UIButton *)sender {
    
    
}
- (IBAction)tongzhouClick:(UIButton *)sender {
    
}

- (IBAction)moniClick:(UIButton *)sender {
    
}

- (IBAction)guangxianClick:(UIButton *)sender {
    
}
@end
