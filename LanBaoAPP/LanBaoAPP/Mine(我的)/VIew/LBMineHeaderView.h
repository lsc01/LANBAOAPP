//
//  LBMineHeaderView.h
//  LanBaoAPP
//
//  Created by lsc on 2018/3/9.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBMineHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnHeaderView;

@property (weak, nonatomic) IBOutlet UILabel *labelName;

- (IBAction)headerBtnClick:(UIButton *)sender;

@property (nonatomic ,copy) void(^HeaderViewClickBlock)(UIImage * iamge);
-(void)setHeaderViewClickBlock:(void (^)(UIImage * image))HeaderViewClickBlock;

@end
