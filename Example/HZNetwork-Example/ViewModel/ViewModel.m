//
//  ViewModel.m
//  HZNetwork-Example
//
//  Created by xzh on 2017/8/11.
//  Copyright © 2017年 GeniusBrother. All rights reserved.
//

#import "ViewModel.h"
#import <YYModel/YYModel.h>
#import <HZFoundation/HZFoundation.h>
@implementation ViewModel

- (void)loadViewModel
{
    [super loadViewModel];
    
    NSString *path = @"/api/collection/list";
    HZSessionTask *task = [HZSessionTask taskWithMethod:@"GET" path:path params:[NSMutableDictionary dictionaryWithObjectsAndKeys:@6,@"type",@1,@"page",@20,@"pageSize", nil] delegate:self taskIdentifier:path];
    self.task = task;
    
    self.modelArray = [NSMutableArray array];

}

//Call when data is coming. Including cache data.
- (void)taskDidFetchData:(HZSessionTask *)task
{
    NSArray *dicModelArray = [task.responseObject objectForKeyPath:@"data.list"];
    if (dicModelArray.isNoEmpty) {
        NSArray *pageArray = [NSArray yy_modelArrayWithClass:[UDCollectionModel class] json:dicModelArray];
        [self appendPageArray:pageArray pageNumber:[task.params integerValueForKeyPath:@"page" def:1] pageSize:20];
    }
}

- (void)appendPageArray:(NSArray *)pageArray pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize
{
    if (!pageArray.isNoEmpty) return;
    if (pageNumber == 1) {
        [self.modelArray setArray:pageArray];
    }else if (pageNumber >1) {
        NSInteger preCount = (pageNumber - 1) * pageSize;
        if (self.modelArray.count > preCount) {
            [self.modelArray removeObjectsInRange:NSMakeRange(preCount, self.modelArray.count - preCount)];
        }
        
        [self.modelArray addObjectsFromArray:pageArray];
    }
}
@end
