//
//  AppDelegate.m
//  HZNetwork-Example
//
//  Created by xzh on 2017/8/7.
//  Copyright © 2017年 GeniusBrother. All rights reserved.
//

#import "AppDelegate.h"
#import <HZNetwork/HZNetwork.h>
#import "HZNetworkCacheHandler.h"
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Configs Data
    //The corresponding response data format is {code:0,data:{....},msg:"success"}.
    [[HZNetworkConfig sharedConfig] setupBaseURL:@"https://api.udostory.com" codeKeyPath:@"code" msgKeyPath:@"msg" userAgent:@"HZNetwork Example" rightCode:0];
    
    //Setting task should cache response by default.
    [HZNetworkConfig sharedConfig].taskShouldCache = YES;
    
    //Registers the cache hanlder which implements the protocol of HZNetworkCache.
    [[HZNetworkConfig sharedConfig] registerCacheHandler:[[HZNetworkCacheHandler alloc] init]];
    
//    HZSessionTask *task = [HZSessionTask taskWithMethod:@"GET" URLString:@"http://localhost:1337/test" params:@{@"name":@"谢作鸿"} delegate:nil taskIdentifier:@"task"];
//    [task startWithCompletion:^(HZSessionTask * _Nonnull task) {
//        if (task.state == HZSessionTaskStateSuccess) {
//            NSLog(@"%@", task.responseObject);
//        }
//    }];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
