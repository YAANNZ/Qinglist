//
//  UIColor+Extension.m
//  lifetime
//
//  Created by doubin on 15/6/25.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)string
{
    if ([string hasPrefix:@"#"])
    {
        string = [string substringFromIndex:1];//去掉头
    }
    else
    {
        return [UIColor whiteColor]; // 去头非十六进制，返回白色
    }
    
    //分别取RGB的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [string substringWithRange:range];
    int r = rString.intValue;
    
    range.location = 2;
    NSString *gString = [string substringWithRange:range];
    int g = gString.intValue;
    
    range.location = 4;
    NSString *bString = [string substringWithRange:range];
    int b = bString.intValue;
    
    //转换为UIColor
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

@end
