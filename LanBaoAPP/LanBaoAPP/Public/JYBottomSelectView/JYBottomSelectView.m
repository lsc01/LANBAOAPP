//
//  JYBottomSelectView.m
//  JYParent
//
//  Created by lsc on 2017/12/9.
//  Copyright © 2017年 互动家园. All rights reserved.
//

#import "JYBottomSelectView.h"
#import "JYBottomSelectCell.h"
#define kSelectRowHeight 50*([UIScreen mainScreen].bounds.size.width)/375.0
#define KSelectWidth [UIScreen mainScreen].bounds.size.width
#define kSelectMaxHeight [UIScreen mainScreen].bounds.size.height*2/3.0
@interface JYBottomSelectView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) NSArray * arrayData;

@property(nonatomic,copy)JYBottomSelectViewCancelClick cancelClickBlock;
@property(nonatomic,copy)JYBottomSelectViewDidSelectIdx didSelectIdxBlock;
@end

@implementation JYBottomSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initDataArray:(NSArray <NSString *>*)arrData CancelClickBlock:(JYBottomSelectViewCancelClick)cancelClickBlock DidSelectIdxBlock:(JYBottomSelectViewDidSelectIdx)didSelectIdxBlock{
    CGFloat height = kSelectRowHeight*arrData.count>kSelectMaxHeight?kSelectMaxHeight:kSelectRowHeight*arrData.count;
    CGRect frame = CGRectMake(0, 0, KSelectWidth,height);
    
    if(self = [super initWithFrame:frame]){
        _arrayData = arrData;
        _cancelClickBlock = cancelClickBlock;
        _didSelectIdxBlock = didSelectIdxBlock;
        [self setSubView];
    }
    return self;
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        [_tableView registerClass:[JYBottomSelectCell class] forCellReuseIdentifier:@"JYBottomSelectCell"];
    }
    return _tableView;
}



-(void)setSubView{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSelectRowHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JYBottomSelectCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JYBottomSelectCell" forIndexPath:indexPath];
    
    cell.jyLabelTitle.text = self.arrayData[indexPath.row];
    if(indexPath.row == self.arrayData.count-1){
        cell.jyLabelTitle.textColor = HEXCOLOR(kitemTitleColor);
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _didSelectIdxBlock?_didSelectIdxBlock(indexPath.row):nil;
}

@end
