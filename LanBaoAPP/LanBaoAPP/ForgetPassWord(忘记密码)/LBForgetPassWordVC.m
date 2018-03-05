//
//  LBForgetPassWordVC.m
//  LanBaoAPP
//
//  Created by lsc on 2018/2/28.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBForgetPassWordVC.h"

@interface LBForgetPassWordVC ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;

@property (weak, nonatomic) IBOutlet UITextField *textFeildSecCode;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnSecurityCode;

@end

@implementation LBForgetPassWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"找回密码";
    [self setUI];
}

-(void)setUI{
    
    
    [self.btnSecurityCode setBackgroundColor:kAPPBaseColor forState:UIControlStateNormal];
    self.btnSecurityCode.clipsToBounds = YES;
    self.btnSecurityCode.layer.cornerRadius = 3;
    
    self.btnLogin.clipsToBounds = YES;
    self.btnLogin.layer.cornerRadius = 10;
    [self.btnLogin setBackgroundColor:kAPPBaseColor forState:UIControlStateNormal];
    
}
- (IBAction)getSecurityCodeClick:(UIButton *)sender {
}
- (IBAction)loginClick:(UIButton *)sender {
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
