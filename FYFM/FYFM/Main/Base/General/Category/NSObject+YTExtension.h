//
//  NSObject+YTExtension.h
//  SMART1
//
//  Created by 袁涛 on 2017/7/26.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YTExtension)

@end

@interface NSObject (Regular)
/** 正则匹配手机号 */
+ (BOOL)checkTelNumber:(NSString *) telNumber;
/** 正则匹配用户密码 */
+ (BOOL)checkPassword:(NSString *) password;
/** 正则匹配用户姓名,20位的中文或英文 */
+ (BOOL)checkUserName : (NSString *) userName;
/**正则匹配用户身份证号*/
+ (BOOL)checkUserIdCard: (NSString *) idCard;

/** 正则匹配  URL不规则 */
+ (BOOL)checkURL : (NSString *) url;

/** 真实姓名正则 */
+ (BOOL)checkNAME:(NSString *)name;
/**判断是否有中文**/
+(BOOL)IsChinese:(NSString *)str;

/**判断邮箱是否合法**/
-(BOOL) validateEmail:(NSString *)email;

@end







