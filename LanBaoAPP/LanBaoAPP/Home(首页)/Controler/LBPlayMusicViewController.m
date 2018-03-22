//
//  LBPlayMusicViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/15.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBPlayMusicViewController.h"

@interface LBPlayMusicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UIView * viewPregress;
@property (nonatomic ,strong) UIView * viewPregressBg;
@property (nonatomic ,strong) UIImageView * imageViewHead;
@property (nonatomic, strong) UITableView * tableViewList;
@property (nonatomic ,strong) UIButton * buttonLike;
@property (nonatomic ,strong) UISlider * slider;
@property (nonatomic ,strong) UIButton * btnMenu;
@property (nonatomic ,strong) UIButton * btnPrevious;
@property (nonatomic ,strong) UIButton * btnPlay;
@property (nonatomic ,strong) UIButton * btnNext;
@property (nonatomic ,strong) UIButton * btnLoop;
@property (nonatomic ,strong) UILabel * labelCurrTime;
@property (nonatomic ,strong) UILabel * labelTotal;

@end

@implementation LBPlayMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUI];
    
}

-(void)setUI{
    UIButton * buttonClose =[UIButton buttonWithType:UIButtonTypeCustom];
    [buttonClose setBackgroundImage:[UIImage imageNamed:@"cell_down"] forState:UIControlStateNormal];
    [buttonClose addTarget:self action:@selector(closebtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonClose];
    
    [buttonClose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(15);
        make.height.width.mas_equalTo(25);
        make.top.mas_equalTo(self.view).offset(isIPhoneX?54:30);
    }];
    
    self.viewPregressBg = [[UIView alloc] init];
    self.viewPregressBg.backgroundColor = HEXCOLOR(0xcccccc);
    [self.view addSubview:self.viewPregressBg];
    
    self.viewPregress = [[UIView alloc] init];
    self.viewPregress.backgroundColor = HEXCOLOR(kblueColor);
    [self.viewPregressBg addSubview:self.viewPregress];
    
    [self.viewPregressBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(buttonClose.mas_bottom).offset(10);
    }];
    
    [self.viewPregress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self.viewPregressBg);
        make.width.mas_equalTo(self.viewPregressBg).multipliedBy(0.6);
    }];
    
    
    self.labelCurrTime = [[UILabel alloc] init];
    self.labelCurrTime.text = @"1:35";
    self.labelCurrTime.font = [UIFont systemFontOfSize:12];
    self.labelCurrTime.textColor = HEXCOLOR(kdesribeColor);
    [self.view addSubview:self.labelCurrTime];
    
    self.labelTotal = [[UILabel alloc] init];
    self.labelTotal.text = @"3:35";
    self.labelTotal.font = [UIFont systemFontOfSize:12];
    self.labelTotal.textColor = HEXCOLOR(kdesribeColor);
    self.labelTotal.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.labelTotal];
    
    [self.labelCurrTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(20);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(100);
        make.top.mas_equalTo(self.viewPregressBg.mas_bottom).offset(5);
    }];
    
    [self.labelTotal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(-20);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(100);
        make.top.mas_equalTo(self.viewPregressBg.mas_bottom).offset(5);
    }];

    self.imageViewHead = [[UIImageView alloc] init];
    self.imageViewHead.image = [UIImage imageNamed:@"mine_header"];
    [self.view addSubview:self.imageViewHead];
    
    CGFloat W_H = kScreenWidth - 120 - 40;
    
    [self.imageViewHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.viewPregressBg.mas_bottom).offset(50);
        make.left.mas_equalTo(self.view).offset(40);
        make.width.height.mas_equalTo(W_H);
    }];
    
    self.buttonLike =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonLike setBackgroundImage:[UIImage imageNamed:@"kindCell_dislike"] forState:UIControlStateNormal];
    [self.buttonLike setBackgroundImage:[UIImage imageNamed:@"kindCell_like"] forState:UIControlStateSelected];
    [self.buttonLike addTarget:self action:@selector(likeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonLike];
    
    [self.buttonLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(20);
        make.top.mas_equalTo(self.viewPregressBg.mas_bottom).offset(45);
        make.centerX.mas_equalTo(self.view.mas_right).offset(-60);
    }];
    
    
    self.btnMenu =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnMenu setBackgroundImage:[UIImage imageNamed:@"player_menu"] forState:UIControlStateNormal];
    [self.btnMenu addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnMenu];
    
    self.btnPrevious =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnPrevious setBackgroundImage:[UIImage imageNamed:@"player_menu"] forState:UIControlStateNormal];
    [self.btnPrevious addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnPrevious];
    
    self.btnPlay =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnPlay setBackgroundImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateNormal];
    [self.btnPlay addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnPlay];
    
    self.btnNext =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnNext setBackgroundImage:[UIImage imageNamed:@"player_menu"] forState:UIControlStateNormal];
    [self.btnNext addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnNext];
    
    self.btnLoop =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnLoop setBackgroundImage:[UIImage imageNamed:@"player_menu"] forState:UIControlStateNormal];
    [self.btnLoop addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnLoop];
    
    [self.btnPlay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.width.mas_equalTo(50);
        make.bottom.mas_equalTo(self.view).offset(-20);
    }];
    CGFloat btn_WH = 20;
    CGFloat margin = (kScreenWidth - (btn_WH*4+50))/6.0;
    [self.btnMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.btnPlay);
        make.left.mas_equalTo(self.view).offset(margin);
        make.width.height.mas_equalTo(btn_WH);
    }];
    
    [self.btnPrevious mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.btnPlay);
        make.left.mas_equalTo(self.btnMenu.mas_right).offset(margin);
        make.width.height.mas_equalTo(btn_WH);
    }];
    
    [self.btnLoop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.btnPlay);
        make.right.mas_equalTo(self.view).offset(-margin);
        make.width.height.mas_equalTo(btn_WH);
    }];
    
    [self.btnNext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.btnPlay);
        make.right.mas_equalTo(self.btnLoop.mas_left).offset(-margin);
        make.width.height.mas_equalTo(btn_WH);
    }];
    
    
    self.tableViewList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableViewList.dataSource = self;
    self.tableViewList.delegate = self;
    self.tableViewList.backgroundColor = [UIColor clearColor];
    self.tableViewList.bounces = NO;
    self.tableViewList.showsVerticalScrollIndicator = NO;
    self.tableViewList .showsHorizontalScrollIndicator = NO;
    self.tableViewList.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableViewList.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableViewList];
    
    [self.tableViewList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    
    [self.tableViewList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view).offset(-100);
        make.top.mas_equalTo(self.imageViewHead.mas_bottom).offset(20);
        make.bottom.mas_equalTo(self.btnPlay.mas_top).offset(-20);
    }];
   
}
- (IBAction)closebtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)likeBtnClick:(UIButton *)btnLike{
    btnLike.selected = !btnLike.selected;
}

-(void)buttonClick:(UIButton *)btn{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"dhbajsdjkladfjklso";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor clearColor];
    return  cell;
}

@end
