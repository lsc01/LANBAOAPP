//
//  LBHomeCenterHeaderView.h
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/8.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBHomeCenterHeaderView : UITableViewHeaderFooterView
- (IBAction)addNewList:(UIButton *)sender;
@property (nonatomic,copy) void(^addNewListBlock)(void);

@end
