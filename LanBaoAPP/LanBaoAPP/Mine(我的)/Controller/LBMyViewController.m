//
//  LBMyViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBMyViewController.h"
#import "LBMineHeadTableViewCell.h"
#import "LBMineTableViewCell.h"
#import "LBMyDataViewController.h"
#import "LBFeedbackViewController.h"
#import "LBQuestionViewController.h"
#import "LBMessageCenterVC.h"
#import "LBSysSettingVC.h"
#import "LBMineHeaderView.h"
#import "LBMyHeaderViewController.h"

@interface LBMyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSArray * arrTitles;


@end

@implementation LBMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    self.view.backgroundColor = kAPPBaseColor;
    self.arrTitles = @[@"主箱与盒子",@"常见问题",@"意见反馈",@"消息中心",@"系统设置"];
    [self setUI];
}

-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = kAPPBaseColor;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LBMineTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBMineTableViewCell"];
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    
    LBMineHeaderView * headView =[[NSBundle mainBundle]loadNibNamed:@"LBMineHeaderView" owner:nil options:nil].firstObject;
    headView.frame = CGRectMake(0, 0, kScreenWidth, 200);
    headView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headView;
    WeakSelf();
    [headView setHeaderViewClickBlock:^(UIImage *image) {
        LBMyHeaderViewController * vc = [[LBMyHeaderViewController alloc] init];
        vc.headImage = image;
        [weakself.navigationController pushViewController:vc animated:YES];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.arrTitles.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LBMineTableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"LBMineTableViewCell" forIndexPath:indexPath];
    cell2.labelTitle.text = self.arrTitles[indexPath.row];
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell2;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
       
    }else if (indexPath.row == 1) {
        LBQuestionViewController * VC = [[LBQuestionViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row ==2){
        LBFeedbackViewController * VC = [[LBFeedbackViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 3){
        LBMessageCenterVC * VC = [[LBMessageCenterVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 4){
        LBSysSettingVC * VC = [[LBSysSettingVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
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
