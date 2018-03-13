//
//  LBSongDetailHeadView.h
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/13.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBSongDetailHeadView : UIView
- (IBAction)repeatClick:(UIButton *)sender;
- (IBAction)addSongsClick:(UIButton *)sender;
- (IBAction)deleteSongClick:(UIButton *)sender;

@property (nonatomic,copy) void(^repeatBlock)(void);
@property (nonatomic,copy) void(^addSongsBlock)(void);
@property (nonatomic,copy) void(^deleteSongsBlock)(void);
-(void)setRepeatBlock:(void (^)(void))repeatBlock;
-(void)setDeleteSongsBlock:(void (^)(void))deleteSongsBlock;
-(void)setAddSongsBlock:(void (^)(void))addSongsBlock;
@end
