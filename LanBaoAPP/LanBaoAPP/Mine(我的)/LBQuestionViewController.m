//
//  LBQuestionViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBQuestionViewController.h"
#import "LBSysSettingTableViewCell.h"
#import "LBUserHelpViewController.h"

@interface LBQuestionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSArray * arrTitles;

@end

@implementation LBQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"常见问题";
    self.view.backgroundColor = [UIColor whiteColor];
    self.arrTitles = @[@"如何清除缓存?",@"如何连接蓝牙音响?",@"如何添加本地音乐"];
    [self setUI];
}

-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LBSysSettingTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBSysSettingTableViewCell"];
    
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrTitles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LBSysSettingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LBSysSettingTableViewCell" forIndexPath:indexPath];
    cell.labelTitle.text = self.arrTitles[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LBUserHelpViewController * vc = [[LBUserHelpViewController alloc] init];
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
