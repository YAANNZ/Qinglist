//
//  ZTableViewCell.m
//  lifetime
//
//  Created by doubin on 15/6/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZTableViewCell.h"
#import "ZStatusFrame.h"
#import "ZCustomContentView.h"

@interface ZTableViewCell ()

@property (nonatomic, weak) ZCustomContentView *customContentV;

@end

@implementation ZTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"cell";
    ZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[ZTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupCustomContentV];
    }
    return self;
}

- (void)setupCustomContentV
{
    ZCustomContentView *customContentV = [[ZCustomContentView alloc] init];
    self.customContentV = customContentV;
    customContentV.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:customContentV];
}

- (void)setStatusFrame:(ZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    self.customContentV.statusFrame = _statusFrame;
}

@end
