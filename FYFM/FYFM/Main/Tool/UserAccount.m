//
//  UserAccount.m
//  FYFM
//
//  Created by mac_123 on 2018/4/19.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "UserAccount.h"

@implementation UserAccount

+(instancetype)sharedUserAccount
{
    static UserAccount *singleton;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        singleton = [[self alloc] init];
    });
    return  singleton;
}


- (void)setIsNotFirstLogin:(BOOL)isFirstLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:isFirstLogin forKey:USER_IS_NOT_FIRST_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)isNotFirstLogin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:USER_IS_NOT_FIRST_LOGIN];
}

@end
