//
//  ZCellData.h
//  lifetime
//
//  Created by doubin on 15/5/27.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCellData : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *detailText;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

@end
