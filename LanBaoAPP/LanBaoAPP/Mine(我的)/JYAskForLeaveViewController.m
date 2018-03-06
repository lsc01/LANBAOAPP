//
//  JYAskForLeaveViewController.m
//  JYParent
//
//  Created by lsc on 2017/12/7.
//  Copyright © 2017年 互动家园. All rights reserved.
//

#import "JYAskForLeaveViewController.h"

#import "JYAskForLeaveDetailCell.h"

#import "YHUtil.h"
#import "TZImagePickerController.h"
#import "BRPickerView.h"//时间选择
#import <zhPopupController/zhPopupController.h>
#import "NSDate+Extension.h"
#import "NSDate+Formatter.h"
#import "JYBottomSelectView.h"

typedef void(^selectedPhotos)(NSArray *photoArray);
@interface JYAskForLeaveViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>
@property (strong ,nonatomic) UITableView * tableView;

@property(nonatomic,copy)selectedPhotos selectedPhotosBlock;
@property(nonatomic,assign)NSUInteger photoNum;//图片数量
@property (nonatomic, strong) NSMutableArray *selectedArray;

@end

@implementation JYAskForLeaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"意见反馈";

    [self setUI];
    
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavigationBarAndStateBarHeight) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.backgroundColor = HEXCOLOR(kbackgroundColor);
        _tableView.sectionFooterHeight = 0;
        
    
       
    
        [_tableView registerClass:[JYAskForLeaveDetailCell class] forCellReuseIdentifier:@"JYAskForLeaveDetailCell"];

        [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"UITableViewHeaderFooterView"];
        
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}


-(void)setUI{

    [self.view addSubview:self.tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {return 220;}
            break;
        default:
        {return 0;}
            break;
    }
    return 0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
    case 0:
        {return 42;}
        break;
    default:
        {return 0;}
        break;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    headView.backgroundView.backgroundColor = HEXCOLOR(kbackgroundColor);
    return headView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            JYAskForLeaveDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JYAskForLeaveDetailCell" forIndexPath:indexPath];
            //点击添加图片
            WeakSelf();
            [cell setPhotoSelectBlock:^(NSInteger count , JYAskForLeaveDetailCell * cellT) {
                StrongSelf();
                //选择图片
                __weak typeof(cellT) weakCell = cellT;
                [strongself openPhotoMenuWithLimit:3-count Photos:^(NSArray *photoArray) {
                    __strong typeof(cellT) strongCell = weakCell;
                    strongCell.photoArray = photoArray;//把图片传回cell
                }];
            }];
            
            return cell;
            
        }
            break;
        default:
        {
            
            return nil;
            
        }
            break;
    }
    
    return nil;
}

#pragma mark - 选择相片
//打开选择列表
-(void)openPhotoMenuWithLimit:(NSUInteger)Num Photos:(selectedPhotos)PhotosBlock{
    
    _selectedPhotosBlock = PhotosBlock;
    _photoNum = Num;
    _selectedArray = nil;
    
     WeakSelf();
    JYBottomSelectView * selectView = [[JYBottomSelectView alloc] initDataArray:@[@"从相册选取",@"拍照",@"取消"] CancelClickBlock:^{
        StrongSelf();
        [strongself.zh_popupController dismiss];
    } DidSelectIdxBlock:^(NSUInteger idx) {
        StrongSelf();
        [strongself.zh_popupController dismiss];
        if(idx == 0){//相册
            [strongself OpenPotoLibWithPhotoLimit:_photoNum selected:_selectedArray];
        }else if(idx == 1){//拍照
            [strongself OpenCamera];
        }
    }];
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.layoutType = zhPopupLayoutTypeBottom;
    self.zh_popupController.dismissOnMaskTouched = NO;
    [self.zh_popupController presentContentView:selectView];
    
}

-(void)OpenPotoLibWithPhotoLimit:(NSUInteger)num selected:(NSMutableArray *)selectedArray
{
    if([YHUtil isAllowPhotoAlbum]){//监测权限
       
        TZImagePickerController *imagePC=[[TZImagePickerController alloc]initWithMaxImagesCount:num delegate:self];//设置多选最多支持的最大数量，设置代理
        
        WeakSelf();
        [imagePC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            StrongSelf();
            strongself.selectedPhotosBlock?strongself.selectedPhotosBlock(photos):nil;
        }];
            
        [self presentViewController:imagePC animated:YES completion:nil];//跳转
    } else {
        
        [self showSystemAlert:@"请打开 设置-隐私-照片 来进行设置"];
    }
    
}

#pragma mark - 打开相册
-(void)OpenCamera
{

    if([YHUtil isAllowCamera]) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.sourceType = sourceType;
            picker.delegate = self;
            //设置拍照后的图片可被编辑
            //            picker.showsCameraControls = YES;
            picker.allowsEditing = YES;
            
            [self presentViewController:picker animated:YES completion:nil];
        } else {
            NSLog(@"模拟其中无法打开照相机,请在真机中使用");
        }
    } else {
        
        [self showSystemAlert:@"请打开 设置-隐私-相机 来进行设置"];
    }
    
}
-(void)showSystemAlert:(NSString *)msg{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"系统提示" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark  - 照相机
//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        
        NSArray *imageArray = [NSArray arrayWithObject:image];
        _selectedPhotosBlock?_selectedPhotosBlock(imageArray):nil;
        
        
    }
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 时间选择
-(void)selectBeginOrEndTimeWithLabel:(UILabel *)labelTime{
    
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDateAndTime defaultSelValue:@"" minDateStr:@"" maxDateStr:@"" isAutoSelect:YES resultBlock:^(NSString *selectValue,NSDate * selectDate) {
        labelTime.text = selectValue;
        NSLog(@"selectDate:%@",selectDate);
    }];
    
    
//    TGTimePickerView *pickerView = [[TGTimePickerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTimePickerHeight) PickType:UUDateStyle_YearMonthDayHourMinute];
//    pickerView.title = @"时间选择";
//    self.zh_popupController = [zhPopupController new];
//    self.zh_popupController.layoutType = zhPopupLayoutTypeBottom;
//    self.zh_popupController.dismissOnMaskTouched = NO;
//    [self.zh_popupController presentContentView:pickerView];
//    WeakSelf();
//    [pickerView setCancelClickBlock:^{
//        StrongSelf();
//        [strongself.zh_popupController dismiss];
//    }ConfirmClickBlock:^(NSDate *date) {
//
//        labelTime.text = [date stringWithFormat:@"yyyy-MM-dd HH:mm"];
//        StrongSelf();
//        [strongself.zh_popupController dismiss];
//    }];
}

//获取所有的cell的数据
-(void)getDataWithAllCell{
    JYAskForLeaveDetailCell * cell3 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSArray * photoArray = cell3.photoArray;
    NSString * textReason = cell3.textReason;
    
    NSLog(@"3:%@",textReason);
    NSLog(@"4:%@",photoArray);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
