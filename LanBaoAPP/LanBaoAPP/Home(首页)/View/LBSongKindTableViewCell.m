//
//  LBSongKindTableViewCell.m
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/12.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBSongKindTableViewCell.h"
@interface LBSongKindTableViewCell()

@property (nonatomic ,copy) void(^MoreInfoBlock)(BOOL isShowInfo);
@property (nonatomic ,copy) void(^LikeBlock)(BOOL islikely);
@property (nonatomic ,copy) void(^DeleteBlock)(void);
@property (nonatomic ,copy) void(^LongPressGest)(void);

@end


@implementation LBSongKindTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageViewHead.userInteractionEnabled = YES;
    //初始化一个长按手势
    UILongPressGestureRecognizer *longPressGest = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressView:)];
    //长按等待时间
    longPressGest.minimumPressDuration = 2;
    //长按时候,手指头可以移动的距离
//    longPressGest.allowableMovement = 0;
    [self.imageViewHead addGestureRecognizer:longPressGest];
}

-(void)longPressView:(UILongPressGestureRecognizer *)longPressGest{
    NSLog(@"%ld",longPressGest.state);
    if (longPressGest.state==UIGestureRecognizerStateBegan) {
        NSLog(@"长按手势开启");
        _LongPressGest?_LongPressGest():nil;
    } else {
        NSLog(@"长按手势结束");
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)moreInfoClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.viewBGFirst.hidden = sender.selected;
    self.viewBgSecond.hidden = !sender.selected;
    _MoreInfoBlock?_MoreInfoBlock(sender.selected):nil;
}

- (IBAction)likeBtnClick:(UIButton *)sender {
    sender.selected = ! sender.selected;
    _LikeBlock?_LikeBlock(sender.selected):nil;
}

- (IBAction)deleteBtnClick:(UIButton *)sender {
    _DeleteBlock?_DeleteBlock():nil;
}

-(void)buttonActionCallBackMoreInfo:(void(^)(BOOL isShowInfo))complete callBackLike:(void(^)(BOOL islikely))complete2 callBackDelete:(void(^)(void))complete3 longPressGest:(void(^)(void))longPressGest{
    _MoreInfoBlock = complete;
    _LikeBlock = complete2;
    _DeleteBlock = complete3;
    _LongPressGest = longPressGest;
}
@end
