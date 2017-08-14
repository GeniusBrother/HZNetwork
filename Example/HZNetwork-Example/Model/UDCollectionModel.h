//
//  UDCollectionModel.h
//  mcapp
//
//  Created by xzh on 2016/10/24.
//  Copyright © 2016年 发条橙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UDUserInfoModel.h"
#import "UDSerializationNumModel.h"
@interface UDCollectionModel : NSObject

@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *info;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, strong) NSNumber *time;
@property(nonatomic, copy) NSString *link;
@property(nonatomic, strong) NSNumber *views;
@property(nonatomic, strong) NSNumber *stars;
@property(nonatomic, strong) NSNumber *updatedAt;
@property(nonatomic, strong) UDSerializationNumModel *nums;
@property(nonatomic, strong) UDUserInfoModel *user;
@end
