//
//  LBConnectBoxView1.h
//  LanBaoAPP
//
//  Created by lsc on 2018/3/20.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBConnectBoxView1;
@protocol LBConnectBoxViewDelegate<NSObject>

-(void)gotoNextViewWithConnectBoxView:(LBConnectBoxView1 *)view;

@end

@interface LBConnectBoxView1 : UIView
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewWifi;
@property (weak, nonatomic) IBOutlet UILabel *labelDesc;

@property (nonatomic ,weak) id<LBConnectBoxViewDelegate> delegate;

@end
