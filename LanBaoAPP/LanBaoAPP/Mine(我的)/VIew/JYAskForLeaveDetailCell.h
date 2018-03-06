//
//  JYAskForLeaveDetailCell.h
//  JYParent
//
//  Created by lsc on 2017/12/7.
//  Copyright © 2017年 互动家园. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JYAskForLeaveDetailCell;
typedef void(^selectedPhotos)(NSArray *photoArray);
@interface JYAskForLeaveDetailCell : UITableViewCell

//返回的相册数据
@property (nonatomic ,strong) NSArray * photoArray;
//返回的输入框的数据
@property (nonatomic ,copy ,readonly) NSString * textReason;

@property (nonatomic ,copy) void(^photoSelectBlock)(NSInteger count , JYAskForLeaveDetailCell * cell);
-(void)setPhotoSelectBlock:(void (^)(NSInteger count,JYAskForLeaveDetailCell * cell))photoSelectBlock;



@end
