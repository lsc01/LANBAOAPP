//
//  LBAddSongsViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/13.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBAddSongsViewController.h"
#import "LBAddSongsUpView.h"
#import "LBAddSongsCell.h"
#import "LBAddSongsModel.h"

@interface LBAddSongsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) LBAddSongsUpView * viewUp;

@property (nonatomic ,strong) NSMutableArray * arrData;
@end

@implementation LBAddSongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int i = 20;
    while (i--) {
        LBAddSongsModel * model = [[LBAddSongsModel alloc] init];
        model.isSelected = NO;
        [self.arrData addObject:model];
    }
    [self setUI];
}

-(void)setUI{
    self.viewUp = [[NSBundle mainBundle] loadNibNamed:@"LBAddSongsUpView" owner:nil options:nil].firstObject;
    [self.view addSubview:self.viewUp];
    
    UIButton * btnAddTo = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnAddTo setTitle:@"添加到" forState:UIControlStateNormal];
    btnAddTo.titleLabel.font = [UIFont systemFontOfSize:16];
    [btnAddTo setBackgroundColor:kAPPBaseColor];
    [btnAddTo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnAddTo addTarget:self action:@selector(addToListClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAddTo];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBAddSongsCell" bundle:nil] forCellReuseIdentifier:@"LBAddSongsCell"];
    
    [self.viewUp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(isIPhoneX?88:64);
    }];
    
    [btnAddTo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(btnAddTo.mas_top).offset(2);
        make.top.mas_equalTo(self.viewUp.mas_bottom).offset(2);
    }];
    WeakSelf();
    [self.viewUp setCloseViewBlock:^{
        [weakself dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    [self.viewUp setAllSelectedBlock:^(BOOL isSelect) {
        for (LBAddSongsModel * model in weakself.arrData) {
            model.isSelected = isSelect;
        }
        [weakself.tableView reloadData];
    }];
   
}

-(void)addToListClick{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBAddSongsModel * model = self.arrData[indexPath.row];
    LBAddSongsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LBAddSongsCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.btnSelected.selected = model.isSelected;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LBAddSongsModel * model = self.arrData[indexPath.row];
    LBAddSongsCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.btnSelected.selected = !cell.btnSelected.selected;
    model.isSelected = cell.btnSelected.selected;
}

-(NSMutableArray *)arrData{
    if (!_arrData) {
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
