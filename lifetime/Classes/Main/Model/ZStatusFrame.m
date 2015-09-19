//
//  ZStatusFrame.m
//  lifetime
//
//  Created by doubin on 15/6/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZStatusFrame.h"

@implementation ZStatusFrame

- (void)setStatus:(ZStatus *)status
{
    _status = status;
    
    [self setupFrame];
}

- (void)setupFrame
{
    _titleLableF = CGRectMake(5, 10, [UIScreen mainScreen].bounds.size.width - 10, 40);
    _detailLableF = CGRectMake(5, CGRectGetMaxY(_titleLableF), _titleLableF.size.width, 30);
    _contentImageVF = CGRectMake(0, CGRectGetMaxY(_detailLableF), [UIScreen mainScreen].bounds.size.width - 6, 160);
    _faviconImageVF = CGRectMake(0, CGRectGetMaxY(_contentImageVF), 60, 60);
    _userNameLF = CGRectMake(_faviconImageVF.size.width, _faviconImageVF.origin.y, 60, 30);
    _timeLableF = CGRectMake(_userNameLF.origin.x, CGRectGetMaxY(_userNameLF), 100, 30);
    _favoriteBtnF = CGRectMake(_contentImageVF.size.width - 60, CGRectGetMaxY(_contentImageVF), 60, 60);
    _customContentVF = CGRectMake(3, 6, [UIScreen mainScreen].bounds.size.width - 6, CGRectGetMaxY(self.timeLableF));
    _cellHeight = CGRectGetMaxY(self.timeLableF) + 6;
    
//    _detailCellHeight = 
}

@end
