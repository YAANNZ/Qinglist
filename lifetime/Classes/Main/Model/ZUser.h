//
//  ZUser.h
//  lifetime
//
//  Created by doubin on 15/6/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZUser : NSObject

@property (nonatomic, copy) NSString *_id;
@property (nonatomic, assign) int listNums;
@property (nonatomic, assign) int favNums;
@property (nonatomic, strong) ZUser *followtopic;
@property (nonatomic, strong) ZUser *followuser;
@property (nonatomic, strong) ZUser *follower;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *avatar_profile;
@property (nonatomic, copy) NSString *avatar_huge;
@property (nonatomic, copy) NSString *avatar_large;
@property (nonatomic, copy) NSString *avatar_small;
@property (nonatomic, assign) int followerNums;
@property (nonatomic, assign) int followTopicNums;
@property (nonatomic, assign) int followUserNums;
@property (nonatomic, assign) BOOL followme;
@property (nonatomic, assign) BOOL ifollow;

@end
