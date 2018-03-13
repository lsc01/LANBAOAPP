//
//  LBSongDetailHeadView.m
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/13.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBSongDetailHeadView.h"

@implementation LBSongDetailHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)repeatClick:(UIButton *)sender {
    _repeatBlock?_repeatBlock():nil;
}

- (IBAction)addSongsClick:(UIButton *)sender {
    _addSongsBlock?_addSongsBlock():nil;
}

- (IBAction)deleteSongClick:(UIButton *)sender {
    _deleteSongsBlock?_deleteSongsBlock():nil;
}
@end
