//
//  UDUserInfoModel.h
//  mcapp
//
//  Created by xzh on 2016/11/20.
//  Copyright © 2016年 发条橙. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, UDUserGenderType) {
    UDUserGenderTypeUnknow = 0,
    UDUserGenderTypeMan,
    UDUserGenderTypeWoman
};

typedef NS_ENUM(NSInteger, UDUserType) {
    UDUserTypeNormal = 0,    //普通用户
    UDUserTypeAuthority = 1, //官方用户
    UDUserTypeSign = 2,  //签约用户
};


@interface UDUserInfoModel : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *bgsrc;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, assign) UDUserGenderType gender;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, strong) NSNumber *provinceTag;
@property (nonatomic, strong) NSNumber *cityTag;
@property (nonatomic, strong) NSNumber *ageTag;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, strong) NSNumber *fansCount;
@property (nonatomic, strong) NSNumber *followCount;
@property (nonatomic, strong) NSNumber *starCount;
@property (nonatomic, strong) NSNumber *articlesCount;
@property (nonatomic, strong) NSNumber *draftsCount;
@property (nonatomic, strong) NSNumber *mooksCount;
@property (nonatomic, strong) NSNumber *favsCount;
@property (nonatomic, strong) NSNumber *subscribeMooksCount;
@property (nonatomic, strong) NSNumber *authorStatus;
@property (nonatomic, strong) NSNumber *status; 
@property (nonatomic, copy) NSArray *tags;

@end
