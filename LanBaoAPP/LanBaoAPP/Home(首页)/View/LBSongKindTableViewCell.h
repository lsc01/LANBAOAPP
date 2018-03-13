//
//  LBSongKindTableViewCell.h
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/12.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LBSongKindTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewBGFirst;
@property (weak, nonatomic) IBOutlet UIView *viewBgSecond;
@property (weak, nonatomic) IBOutlet UIButton *btnMoreInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelTitleFirst;
@property (weak, nonatomic) IBOutlet UILabel *labelSingerFirst;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewHead;
@property (weak, nonatomic) IBOutlet UILabel *labelTitleSecond;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;



- (IBAction)moreInfoClick:(UIButton *)sender;
- (IBAction)likeBtnClick:(UIButton *)sender;
- (IBAction)deleteBtnClick:(UIButton *)sender;


-(void)buttonActionCallBackMoreInfo:(void(^)(BOOL isShowInfo))complete callBackLike:(void(^)(BOOL islikely))complete2 callBackDelete:(void(^)(void))complete3 longPressGest:(void(^)(void))longPressGest;

@end
