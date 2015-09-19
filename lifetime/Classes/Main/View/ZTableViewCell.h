//
//  ZTableViewCell.h
//  lifetime
//
//  Created by doubin on 15/6/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZStatusFrame.h"

@interface ZTableViewCell : UITableViewCell

@property (nonatomic, strong) ZStatusFrame *statusFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
