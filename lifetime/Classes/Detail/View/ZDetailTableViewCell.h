//
//  ZDetailTableViewCell.h
//  lifetime
//
//  Created by doubin on 15/6/17.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZStatusFrame.h"

@interface ZDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) ZStatusFrame *statusFrame;
@property (nonatomic, assign) NSIndexPath *indexPath;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
