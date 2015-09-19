//
//  ZDetailViewController.m
//  lifetime
//
//  Created by doubin on 15/6/10.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZDetailViewController.h"
#import "ZDetailTableViewCell.h"
#import "ZDetailHeaderView.h"
#import "MobClick.h"

@interface ZDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation ZDetailViewController

#pragma mark - 友盟页面统计
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"detailPage"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"detailPage"];
}

#pragma mark - 界面布局
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - 44, self.view.width, 44)];
    bottomView.backgroundColor = [UIColor blackColor];
    bottomView.alpha = 0.3;
    [self.view addSubview:bottomView];
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrame.status.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return self.statusFrame.detailCellHeight;
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 220;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZDetailHeaderView *headerView = [[ZDetailHeaderView alloc] init];
    headerView.statusFrame = self.statusFrame;
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    footerV.backgroundColor = [UIColor whiteColor];
    return footerV;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDetailTableViewCell *cell = [ZDetailTableViewCell cellWithTableView:tableView];
    cell.indexPath = indexPath;
    cell.statusFrame = self.statusFrame;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
