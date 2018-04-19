//
//  UserAccount.h
//  FYFM
//
//  Created by mac_123 on 2018/4/19.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import <Foundation/Foundation.h>
#define USER_IS_NOT_FIRST_LOGIN     @"userIsNotFirstLogin"

@interface UserAccount : NSObject


///是否第一次登陆
@property(assign,nonatomic)BOOL isNotFirstLogin;

+ (instancetype)sharedUserAccount;


@end
