//
//  LBAddSongsUpView.h
//  LanBaoAPP
//
//  Created by lsc on 2018/3/13.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBAddSongsUpView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;

- (IBAction)selectAllClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
- (IBAction)closeBtnClick:(UIButton *)sender;

@property (nonatomic ,assign) BOOL isAllowSelect;//是否允许选中

@property (nonatomic ,copy) void(^allSelectedBlock)(BOOL isSelect);
@property (nonatomic ,copy) void(^closeViewBlock)(void);
@property (nonatomic ,copy) void(^completeBlock)(void);


@end
