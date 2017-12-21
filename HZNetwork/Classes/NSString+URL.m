//
//  NSString+URL.m
//  AFNetworking
//
//  Created by xzh on 2017/12/21.
//

#import "NSString+URL.h"

@implementation NSString (URL)

- (NSString *)urlEncode
{
    return [obj stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"-_.!*'();:@$,[]"]];
}

@end
