//
//  ZNavigationBar.m
//  lifetime
//
//  Created by doubin on 15/6/5.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZNavigationBar.h"

@interface ZNavigationBar ()

@property (nonatomic, weak) UIButton *topMenuBtn;
@property (nonatomic, weak) UIButton *creatBtn;

@end

@implementation ZNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setup];
    }
    return self;
}

- (void)setup
{

}


- (void)layoutSubviews
{
    [super layoutSubviews];
}

// 让添加到navigationBar上面的蒙板和显示出来的menuView接收到点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
//    ZLog(@"%ld",self.subviews.count);
//    ZLog(@"%@",self.subviews);
    BOOL yesOrNo = [super pointInside:point withEvent:event];
    for (UIView *subView in self.subviews)
    {
        if ([subView isKindOfClass:[UIButton class]])
        {
            yesOrNo = YES;
        }
    }
    return yesOrNo;
}

@end
