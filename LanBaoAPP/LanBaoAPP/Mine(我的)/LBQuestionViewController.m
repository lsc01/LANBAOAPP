//
//  LBQuestionViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBQuestionViewController.h"
#import "LBQuestionTableViewCell.h"
#import "LBUserHelpViewController.h"
#import "LBQuestionModel.h"
#import "LBQuestionHeaderView.h"

@interface LBQuestionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSMutableArray * arrData;

@end

@implementation LBQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"常见问题";
    
    LBQuestionModel * model = [[LBQuestionModel alloc] init];
    model.selectState = NO;
    model.stringTitle = @"如何清除缓存?";
    model.strContent = @"阿达大大大大大见大家都看得见阿迪拉科技大空间看见啊按实际大口大口打断了卡打了多久啊大大龙打了打多久啊大家";
    
    LBQuestionModel * model2 = [[LBQuestionModel alloc] init];
    model2.selectState = NO;
    model2.stringTitle = @"如何连接蓝牙音响?";
    model2.strContent = @"阿达大大大大大见大家都看得见阿迪拉科技大空间看见啊按实际大口大口打断了卡打了多久啊大大龙打了打多久啊大家";
    
    LBQuestionModel * model3 = [[LBQuestionModel alloc] init];
    model3.selectState = NO;
    model3.stringTitle = @"如何添加本地音乐?";
    model3.strContent = @"阿达大大大大大见大家都看得见阿迪拉科技大空间看见啊按实际大口大口打断了卡打了多久啊大大龙打了打多久啊大家";
    
    [self.arrData addObjectsFromArray:@[model,model2,model3]];
    [self setUI];
}

-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LBQuestionTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBQuestionTableViewCell"];

    [self.tableView registerNib:[UINib nibWithNibName:@"LBQuestionHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"LBQuestionHeaderView"];
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 40;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    LBQuestionModel * model = self.arrData[section];
    
    return model.isSelectState?1:0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    LBQuestionHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LBQuestionHeaderView"];
    LBQuestionModel * model = self.arrData[section];
    view.labelTitle.text = model.stringTitle;
    view.btnShow.selected = model.isSelectState;
    view.contentView.backgroundColor = [UIColor whiteColor];
    [view setShowContentBlock:^(BOOL state) {
        model.selectState = state;
        [self.tableView reloadData];
    }];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBQuestionModel * model = self.arrData[indexPath.section];
    LBQuestionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LBQuestionTableViewCell" forIndexPath:indexPath];
    cell.labelContent.text = model.strContent;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LBUserHelpViewController * vc = [[LBUserHelpViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableArray *)arrData{
    if (!_arrData ) {
        _arrData = [NSMutableArray array];
    }
    return _arrData;
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
