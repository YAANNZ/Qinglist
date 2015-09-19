//
//  ZHttpTool.h
//  lifetime
//
//  Created by doubin on 15/7/14.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHttpTool : NSObject

/**
 *  POST请求
 *
 *  @param url        请求URL
 *  @param parameters 普通的请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  GET请求
 *
 *  @param url        请求URL
 *  @param parameters 普通的请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
