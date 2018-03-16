//
//  LBAddNewKindListView.h
//  LanBaoAPP
//
//  Created by lsc on 2018/3/15.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBAddNewKindListView : UIView
- (IBAction)addNewList:(UIButton *)sender;
@property (nonatomic,copy) void(^addNewListBlock)(void);
@end
