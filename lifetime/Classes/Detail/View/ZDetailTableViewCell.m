//
//  ZDetailTableViewCell.m
//  lifetime
//
//  Created by doubin on 15/6/17.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZDetailTableViewCell.h"
#import "ZItem.h"

@interface ZDetailTableViewCell ()

@property (nonatomic, weak) UILabel *titleLable;

@end

@implementation ZDetailTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"detailCell";
    ZDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[ZDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    UILabel *titleLable = [[UILabel alloc] init];
    self.titleLable = titleLable;
    titleLable.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:titleLable];
    
    
}

- (void)setStatusFrame:(ZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    ZItem *zItem = _statusFrame.status.items[self.indexPath.row];
//    ZLog(@"%@",zItem);

    self.titleLable.text = zItem.title;
    self.titleLable.frame = CGRectMake(10, 10, 100, 20);
}

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
