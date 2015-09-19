//
//  UIImage+ZCustomImage.m
//  lifetime
//
//  Created by doubin on 15/7/22.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "UIImage+ZCustomImage.h"

@implementation UIImage (ZCustomImage)

+ (UIImage *)z_customImageWith:(UIColor *)color size:(CGSize)size shape:(ZCustomImageShape) shape
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    //圆的边框宽度为2，颜色为红色
//    CGContextSetLineWidth(context,2);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGRect rect = {CGPointZero, size};
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    //在圆区域内画出image原图
//    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    
    //生成新的image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
