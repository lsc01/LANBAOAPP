//
//  LBHomeBottomPlayView.m
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/8.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBHomeBottomPlayView.h"

@implementation LBHomeBottomPlayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)lookUpSongInfoClick:(UIButton *)sender {
    _songInfoLookUpBlock?_songInfoLookUpBlock():nil;
}

- (IBAction)headImageBtnClick:(UIButton *)sender {
    _HeadImageLookUpBlock?_HeadImageLookUpBlock(sender.currentBackgroundImage):nil;
}

- (IBAction)menuBtnClick:(UIButton *)sender {
    _songMenuLookUpBlock?_songMenuLookUpBlock():nil;
}

- (IBAction)playbtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    _playOrPauseBlock?_playOrPauseBlock(sender.selected):nil;
}
@end
