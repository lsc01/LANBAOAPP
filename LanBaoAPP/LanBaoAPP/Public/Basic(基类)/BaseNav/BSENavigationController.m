//
//  BSENaVViewController.m
//  BSEM
//
//  Created by 逸信Mac on 16/3/2.
//  Copyright © 2016年 逸信Mac. All rights reserved.
//

#import "BSENavigationController.h"
#import "UINavigationBar+Awesome.h"
#import "Macros.h"
@interface BSENavigationController ()<UINavigationControllerDelegate>

@end

@implementation BSENavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavitems];
    [self setupNavigationBarTheme];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 设置navbar的字体和背景
- (void)setupNavigationBarTheme {
    //设置全局navBar字体颜色与背景颜色
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置字体颜色
    NSDictionary *attrNavBar = @{NSFontAttributeName : [UIFont systemFontOfSize:18.0f], NSForegroundColorAttributeName : HEXCOLOR(0xFFFFFF)};
    [navBar setTitleTextAttributes:attrNavBar];
    //设置背景颜色 首页导航透明
//    [navBar lt_setBackgroundColor:[UIColor whiteColor]];
    //设置背景颜色一般的方法
    [navBar setBarTintColor:[UIColor colorWithRed:147/255.00 green:172/255.00 blue:185/255.00 alpha:1]];
    if ([UIDevice currentDevice].systemVersion.integerValue >= 8.0) {
        [navBar setTranslucent:NO];
    }
    // 设置导航条返回按钮的箭头颜色
    navBar.tintColor = [UIColor whiteColor];
}

-(void)setUpNavitems{
    UIImage *backButtonImage = [[UIImage imageNamed:@"nav_icon_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationBar.backIndicatorImage = backButtonImage;
    self.navigationBar.backIndicatorTransitionMaskImage = backButtonImage;
    
}

#pragma mark - 全局返回键以及抽屉事件设置
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    UIViewController *vc = self.visibleViewController;
//    if([vc isKindOfClass:[TGLivePlayController class]]){
//        return [vc supportedInterfaceOrientations];
//    }else{
//        return UIInterfaceOrientationMaskPortrait;
//    }
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate{
//    UIViewController *vc = self.visibleViewController;
//    if([vc isKindOfClass:[TGLivePlayController class]]){
//        return [vc supportedInterfaceOrientations];
//    }else{
//        return NO;
//    }
    return NO;
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
