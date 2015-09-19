//
//  ZCustomContentView.m
//  lifetime
//
//  Created by doubin on 15/6/3.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZCustomContentView.h"

@interface ZCustomContentView ()

@property (nonatomic,weak) UILabel *titleLable;
@property (nonatomic,weak) UILabel *detailLable;
@property (nonatomic,weak) UIImageView *contentImageV;
@property (nonatomic,weak) UIImageView *faviconImageV;
@property (nonatomic,weak) UILabel *userNameL;
@property (nonatomic,weak) UILabel *timeLable;
@property (nonatomic,weak) UIButton *favoriteBtn;

@end

@implementation ZCustomContentView

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
    UILabel *titleLable = [[UILabel alloc] init];
    self.titleLable = titleLable;
    titleLable.backgroundColor = ZRandomColor;
    [self addSubview:titleLable];
    
    UILabel *detailLable = [[UILabel alloc] init];
    self.detailLable = detailLable;
    detailLable.backgroundColor = ZRandomColor;
    [self addSubview:detailLable];
    
    UIImageView *contentImageV = [[UIImageView alloc] init];
    self.contentImageV = contentImageV;
    //    contentImageV.backgroundColor = ZRandomColor;
    [self addSubview:contentImageV];
    
    UIImageView *faviconImageV = [[UIImageView alloc] init];
    self.faviconImageV = faviconImageV;
    //    faviconImageV.backgroundColor = ZRandomColor;
    [self addSubview:faviconImageV];
    
    UILabel *userNameL = [[UILabel alloc] init];
    self.userNameL = userNameL;
    userNameL.backgroundColor = ZRandomColor;
    [self addSubview:userNameL];
    
    UILabel *timeLable = [[UILabel alloc] init];
    self.timeLable = timeLable;
    timeLable.backgroundColor = ZRandomColor;
    [self addSubview:timeLable];
    
    UIButton *favoriteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.favoriteBtn = favoriteBtn;
    favoriteBtn.backgroundColor = ZRandomColor;
    [self addSubview:favoriteBtn];
}

- (void)setStatusFrame:(ZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    self.titleLable.text = _statusFrame.status.title;
    self.detailLable.text = [NSString stringWithFormat:@"%d 项",_statusFrame.status.itemNums];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_statusFrame.status.cover_thumb]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.contentImageV.image = [UIImage imageWithData:data];
    }];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_statusFrame.status.createBy.avatar_small]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.faviconImageV.image = [UIImage imageWithData:data];
    }];
    self.userNameL.text = _statusFrame.status.createBy.nickname;
    self.timeLable.text = _statusFrame.status.modified;
    [self.favoriteBtn setTitle:[NSString stringWithFormat:@"%d",_statusFrame.status.likeNums] forState:UIControlStateNormal];
    
    self.frame = _statusFrame.customContentVF;
    self.titleLable.frame = _statusFrame.titleLableF;
    self.detailLable.frame = _statusFrame.detailLableF;
    self.contentImageV.frame = _statusFrame.contentImageVF;
    self.faviconImageV.frame = _statusFrame.faviconImageVF;
    self.userNameL.frame = _statusFrame.userNameLF;
    self.timeLable.frame = _statusFrame.timeLableF;
    self.favoriteBtn.frame = _statusFrame.favoriteBtnF;
    
}

@end
