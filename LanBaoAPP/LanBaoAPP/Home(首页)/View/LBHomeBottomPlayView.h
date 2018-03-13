//
//  LBHomeBottomPlayView.h
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/8.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBHomeBottomPlayView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnHeadImage;
@property (weak, nonatomic) IBOutlet UILabel *labelSongName;
@property (weak, nonatomic) IBOutlet UILabel *labelSinger;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UIView *viewProgressBar;

- (IBAction)lookUpSongInfoClick:(UIButton *)sender;
- (IBAction)headImageBtnClick:(UIButton *)sender;
- (IBAction)menuBtnClick:(UIButton *)sender;
- (IBAction)playbtnClick:(UIButton *)sender;


@property (nonatomic ,copy) void(^HeadImageLookUpBlock)(UIImage * image);
@property (nonatomic ,copy) void(^songInfoLookUpBlock)(void);
@property (nonatomic ,copy) void(^playOrPauseBlock)(BOOL isPlay);
@property (nonatomic ,copy) void(^songMenuLookUpBlock)(void);
-(void)setHeadImageLookUpBlock:(void (^)(UIImage * image))HeadImageLookUpBlock;
-(void)setSongInfoLookUpBlock:(void (^)(void))songInfoLookUpBlock;
-(void)setPlayOrPauseBlock:(void (^)(BOOL isPlay))playOrPauseBlock;
-(void)setSongMenuLookUpBlock:(void (^)(void))songMenuLookUpBlock;

@end
