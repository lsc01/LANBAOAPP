//
//  LBConnectBoxFinishView.h
//  LanBaoAPP
//
//  Created by lsc on 2018/3/20.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LBConnectBoxFinishViewDelegate<NSObject>

-(void)gotoNextViewWithConnectBoxFinishView;

@end
@interface LBConnectBoxFinishView : UIView
@property (nonatomic ,weak) id<LBConnectBoxFinishViewDelegate> delegate;

- (IBAction)blueToothClick:(UIButton *)sender;

- (IBAction)DLNAClick:(UIButton *)sender;

- (IBAction)LZCONNECTCLick:(UIButton *)sender;



- (IBAction)tongzhouClick:(UIButton *)sender;

- (IBAction)moniClick:(UIButton *)sender;

- (IBAction)guangxianClick:(UIButton *)sender;

@end
