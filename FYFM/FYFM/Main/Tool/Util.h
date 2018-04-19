//
//  Util.h
//  SMART1
//
//  Created by 袁涛 on 2017/7/26.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kmainScreenSize [UIScreen mainScreen].bounds.size
#define kmainScreenWidth kmainScreenSize.width
#define kmainScreenHeight kmainScreenSize.height
#define kmainScreenBounds [UIScreen mainScreen].bounds


@interface Util : NSObject

/** 是否是第一次启动App */
+ (BOOL)yt_GetFristStart;

/** 手机序列号 */
//+ (NSString *)identifierNumber;

/** 获取系统版本号 */
+ (NSString *)systemVersion;
/** 获取项目版本号 */
+ (NSString *)currentAppVersion;
/** 获取当前手机型号 */
+ (NSString *)currentPhoneType;
/** 获取设备类型  */
+ (NSString *)currentAppChannel;
/** 获取UDID */
+ (NSString *)currentUDID;
/** 固定时间串 */
+ (NSString *)utilTimeStr;
/** 获取加密后的token */
+ (NSString *)currentEncryptionToken:(NSString *)timestamp;
/** 获取token */
+ (NSString *)token;
/** 获取经纬度 */
+ (NSString *)loactions;
/** 获取反地理编码 */
+ (NSString *)area;
/** mingzi */
+ (NSString *)name;
/** 余额 */


+ (NSString *)currentTimestamp;



#pragma mark - RECT

/** 是否是iPhone X */
+ (BOOL)isiPhoneX;
+ (BOOL)isiPhone5;
+ (BOOL)isiPhone6;
+ (BOOL)isiPhone6P;

/** 导航栏高度 */
+ (CGFloat)navBarHeight;

/** 底部导航栏高度 */
+ (CGFloat)tabBarHeight;

+ (CGFloat)statusBarHeight;

//全局size
+ (CGSize)mainScreenSize;
+ (CGFloat)mainScreenWidth;
+ (CGFloat)mainScreenHegiht;

+ (CGFloat)contentHeight;


+ (UIImage *)navBarBackgoundImage;
+ (UIImage *)linearPictureImage;


//计算高度
+ (CGFloat)HomeDayStyleCellContentHight;


#pragma mark - 用户
//+ (BOOL)isLogin;
//+ (NSString *)userid;
//+ (NSString *)userMobile;
@end





