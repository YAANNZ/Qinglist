//
//  ZMenuView.m
//  lifetime
//
//  Created by doubin on 15/6/5.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZMenuView.h"

@interface ZMenuView ()

@property (nonatomic, weak) UILabel *titleLable;
@property (nonatomic, weak) UIButton *closeBtn;

@end


@implementation ZMenuView

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
    for (int i = 1; i < 9; i++)
    {
        UIButton *cellBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//        cellBtn.backgroundColor = [UIColor grayColor];
        [cellBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"cate_%d",i]] forState:UIControlStateNormal];
        [cellBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"cate_%d",i]] forState:UIControlStateSelected];
        [self addSubview:cellBtn];
    }
    
    UILabel *titleLable = [[UILabel alloc] init];
    self.titleLable = titleLable;
    titleLable.text = @"选择分类";
    [self addSubview:titleLable];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.closeBtn = closeBtn;
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"categories_close"] forState:UIControlStateSelected];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"categories_close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int column = 3;
    int row = 3;
    int cellW = 96;
    int cellH = 96;
    int topMargin = 40;
    int cellMargin = (self.width - (column * cellW)) / (column + 1);
    for (int i = 0; i < 8; i++)
    {
        int cellX = cellMargin + (i % column) * (cellW + cellMargin);
        int cellY = topMargin + (i / row) * (cellH + cellMargin);
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(cellX, cellY, cellW, cellH);
    }
    
    int titleLableW = 70;
    int titleLableH = 30;
    int titleLableX = (self.width - titleLableW) / 2;
    int titleLableY = (topMargin - titleLableH) / 2;
    self.titleLable.frame = CGRectMake(titleLableX, titleLableY, titleLableW, titleLableH);
    
    int closeBtnW = 24;
    int closeBtnH = closeBtnW;
    int closeBtnX = self.width - closeBtnW - cellMargin;
    int closeBtnY = self.height - closeBtnH - (topMargin - closeBtnH) / 2;
    self.closeBtn.frame = CGRectMake(closeBtnX, closeBtnY, closeBtnW, closeBtnH);
    
}

- (void)coverBtnClick
{
    self.closeBlock();
}

@end
