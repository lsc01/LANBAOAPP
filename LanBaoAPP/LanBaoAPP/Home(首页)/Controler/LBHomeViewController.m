//
//  LBHomeViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBHomeViewController.h"
#import "LBMyViewController.h"
#import "LBHomeUpTableViewCell.h"
#import "LBHomeDownTableViewCell.h"
#import "LBHomeCenterHeaderView.h"
#import "LBHomeBottomPlayView.h"
#import "LBSongKindViewController.h"
#import "LBAddSongsViewController.h"

@interface LBHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSArray * arrImages;
@property (nonatomic ,strong) NSArray * arrTitles;
@property (nonatomic ,strong)  LBHomeBottomPlayView * playView;
@property (nonatomic ,strong) LBSongKindViewController * kindVC;
@property (nonatomic ,strong) UIView * viewChilder;//用于承载子控制器视图
@end

@implementation LBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"首页";
    
    [self setnav];
    
    self.arrImages = @[@"",@"",@"",@""];
    self.arrTitles = @[@[@"常见问题",@"意见反馈",@"消息中心",@"系统设置"],@[@"中国风",@"外国风",@"东风",@"西风"]];
    [self setUI];
}

-(void)setnav{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_person"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarbuttonClick)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)rightBarbuttonClick{
    LBMyViewController * myVC = [[LBMyViewController alloc] init];
    
    [self.navigationController pushViewController:myVC animated:YES];
}



-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LBHomeUpTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBHomeUpTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBHomeDownTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBHomeDownTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBHomeCenterHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"LBHomeCenterHeaderView"];
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 40;
    
    [self setBottomPlayView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrTitles.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrTitles[section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LBHomeCenterHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LBHomeCenterHeaderView"];
    return view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LBHomeUpTableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"LBHomeUpTableViewCell" forIndexPath:indexPath];
        cell1.labelTitle.text = self.arrTitles[indexPath.section][indexPath.row];
        return cell1;
    }else{
        LBHomeDownTableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"LBHomeDownTableViewCell" forIndexPath:indexPath];
        cell2.labeltitle.text = self.arrTitles[indexPath.section][indexPath.row];
        return cell2;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.viewChilder = [[UIView alloc] init];
    [self.view addSubview:self.viewChilder];
    [self.viewChilder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.playView.mas_top);
    }];
    self.kindVC = [[LBSongKindViewController alloc] init];
    self.title = self.arrTitles[indexPath.section][indexPath.row];
    self.kindVC.view.frame = self.viewChilder.bounds;
    [self.viewChilder addSubview:self.kindVC.view];
    [self addChildViewController:self.kindVC];
//    [self.navigationController pushViewController:kindVC animated:YES];
    
    //显示的这个视图的时候，更改导航栏左右barButton
    [self updateNavBarButton];
}

-(void)updateNavBarButton{
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(removeChildView)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = nil;
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addNewSongs)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)removeChildView{
    
    [self.kindVC.view removeFromSuperview];
    self.kindVC.view = nil;
    [self.viewChilder removeFromSuperview];
    self.viewChilder = nil;
    [self.kindVC removeFromParentViewController];
    self.kindVC = nil;
    
    self.title = nil;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_person"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarbuttonClick)];
    self.navigationItem.rightBarButtonItem = item;
    
}


-(void)addNewSongs{
    NSLog(@"这个方法暂定");
    LBAddSongsViewController * addVC = [[LBAddSongsViewController alloc] init];
    [self presentViewController:addVC animated:YES completion:^{
        
    }];
}

-(void)setBottomPlayView{
    self.playView = [[NSBundle mainBundle] loadNibNamed:@"LBHomeBottomPlayView" owner:nil options:nil].firstObject;
    
    UIView * viewCurrProgress = [[UIView alloc] init];
    viewCurrProgress.backgroundColor = HEXCOLOR(kblueColor);
    [self.playView.viewProgressBar addSubview:viewCurrProgress];
    
    [self.view addSubview:self.playView];
    
    [viewCurrProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self.playView.viewProgressBar);
        make.width.mas_equalTo(self.playView.viewProgressBar).multipliedBy(0.6);
    }];

    [self.playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.height.mas_equalTo(60);
        
    }];
    
    [self.playView setHeadImageLookUpBlock:^(UIImage *image) {
        NSLog(@"a");
    }];
    [self.playView setSongInfoLookUpBlock:^{
        NSLog(@"b");
    }];
    
    [self.playView setPlayOrPauseBlock:^(BOOL isPlay) {
        NSLog(@"c");
    }];
    
    [self.playView setSongMenuLookUpBlock:^{
        NSLog(@"d");
    }];
    
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
