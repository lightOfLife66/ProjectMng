//
//  NSObject+YTExtension.m
//  SMART1
//
//  Created by 袁涛 on 2017/7/26.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import "NSObject+YTExtension.h"

@implementation NSObject (YTExtension)

@end


@implementation NSObject (Regular)

+ (BOOL)regularPattern:(NSString *)pattern RegStr:(NSString *)str {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}


#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    NSString *pattern = @"^1+[3578]+\\d{9}";
    return [self regularPattern:pattern RegStr:telNumber];
}

#pragma 正则匹配用户密码
+ (BOOL)checkPassword:(NSString *) password
{
        NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
//    NSString *pattern = @"^[0-9A-Za-z]{6,16}$";
    return [self regularPattern:pattern RegStr:password];
    
}

#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName
{
    NSString *pattern = @"^[0-9a-zA-Z_]{6,16}$";
    return [self regularPattern:pattern RegStr:userName];
    
}

#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString *) idCard
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    return [self regularPattern:pattern RegStr:idCard];
}

#pragma 正则匹配  URL不规则
+ (BOOL)checkURL : (NSString *) url
{
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    return [self regularPattern:pattern RegStr:url];
    
}

#pragma marks - 判断是否有中文
+(BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

-(BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma url

#pragma 真实姓名正则
+ (BOOL)checkNAME:(NSString *)name
{
//    NSString *pattern = @"^[\u4e00-\u9fa5]+(·[\u4e00-\u9fa5]+)*$";
    NSString *pattern = @"^[\u4e00-\u9fa5_a-zA-Z]{1,15}";
    return [self regularPattern:pattern RegStr:name];
}

@end


