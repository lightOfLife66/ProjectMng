//
//  Util.m
//  SMART1
//
//  Created by hhf on 2017/7/26.
//  Copyright © 2018年 Y_T. All rights reserved.
//

#import "Util.h"
#import <UIKit/UIDevice.h>
#import <sys/utsname.h>
#import "NSDate+UIExtension.h"

@implementation Util


+ (BOOL)yt_GetFristStart {
//    BOOL isFrist = [[YTDefaultsTool yt_objectForKey:yt_firstStart] boolValue];
//    return isFrist;
    return NO;
}

+ (NSString *)identifierNumber {
//    return [[UIDevice currentDevice] uniqueIdentifier];
//    return [UIDevice currentDevice]
    return @"";
}


+ (NSString *)systemVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)currentAppVersion {
//    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];//获取项目版本号
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];//获取项目版本号
    return version;
}

+ (NSString *)currentAppChannel {
    return @"iOS";
}

+ (NSString *)currentUDID {
//    NSString * currentDeviceUUIDStr = [SSKeychain passwordForService:@"" account:@""];
//    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""]) {
//        CFUUIDRef uuid = CFUUIDCreate(NULL);
//        assert(uuid != NULL);
//        CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
//        [SSKeychain setPassword:[NSString stringWithFormat:@"%@", uuidStr] forService:@"" account:@""];
//
//    }
//    NSString *retrieveuuid = [SSKeychain passwordForService:@"com.ai3010.www"account:@"BAIFENZHISANUDID"];
//    return retrieveuuid;
   return @"";

}

+ (NSString *)utilTimeStr {
    return @"";
}


+ (NSString *)currentEncryptionToken:(NSString *)timestamp{
    if ([Util token].length == 0 || [Util token] == nil) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@_%@",[Util token],timestamp];
}

//+ (NSString *)token {
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:access_token];//[YTDefaultsTool yt_objectForKey:yt_Token];
//    return token;
//}
//
//+ (NSString *)name {
//    NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:user_nickname];
//    return name;
//}

/** 获取经纬度 */
+ (NSString *)loactions {
    return @"";//[YTDefaultsTool yt_objectForKey:yt_locations];
}
/** 获取反地理编码 */
+ (NSString *)area {
    return @"";//[YTDefaultsTool yt_objectForKey:yt_locationArea];
}

+ (NSString *)currentTimestamp {
    return [NSString stringWithFormat:@"%lld",[NSDate longLongFromDate:[NSDate date]]];
}


+ (NSString *)currentPhoneType {
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"])  return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])  return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])  return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"iPhone10,1"] || [platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    
    if ([platform isEqualToString:@"iPhone10,2"] || [platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if ([platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    return platform;
    
}

+ (BOOL)isiPhone {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+(BOOL)isiPhoneX {
    if (([[self currentPhoneType] isEqualToString:@"iPhone X"] || kmainScreenHeight == 812) && [self isiPhone]) {
        return YES;
    }else {
        return NO;
    }
}

+ (BOOL)isiPhone5 {
    if ([self isiPhone] && [self mainScreenHegiht] == 568.0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isiPhone6 {
    if ([self isiPhone] && [self mainScreenHegiht] == 667.0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isiPhone6P {
    if ([self isiPhone] && [self mainScreenHegiht] == 736.0) {
        return YES;
    }
    return NO;
}

+(CGFloat)navBarHeight  {
    if ([self isiPhoneX]) {
        return 88;
    }else {
        return 64;
    }
}

+ (CGFloat)tabBarHeight {
    if ([self isiPhoneX]) {
        return 83;
    }else {
        return 49;
    }
    
}


//全局size
+ (CGSize)mainScreenSize {
    return kmainScreenSize;
}

+ (CGFloat)mainScreenWidth{
    return kmainScreenWidth;
}

+ (CGFloat)mainScreenHegiht{
    return kmainScreenHeight;
}

+ (CGFloat)contentHeight {
    return kmainScreenHeight - [self navBarHeight] - 49;
}

static CGFloat _kstatusBarHeight = 0;
+ (CGFloat)statusBarHeight {
    if (_kstatusBarHeight == 0) {
        if ([Util isiPhoneX]) {
            _kstatusBarHeight = 44;
        }else {
            _kstatusBarHeight = 20;
        }
    }
    return _kstatusBarHeight;
}

static UIImage *_navBarBackgoundImage;
+ (UIImage *)navBarBackgoundImage {
    if (_navBarBackgoundImage == nil) {
//        _navBarBackgoundImage = [[self linearPictureImage] yt_imageWithClippedRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [Util navBarHeight])];
    }
    return _navBarBackgoundImage;
}


static UIImage *_linearPictureImage;
+ (UIImage *)linearPictureImage {
    if (_linearPictureImage == nil) {
//        _linearPictureImage = [UIImage yt_imageStartColor:[UIColor yt_colorWithHexString:@"#ee7f26"] endColor:[UIColor yt_colorWithHexString:@"#e24019"] rect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 184 + [Util navBarHeight]) isLineer:YES];
        
    }
    return _linearPictureImage;
}

static CGFloat _HomeDayStyleCellContentHight;
+ (CGFloat)HomeDayStyleCellContentHight {
    if (_HomeDayStyleCellContentHight == 0) {
        _HomeDayStyleCellContentHight = (([Util mainScreenWidth] - 15 ) / 2.0) / 180 * 260;
    }
    return _HomeDayStyleCellContentHight;
}


//+ (BOOL)isLogin {
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:access_token];
//    BOOL login = token != nil && token != NULL && token.length > 0;
//    return login;
//}
//
//+ (NSString *)userid {
//    NSString *user = [[NSUserDefaults standardUserDefaults] objectForKey:user_id];
//    return user.length == 0 ? @"" : user;
//}
//
//+ (NSString *)userMobile {
//    NSString *user = [[NSUserDefaults standardUserDefaults] objectForKey:user_mobile];
//    return user.length == 0 ? @"" : user;
//}



@end
