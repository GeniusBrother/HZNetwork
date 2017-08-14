HZNetwork
==============

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/GeniusBrother/HZNetwork/master/LICENSE)&nbsp;
[![CocoaPods](https://img.shields.io/cocoapods/v/HZNetwork.svg?style=flat)](http://cocoapods.org/pods/HZNetwork)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/HZNetwork.svg?style=flat)](http://cocoadocs.org/docsets/HZNetwork)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

A useful networking framework based on AFNetworking for iOS, OS X, watchOS, and tvOS.<br/>
(It's a component of [HZExtend](https://github.com/ibireme/HZExtend))

Contact
==============
#### QQ Group:32272635
#### Email:zuohong_xie@163.com


Demo
==============

Installation
==============
### CocoaPods

1. Add `pod 'HZNetwork'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<HZNetwork/HZNetwork.h\>.

Documentation
==============
Full API documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/HZNetwork/).<br/>

Requirements
==============
This library requires `iOS 8.0+` and `Xcode 8.0+`.

Usage
==============
### Network Config
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Config Data.
    ////The corresponding response data format is {code:0,data:{....},msg:"success"}.
    [[HZNetworkConfig sharedConfig] setupBaseURL:@"https://api.example.com" codeKeyPath:@"code" msgKeyPath:@"msg" userAgent:@"HZNetwork Example" rightCode:0];
    
    //Setting task should cache response by default.
    [HZNetworkConfig sharedConfig].taskShouldCache = YES;
    
    //Registers the cache hanlder which implements the protocol of HZNetworkCache.
    [[HZNetworkConfig sharedConfig] registerCacheHandler:[[HZNetworkCacheHandler alloc] init]];                              
}    
```

### Basis Task
```objective-c
/**
 HZSessionTask represents the specific request task. You can use it to config parameters for request and get response data from it.
 */
//Create task
HZSessionTask *task = [HZSessionTask taskWithMethod:@"GET" path:@"/user/info" params:@{@"type":@6} delegate:self taskIdentifier:@"/user/info"];

//Setting http header field.
[task setValue:@"application/json" forHeaderField:@"Content-type"];

//Setting whether the task should cache response data.
@property(nonatomic, assign, getter=isCached) BOOL cached;

//Start task with completion block.
[task startWithCompletion:^(HZSessionTask * _Nonnull task) {
    if (task.state == HZSessionTaskStateSuccess) {
        //handle data....
        
    }else {
        //show alert...
    }
}];

//Get response data
@property(nullable, nonatomic, strong, readonly) id responseObject;

//Get response error
@property(nullable, nonatomic, strong, readonly) NSError *error;
```

### Uplod File
```objective-c
//Create upload task
HZSessionTask *uploadTask = [HZSessionTask uploadTaskWithPath:@"/user/avatar" params:@{@"id":@"3"} delegate:self taskIdentifier:@"/user/avatar"];

//Setting file params
uploadTask.fileParams = [NSMutableDictionary dictionaryWithDictionary:@{kHZFileMimeType:@"image/jpeg",kHZFileFormName:@"file",kHZFileURL:localPath}];

//Get upload progress
uploadTask.uploadProgressBlock = ^(HZSessionTask * _Nonnull task, NSProgress * _Nonnull progress) {
   
}

[uploadTask start];
```

### CallBack
```objective-c
@interface HZSessionTask : NSObject
/** A block to be executed after completion of task. */
@property(nonatomic, copy) HZSessionTaskDidCompletedBlock taskDidCompletedBlock;

/** A block to be executed after sending task. */
@property(nonatomic, copy) HZSessionTaskDidSendBlock taskDidSendBlock;

/** A block to be executed after task is cancled. */
@property(nonatomic, copy) HZSessionTaskDidCancelBlock taskDidCancelBlock;

/** A block to be executed when the upload progress is updated. */
@property(nonatomic, copy) HZSessionTaskUploadProgressBlock uploadProgressBlock;

@end

@protocol HZSessionTaskDelegate<NSObject>

/**
 Calls after completion of task.
 
 @discussion At this point, the state of task may be HZSessionTaskStateSuccess or HZSessionTaskStateFail.
 */
- (void)taskDidCompleted:(HZSessionTask *)task;

/**
 Calls after task is send.
 
 @discussion At this point, the state of task is SessionTaskStateRunning.
 
 Befor the method is called, the task has already loaded cache data. So you can use `responseObject` property to get cache data.
 */
- (void)taskDidSend:(HZSessionTask *)task;

/**
 Calls after task is cancled.
 
 @discussion At this point, the state of task is HZSessionTaskStateCancel.
 */
- (void)taskDidCancel:(HZSessionTask *)task;

/**
 Calls when the task is to be executed.
 
 @params message Sets the value and find it by 'error' property.
 @return YES if the task should be stop or NO if allow.
 */
- (BOOL)taskShouldStop:(HZSessionTask *)task stopMessage:(NSString *_Nullable __autoreleasing *_Nullable)message;

@end

```
