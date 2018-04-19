//
//  NetworkManager.h
//  1yqg
//
//  Created by ProZ on 16/9/5.
//  Copyright © 2016年 1yqg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"

typedef void (^successBlock)(id responseBody);
typedef void (^failureBlock)(NSError *error);


@interface NetworkManager : NSObject



+(instancetype)shareManager;

-(NSURLSessionDataTask *)postWithUrlStr:(NSString *)urlStr Paramer:(id)paramer Success:(successBlock)successBlock Failure:(failureBlock)failureBlock;


-(NSURLSessionDataTask *)getWithUrlStr:(NSString *)urlStr Paramer:(id)paramer Success:(successBlock)successBlock Failure:(failureBlock)failureBlock;




+(void)specialGetWithUrlStr:(NSString *)urlStr Paramer:(id)paramer Success:(successBlock)successBlock Failure:(failureBlock)failureBlock;


- (void)cancelAllRequest;

@end
