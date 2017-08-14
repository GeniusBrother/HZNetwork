//
//  UIImageView+HZExtend.m
//  mcapp
//
//  Created by xzh on 16/1/8.
//  Copyright © 2016年 zhuchao. All rights reserved.
//

#import "UIImageView+HZExtend.h"
#import <HZFoundation/NSObject+HZExtend.h>
@implementation UIImageView (HZExtend)

- (void)safeSetImageWithURL:(NSString *)url placeholder:(UIImage *)image
{
    if (url.isNoEmpty) {
        NSURL *imageURL = [NSURL URLWithString:url];
        [[SDWebImageManager sharedManager] cachedImageExistsForURL:imageURL completion:^(BOOL isInCache) {
            if (isInCache) {
                NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:imageURL];
                self.image = [[SDWebImageManager sharedManager].imageCache imageFromCacheForKey:key];
            }else {
                [self sd_setImageWithURL:imageURL placeholderImage:image];
            }
        }];
    }else {
        self.image = image;
    }
}

@end
