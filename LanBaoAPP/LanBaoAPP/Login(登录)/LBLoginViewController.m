//
//  LBLoginViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/2/28.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBLoginViewController.h"
#import "LBForgetPassWordVC.h"

@interface LBLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassWord;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@property (weak, nonatomic) IBOutlet UIButton *btnForget;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@end

@implementation LBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
}

-(void)setUI{
    self.btnLogin.layer.borderWidth =1;
    self.btnLogin.layer.borderColor = [UIColor grayColor].CGColor;
    self.btnLogin.clipsToBounds = YES;
    self.btnLogin.layer.cornerRadius = 10;
}

- (IBAction)loginClick:(UIButton *)sender {
    
}
- (IBAction)forgetPwdClick:(UIButton *)sender {
    LBForgetPassWordVC * forgetVC = [[LBForgetPassWordVC alloc] init];
    [self presentViewController:forgetVC animated:YES completion:^{
        
    }];
}
- (IBAction)closeViewClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
