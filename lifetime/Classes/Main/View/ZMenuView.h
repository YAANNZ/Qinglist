//
//  ZMenuView.h
//  lifetime
//
//  Created by doubin on 15/6/5.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myBlock)();
@interface ZMenuView : UIView

@property (nonatomic, copy) myBlock closeBlock;

@end
