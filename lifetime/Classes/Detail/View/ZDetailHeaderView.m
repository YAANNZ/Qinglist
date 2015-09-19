//
//  ZDetailHeaderView.m
//  lifetime
//
//  Created by doubin on 15/6/24.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZDetailHeaderView.h"

@interface ZDetailHeaderView ()

@property (nonatomic,weak) UIImageView *contentImageV;
@property (nonatomic,weak) UIView *coverView;
@property (nonatomic,weak) UILabel *titleLable;
@property (nonatomic,weak) UILabel *itemNumLable;
@property (nonatomic,weak) UIView *typeView;
@property (nonatomic, weak) UILabel *typeLable;
@property (nonatomic,weak) UIImageView *faviconImageV;
@property (nonatomic,weak) UILabel *userNameL;

@end

@implementation ZDetailHeaderView

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
    self.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *contentImageV = [[UIImageView alloc] init];
    self.contentImageV = contentImageV;
    [self addSubview:contentImageV];
    
    UIView *coverView = [[UIView alloc] init];
    self.coverView = coverView;
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    [self addSubview:coverView];
    
    UILabel *titleLable = [[UILabel alloc] init];
    self.titleLable = titleLable;
    titleLable.textColor = [UIColor whiteColor];
//    titleLable.backgroundColor = ZRandomColor;
    [self addSubview:titleLable];
    
    UILabel *itemNumLable = [[UILabel alloc] init];
    self.itemNumLable = itemNumLable;
    itemNumLable.textColor = [UIColor whiteColor];
    [self addSubview:itemNumLable];
    
    UIView *typeView = [[UIView alloc] init];
    self.typeView = typeView;
    [self addSubview:typeView];
    
    UILabel *typeLable = [[UILabel alloc] init];
    self.typeLable = typeLable;
    typeLable.textColor = [UIColor whiteColor];
    [self addSubview:typeLable];
    
    UIImageView *faviconImageV = [[UIImageView alloc] init];
    self.faviconImageV = faviconImageV;
    [self addSubview:faviconImageV];
    
    UILabel *userNameL = [[UILabel alloc] init];
    self.userNameL = userNameL;
//    userNameL.backgroundColor = ZRandomColor;
    [self addSubview:userNameL];
    
}

- (void)setStatusFrame:(ZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 赋值
    self.titleLable.text = _statusFrame.status.title;
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_statusFrame.status.cover_thumb]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.contentImageV.image = [UIImage imageWithData:data];
    }];
    self.itemNumLable.text = [NSString stringWithFormat:@"%d项",_statusFrame.status.itemNums];
    
    self.typeLable.text = _statusFrame.status.cate.title;
    self.typeView.backgroundColor = [UIColor colorWithHexString:_statusFrame.status.cate.color];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_statusFrame.status.createBy.avatar_small]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.faviconImageV.image = [UIImage imageWithData:data];
    }];
    self.userNameL.text = [NSString stringWithFormat:@"by @%@",_statusFrame.status.createBy.nickname];

    // 设置frame
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 220);
    self.contentImageV.frame = CGRectMake(0, 0, self.width, 160);
    self.coverView.frame = self.contentImageV.frame;
    self.titleLable.frame = CGRectMake(30, 30, 200, 40);
    self.itemNumLable.frame = CGRectMake(self.titleLable.x, CGRectGetMaxY(self.titleLable.frame), 60, 40);
    self.faviconImageV.frame = CGRectMake(self.width - 60, self.height - 60, 60, 60);
    self.faviconImageV.layer.cornerRadius = self.faviconImageV.width * 0.5;
    self.faviconImageV.layer.masksToBounds = YES;
    self.typeLable.frame = CGRectMake(self.titleLable.x, 110, 100, 40);
    self.typeView.frame = CGRectMake(10, 110, 20, 40);
    self.userNameL.frame = CGRectMake(self.titleLable.x, 170, 160, 40);
    
}

@end
