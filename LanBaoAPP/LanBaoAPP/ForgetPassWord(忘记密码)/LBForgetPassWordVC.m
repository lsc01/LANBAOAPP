//
//  LBForgetPassWordVC.m
//  LanBaoAPP
//
//  Created by lsc on 2018/2/28.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBForgetPassWordVC.h"
#import "LBForgetTwoPassWordVC.h"

@interface LBForgetPassWordVC ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;

@property (weak, nonatomic) IBOutlet UITextField *textFeildSecCode;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnSecurityCode;

@end

@implementation LBForgetPassWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = kAPPBaseColor;
    [self setUI];
}

-(void)setUI{
    
    
    [self.btnSecurityCode setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btnSecurityCode.clipsToBounds = YES;
    self.btnSecurityCode.layer.cornerRadius = 15;
    
    self.btnNext.clipsToBounds = YES;
    self.btnNext.layer.cornerRadius = 20;
    [self.btnNext setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}
- (IBAction)getSecurityCodeClick:(UIButton *)sender {
}
- (IBAction)nextClick:(UIButton *)sender {
    LBForgetTwoPassWordVC * vc = [[LBForgetTwoPassWordVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
