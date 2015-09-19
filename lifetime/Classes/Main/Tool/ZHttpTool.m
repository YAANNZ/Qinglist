//
//  ZHttpTool.m
//  lifetime
//
//  Created by doubin on 15/7/14.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZHttpTool.h"
#import "AFNetworking.h"

@implementation ZHttpTool

+ (void)POST:(NSString *)url parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [[AFHTTPRequestOperationManager alloc] init];
    [mgr POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure(error);
        }
    }];
}

+ (void)GET:(NSString *)url parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [[AFHTTPRequestOperationManager alloc] init];
    [mgr GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure(error);
        }
    }];
}

@end
