//
//  UDSerializationDetailCell.m
//  mcapp
//
//  Created by xzh on 2016/10/24.
//  Copyright © 2016年 发条橙. All rights reserved.
//

#import "UDSerializationDetailCell.h"
#import "UDSerializationItemView.h"
#import "UDSerializationNumView.h"
#import <HZFoundation/HZFoundation.h>
#import <Masonry/Masonry.h>
@interface UDSerializationDetailCell ()

@property(nonatomic, weak) UDSerializationItemView *itemView;
@property(nonatomic, weak) UDSerializationNumView *numView;

@end

@implementation UDSerializationDetailCell

+ (instancetype)cellForTableView:(UITableView *)tableView
{
    static NSString *const kCellID = @"UDSerializationDetailCell";
    UDSerializationDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (cell == nil) {
        cell = [[UDSerializationDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews
{
    
    CGFloat itemViewLeft = 14;
    UDSerializationItemView *itemView = [[UDSerializationItemView alloc] initWithFrame:CGRectMake(itemViewLeft, 22, HZDeviceWidth - itemViewLeft, 0)]; //高度由数据决定
    [self.contentView addSubview:itemView];
    self.itemView = itemView;
    
    UDSerializationNumView *numView = [[UDSerializationNumView alloc] initWithFrame:CGRectMake(164.5, 0, 0,11)];
    [self.contentView addSubview:numView];
    self.numView = numView;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorForHex:0xb2b4b6];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(lineView.superview);
    }];
    
}

- (void)setCollectionModel:(UDCollectionModel *)collectionModel
{
    _collectionModel = collectionModel;
    
    self.itemView.collectionModel = collectionModel;
    
    self.numView.numModel = collectionModel.nums;
    self.numView.top = self.itemView.bottom + 17;
}



@end
