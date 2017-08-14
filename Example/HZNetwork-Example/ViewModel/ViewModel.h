//
//  ViewModel.h
//  HZNetwork-Example
//
//  Created by xzh on 2017/8/11.
//  Copyright © 2017年 GeniusBrother. All rights reserved.
//

#import "HZViewModel.h"
#import "UDCollectionModel.h"
@interface ViewModel : HZViewModel

@property(nonatomic, strong) HZSessionTask *task;
@property(nonatomic, strong) NSMutableArray *modelArray;

@end
