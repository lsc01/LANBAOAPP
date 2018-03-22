//
//  LBSelectWLANView.h
//  LanBaoAPP
//
//  Created by lsc on 2018/3/20.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LBSelectWLANViewDelegate<NSObject>

-(void)gotoNextViewWithSelectWLANView;

@end
@interface LBSelectWLANView : UIView

@property (weak, nonatomic) IBOutlet UIButton *btnNext;


- (IBAction)nextBtnClick:(UIButton *)sender;

@property (nonatomic ,weak) id<LBSelectWLANViewDelegate> delegate;
@end
