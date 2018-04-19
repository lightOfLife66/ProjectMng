//
//  NetworkManager.m
//  1yqg
//
//  Created by ProZ on 16/9/5.
//  Copyright © 2016年 1yqg. All rights reserved.
//

#import "NetworkManager.h"
#import <AFHTTPSessionManager.h>


@interface NetworkManager ()

@property(nonatomic,strong)AFHTTPSessionManager *manager;

@end

@implementation NetworkManager

+(instancetype)shareManager{
    static NetworkManager *singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        singleton = [[self alloc] init];
        singleton.manager = [singleton AFNConfig];
        
    });
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        [cookieJar deleteCookie:cookie];
    }
    return  singleton;
}


-(AFHTTPSessionManager *)AFNConfig{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    

    manager.requestSerializer = [AFHTTPRequestSerializer serializer];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    
    
    return manager;

}

- (void)cancelAllRequest
{
    
    [self.manager.operationQueue cancelAllOperations];
}



-(NSURLSessionDataTask *)postWithUrlStr:(NSString *)urlStr Paramer:(id)paramer Success:(successBlock)successBlock Failure:(failureBlock)failureBlock{

//    AFHTTPSessionManager *manager = [self AFNConfig];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    

    return [self.manager POST:urlStr parameters:paramer progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

    
        if (successBlock) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

-(NSURLSessionDataTask *)getWithUrlStr:(NSString *)urlStr Paramer:(id)paramer Success:(successBlock)successBlock Failure:(failureBlock)failureBlock{

//    AFHTTPSessionManager *manager = [self AFNConfig];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    return [self.manager GET:urlStr parameters:paramer progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];
    
}

+(void)specialGetWithUrlStr:(NSString *)urlStr Paramer:(id)paramer Success:(successBlock)successBlock Failure:(failureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager GET:urlStr parameters:paramer progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];

}

@end
