//
//  UDSerializationDetailCell.h
//  mcapp
//
//  Created by xzh on 2016/10/24.
//  Copyright © 2016年 发条橙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UDCollectionModel;
@interface UDSerializationDetailCell : UITableViewCell

@property(nonatomic, strong) UDCollectionModel *collectionModel;

+ (instancetype)cellForTableView:(UITableView *)tableView;

@end
