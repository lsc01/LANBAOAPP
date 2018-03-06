//
//  LBQuestionHeaderView.h
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/6.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBQuestionHeaderView : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnShow;
- (IBAction)showOrHideContentClick:(UIButton *)sender;

@property (nonatomic  ,copy) void(^showContentBlock)(BOOL state);
-(void)setShowContentBlock:(void (^)(BOOL state))showContentBlock;

@end
