//
//  NetWorkTool.h
//  FYFM
//
//  Created by mac_123 on 2018/4/10.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "NetworkManager.h"

@interface NetWorkTool : NetworkManager

/**
 *   1.1.0  注册用户接口
 *
 *
 *
 */
+(NSURLSessionDataTask *) requestForRegisterWithParamDic:(NSDictionary *)paramDic
                                                 Success:(successBlock)success
                                                 Failure:(failureBlock)fail;
/**
 *   1.1.1  用户登录接口
 *
 *
 *
 */
+(NSURLSessionDataTask *) requestForLoginWithParamDic:(NSDictionary *) paramDic
                                              Success:(successBlock)success
                                              Failure:(failureBlock)fail;

@end
