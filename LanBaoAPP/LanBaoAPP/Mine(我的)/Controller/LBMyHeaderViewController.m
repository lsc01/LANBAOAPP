//
//  LBMyHeaderViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/9.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBMyHeaderViewController.h"
#import "JYBottomSelectView.h"
#import "YHUtil.h"
#import "TZImagePickerController.h"
#import <zhPopupController/zhPopupController.h>

@interface LBMyHeaderViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>
@property (nonatomic ,strong) UIImageView * imageView;
@end

@implementation LBMyHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人头像";
    [self setNav];
    [self setUI];
}

-(void)setNav{
    
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_more"] style:UIBarButtonItemStylePlain target:self action:@selector(NavBarButtonClick)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)setUI{
    [self.view addSubview:self.imageView];
}

-(UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = self.headImage;
        _imageView.frame = CGRectMake(0, 20, kScreenWidth, kScreenWidth);
    }
    return _imageView;
}

-(void)NavBarButtonClick{
    WeakSelf();
    JYBottomSelectView * selectView = [[JYBottomSelectView alloc] initDataArray:@[@"从相册选取",@"拍照",@"取消"] CancelClickBlock:^{
        StrongSelf();
        [strongself.zh_popupController dismiss];
    } DidSelectIdxBlock:^(NSUInteger idx) {
        StrongSelf();
        [strongself.zh_popupController dismiss];
        if(idx == 0){//相册
            [strongself OpenPotoLibWithPhotoLimit:1 selected:nil];
        }else if(idx == 1){//拍照
            [strongself OpenCamera];
        }
    }];
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.layoutType = zhPopupLayoutTypeBottom;
    self.zh_popupController.dismissOnMaskTouched = NO;
    [self.zh_popupController presentContentView:selectView];
}
#pragma mark - 选择相片

-(void)OpenPotoLibWithPhotoLimit:(NSUInteger)num selected:(NSMutableArray *)selectedArray
{
    if([YHUtil isAllowPhotoAlbum]){//监测权限
        
        TZImagePickerController *imagePC=[[TZImagePickerController alloc]initWithMaxImagesCount:num delegate:self];//设置多选最多支持的最大数量，设置代理
        
        WeakSelf();
        [imagePC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            StrongSelf();
            strongself.imageView.image = photos.firstObject;
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
        
        
        self.imageView.image = image;
    }
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
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
