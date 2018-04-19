//
//  NetWorkTool.m
//  FYFM
//
//  Created by mac_123 on 2018/4/10.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool

/**
 *   1.1.0  注册用户接口
 *
 *
 *
 */
+(NSURLSessionDataTask *) requestForRegisterWithParamDic:(NSDictionary *)paramDic
                                                 Success:(successBlock)success
                                                 Failure:(failureBlock)fail {
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@%@",API_PREFIX,@"user/register",API_SUFFIX];
                                                     
    return [[NetWorkTool shareManager] postWithUrlStr:urlStr Paramer:paramDic Success:^(id responseBody) {
         success(responseBody);
     } Failure:^(NSError *error) {
         fail(error);
     }];
}

/**
 *   1.1.1  用户登录接口
 *
 *
 *
 */
+(NSURLSessionDataTask *) requestForLoginWithParamDic:(NSDictionary *) paramDic
                                              Success:(successBlock)success
                                              Failure:(failureBlock)fail {
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@%@",API_PREFIX,@"user/login",API_SUFFIX];
    
    return [[NetWorkTool shareManager] postWithUrlStr:urlStr Paramer:paramDic Success:^(id responseBody) {
        success(responseBody);
    } Failure:^(NSError *error) {
        fail(error);
    }];
}
@end
