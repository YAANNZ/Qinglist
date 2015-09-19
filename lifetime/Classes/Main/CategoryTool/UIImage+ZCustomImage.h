//
//  UIImage+ZCustomImage.h
//  lifetime
//
//  Created by doubin on 15/7/22.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZCustomImageTetragonumShape = 1,
    ZCustomImageEllipticalShape,
    ZCustomImageCircularShape
} ZCustomImageShape;

@interface UIImage (ZCustomImage)

+ (UIImage *)z_customImageWith:(UIColor *)color size:(CGSize )size shape:(ZCustomImageShape )shape;

@end
