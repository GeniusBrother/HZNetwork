//
//  HZNetworkCacheHandler.m
//  HZNetwork-Example
//
//  Created by xzh on 2017/8/11.
//  Copyright © 2017年 GeniusBrother. All rights reserved.
//

#import "HZNetworkCacheHandler.h"
#import <YYCache/YYCache.h>
@implementation HZNetworkCacheHandler

#pragma mark - HZNetworkCache
- (void)setCache:(id)cache forKey:(NSString *)key
{
    if (!cache || !key) return;
    
    YYCache *cacheStore = [YYCache cacheWithName:@"network"];
    
    [cacheStore setObject:cache forKey:key];
}

- (id)cacheForKey:(NSString *)key
{
    if (!key) return nil;
    
    YYCache *cacheStore = [YYCache cacheWithName:@"network"];
    return [cacheStore objectForKey:key];
}

@end
