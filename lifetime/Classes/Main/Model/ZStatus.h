//
//  ZStatus.h
//  lifetime
//
//  Created by doubin on 15/6/3.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "ZUser.h"
#import "ZCate.h"

@interface ZStatus : NSObject

@property (nonatomic, copy) NSString *_id;
@property (nonatomic, assign) float hv;
@property (nonatomic, assign) float comments;
@property (nonatomic, assign) float clones;
@property (nonatomic, assign) float views;
@property (nonatomic, copy) NSString *publishDate;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) ZUser *createBy;
@property (nonatomic, copy) NSString *modified;
@property (nonatomic, copy) NSString *added;
@property (nonatomic, copy) NSString *note;
@property (nonatomic, strong) ZCate *cate;
@property (nonatomic, copy) NSString *fork;
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *cover_thumb2x;
@property (nonatomic, copy) NSString *cover_thumb;
@property (nonatomic, copy) NSString *cover_url;
@property (nonatomic, assign) BOOL pushlished;
@property (nonatomic, assign) int itemNums;
@property (nonatomic, assign) int favNums;
@property (nonatomic, assign) int likeNums;
@property (nonatomic, copy) NSString *sid;
@property (nonatomic, assign) BOOL ifavit;
@property (nonatomic, assign) BOOL ilikeit;

@end
