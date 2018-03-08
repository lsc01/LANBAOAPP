//
//  LBForgetTwoPassWordVC.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/9.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBForgetTwoPassWordVC.h"

@interface LBForgetTwoPassWordVC ()
@property (weak, nonatomic) IBOutlet UITextField *textFeildPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFeildPassword2;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@end

@implementation LBForgetTwoPassWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
     self.view.backgroundColor = kAPPBaseColor;
    self.btnNext.clipsToBounds = YES;
    self.btnNext.layer.cornerRadius = 20;
    [self.btnNext setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (IBAction)NextClick:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
