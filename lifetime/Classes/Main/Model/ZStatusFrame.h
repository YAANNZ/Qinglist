//
//  ZStatusFrame.h
//  lifetime
//
//  Created by doubin on 15/6/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZStatus.h"

@interface ZStatusFrame : NSObject

@property (nonatomic, strong) ZStatus *status;

// 主页cell控件的frame
@property (nonatomic, assign, readonly) CGRect titleLableF;
@property (nonatomic, assign, readonly) CGRect detailLableF;
@property (nonatomic, assign, readonly) CGRect contentImageVF;
@property (nonatomic, assign, readonly) CGRect faviconImageVF;
@property (nonatomic, assign, readonly) CGRect userNameLF;
@property (nonatomic, assign, readonly) CGRect timeLableF;
@property (nonatomic, assign, readonly) CGRect favoriteBtnF;
@property (nonatomic, assign, readonly) CGRect customContentVF;
@property (nonatomic, assign, readonly) CGFloat cellHeight;

// 详情页cell控件的frame
@property (nonatomic, assign, readonly) CGFloat detailCellHeight;

@end
