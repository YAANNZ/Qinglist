//
//  ZMainViewController.m
//  lifetime
//
//  Created by doubin on 15/5/7.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZMainViewController.h"
#import "ZSettingTableViewController.h"
#import "ZTableViewCell.h"
#import "ZStatus.h"
#import "MJRefresh.h"
#import "ZStatusFrame.h"
#import "ZNavigationBar.h"
#import "ZBottomView.h"
#import "ZMenuView.h"
#import "ZDetailViewController.h"
#import "ZHttpTool.h"
#import "ZLoginViewController.h"
#import "MobClick.h"

@interface ZMainViewController () <UITableViewDataSource, UITableViewDelegate, ZBottomViewDelegate>

@property (nonatomic, weak) UIButton *allBtn;
@property (nonatomic, weak) UIButton *releaseBtn;
@property (nonatomic,weak) UIView *leftItemView;
@property (nonatomic,weak) UIView *sliderView;
@property (nonatomic, weak) UIButton *topMenuBtn;
@property (nonatomic, weak) UIButton *creatBtn;

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) UIView *bottomView;

@property (nonatomic,weak) ZMenuView *menuView;
@property (nonatomic,weak) UIButton *coverbtn;


@property (nonatomic,strong) NSMutableArray *statusFrames;

@end

@implementation ZMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavagationBar];
    [self addTableView];
    [self addBelowView];
    
    [self addMenuView];
    [self setupRefresh];
    [self.tableView.header beginRefreshing];
    
}

#pragma mark 布局模块初始化
- (void)setupNavagationBar
{
    ZNavigationBar *navigationBar = [[ZNavigationBar alloc] init];
    [self.navigationController setValue:navigationBar forKey:@"navigationBar"];
    
    // 1、leftBarButtonItem的设置
    UIView *leftItemView = [[UIView alloc] init];
    self.leftItemView = leftItemView;
    UIButton *allBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.allBtn = allBtn;
    int allBtnW = 35;
    int allBtnH = 25;
    int allBtnX = 0;
    int allBtnY = 0;
    allBtn.frame = CGRectMake(allBtnX, allBtnY, allBtnW, allBtnH);
    [allBtn setTitle:@"所有" forState:UIControlStateNormal];
    [allBtn setTitleColor:[UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1.0] forState:UIControlStateNormal];
    [allBtn addTarget:self action:@selector(allBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftItemView addSubview:allBtn];
    
    UIButton *releaseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.releaseBtn = releaseBtn;
    int releaseBtnW = 55;
    int releaseBtnH = allBtn.height;
    int releaseBtnX = allBtn.width;
    int releaseBtnY = allBtn.y;
    releaseBtn.frame = CGRectMake(releaseBtnX, releaseBtnY, releaseBtnW, releaseBtnH);
    [releaseBtn setTitle:@"已发布" forState:UIControlStateNormal];
    [releaseBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0] forState:UIControlStateNormal];
    [releaseBtn addTarget:self action:@selector(releaseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftItemView addSubview:releaseBtn];
    
    UIView *sliderView = [[UIView alloc] init];
    self.sliderView = sliderView;
    int sliderViewX = allBtn.x;
    int sliderViewY = CGRectGetMaxY(allBtn.frame);
    int sliderViewW = allBtn.width;
    int sliderViewH = 3;
    sliderView.frame = CGRectMake(sliderViewX, sliderViewY, sliderViewW, sliderViewH);
    sliderView.backgroundColor = [UIColor colorWithRed:33/255.0 green:147/255.0 blue:245/255.0 alpha:1.0];
    [leftItemView addSubview:sliderView];
    leftItemView.frame = CGRectMake(0, 0, allBtn.width + releaseBtn.width, allBtn.height + sliderView.height);
    leftItemView.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftItemView];
    
    // 2、rightBarButtonItem的设置
    UIView *rightItemView = [[UIView alloc] init];
    
    UIButton *topMenuBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.topMenuBtn = topMenuBtn;
    [topMenuBtn setTitle:@"轻单精选" forState:UIControlStateNormal];
    [topMenuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 
    int topMenuBtnW = 94;
    int topMenuBtnH = 24;
    int topMenuBtnY = 0;
    int topMenuBtnX = 0;
    topMenuBtn.frame = CGRectMake(topMenuBtnX, topMenuBtnY, topMenuBtnW, topMenuBtnH);
    [topMenuBtn addTarget:self action:@selector(topMenuBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightItemView addSubview:topMenuBtn];
    
    UIButton *creatBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    creatBtn.frame = self.topMenuBtn.frame;
    creatBtn.frame = CGRectMake(0, 0, 94, 24);
    [creatBtn setTitle:@"创建轻单" forState:UIControlStateNormal];
    [creatBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [creatBtn setImage:[UIImage imageNamed:@"titlebar_icon_add"] forState:UIControlStateNormal];
    [creatBtn addTarget:self action:@selector(creatBtnClick) forControlEvents:UIControlEventTouchUpInside];
    creatBtn.hidden = YES;
    self.creatBtn = creatBtn;
    [rightItemView addSubview:creatBtn];
    rightItemView.frame = topMenuBtn.frame;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightItemView];
}

- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 44);
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)addBelowView
{
    ZBottomView *bottomView = [[ZBottomView alloc] init];
    self.bottomView = bottomView;
    bottomView.frame = CGRectMake(0, self.view.height - 44, self.view.width, 44);
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.delegate = self;
    [self.view addSubview:bottomView];
}

// 添加menuView
- (void)addMenuView
{
    int topMargin = 40;
    int column = 3;
    int cellW = 96;
    int cellMargin = (self.view.width - (column * cellW)) / (column + 1);
    ZMenuView *menuView = [[ZMenuView alloc] init];
    self.menuView = menuView;
    int menuViewW = self.view.width;
    int menuViewH = menuViewW + topMargin * 2 - cellMargin * 2;
    int menuViewX = 0;
    int menuViewY = self.view.height - 20;
    menuView.frame = CGRectMake(menuViewX, menuViewY, menuViewW, menuViewH);
    menuView.backgroundColor = [UIColor whiteColor];
    menuView.closeBlock = ^(){
        [self coverBtnClick];
    };
    [self.navigationController.navigationBar addSubview:menuView];
}

#pragma mark 导航栏左右item点击事件的处理
- (void)allBtnClick
{
    [self.releaseBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.allBtn setTitleColor:[UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1.0] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.sliderView.x = self.allBtn.x;
        self.sliderView.width = self.allBtn.width;
    }];
    
}

- (void)releaseBtnClick
{
    [self.allBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.releaseBtn setTitleColor:[UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1.0] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.sliderView.x = self.releaseBtn.x;
        self.sliderView.width = self.releaseBtn.width;
    }];
}

- (void)topMenuBtnClick
{
    [self bottomViewForMenuButtonClick];
}

- (void)creatBtnClick
{
    ZLog(@"点击了创建按钮");
}


#pragma mark ZBottomViewDelegate
- (void)bottomViewForSgControlClick:(UISegmentedControl *)sgControl
{
    if (sgControl.selectedSegmentIndex)
    {
        ZLog(@"我的轻单");
        self.topMenuBtn.hidden = YES;
        self.creatBtn.hidden = NO;
        UIButton *menuBtn = [self.bottomView.subviews firstObject];
        menuBtn.hidden = YES;
        self.navigationItem.leftBarButtonItem.customView.hidden = NO;
      
#warning goto
        if(NO) // 已登陆
        {
            // 请求数据刷新数据
        }
        else
        {
            // modal登录界面
            ZLoginViewController *loginViewController = [[ZLoginViewController alloc] init];
            [self presentViewController:loginViewController animated:YES completion:nil];
        }
        
    }
    else
    {
        ZLog(@"搜索发现");
        self.topMenuBtn.hidden = NO ;
        self.creatBtn.hidden = YES;
        UIButton *menuBtn = [self.bottomView.subviews firstObject];
        menuBtn.hidden = NO;
        self.navigationItem.leftBarButtonItem.customView.hidden = YES;
        
    }
}

- (void)bottomViewForMenuButtonClick
{
    UIButton *coverbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.coverbtn = coverbtn;
    coverbtn.frame = CGRectMake(0, -20, self.view.width, self.view.height);
    coverbtn.backgroundColor = [UIColor blackColor];
    coverbtn.alpha = 0;
    [coverbtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar insertSubview:coverbtn belowSubview:self.menuView];

    [UIView animateWithDuration:0.3 animations:^{
        self.menuView.y -= self.menuView.height;
        self.coverbtn.alpha = 0.2;
    }];
    
    ZLog(@"点击了菜单");
    
    // 友盟统计
    [MobClick event:@"bottomMenuClick"];
}

- (void)bottomViewForSettingBtnClick
{
    ZSettingTableViewController *vc = [[ZSettingTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *settingVc = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.title = @"设置";
    UIButton *completeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [completeBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    completeBtn.frame = CGRectMake(0, 0, 40, 20);
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:completeBtn];
    [self presentViewController:settingVc animated:YES completion:^{
        ZLog(@"弹出了设置控制器");
    }];
    ZLog(@"点击了设置按钮");
}

- (void)completeBtnClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        ZLog(@"杀掉了设置控制器");
    }];
}


#pragma mark 蒙板点击事件处理
- (void)coverBtnClick
{
    [UIView animateWithDuration:0.3 animations:^{
        self.menuView.y = self.view.height - 20;
        self.coverbtn.alpha = 0;
    }];
    
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(0.3 * NSEC_PER_SEC));
    dispatch_after(when, dispatch_get_main_queue(), ^{
        [self.coverbtn removeFromSuperview];
    });
    
    ZLog(@"点击了阴影");
    
    
}


#pragma mark 添加下拉刷新
- (void)setupRefresh
{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [ZHttpTool GET:@"http://api.qdan.me/v1/list/best?count=20&page=1" parameters:nil success:^(id responseObject) {
            NSArray *statusArray = [ZStatus objectArrayWithKeyValuesArray:responseObject[@"Best"]];
            for (ZStatus *status in statusArray)
            {
                ZStatusFrame *statusFrame = [[ZStatusFrame alloc] init];
                statusFrame.status = status;
                [self.statusFrames addObject:statusFrame];
            }
            
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        } failure:^(NSError *error) {
            ZLog(@"请求数据报错：%@", error);
            [self.tableView.header endRefreshing];
        }];
        
        //        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qdan.me/v1/list/best?count=20&page=1"]];
        //
        //        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //
        //            if (connectionError) {
        //                ZLog(@"请求数据报错：%@", connectionError.localizedDescription);
        //                [self.tableView.header endRefreshing];
        //                return;
        //            }
        //
        //            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        ////            [ZStatus setupObjectClassInArray:^NSDictionary *{
        ////                return @{
        ////                         @"items" : @"ZItem"
        ////                         };
        ////            }];
        //
        //            NSArray *statusArray = [ZStatus objectArrayWithKeyValuesArray:dict[@"Best"]];
        //            for (ZStatus *status in statusArray)
        //            {
        //                ZStatusFrame *statusFrame = [[ZStatusFrame alloc] init];
        //                statusFrame.status = status;
        //                [self.statusFrames addObject:statusFrame];
        //            }
        //
        //            [self.tableView reloadData];
        //            [self.tableView.header endRefreshing];
        //        }];
    }];
}

#pragma  UITableViewDelegate UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZStatusFrame *statusF = self.statusFrames[indexPath.row];
    return statusF.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZTableViewCell *cell = [ZTableViewCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDetailViewController *vc = [[ZDetailViewController alloc] init];
    vc.statusFrame = self.statusFrames[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 懒加载
- (NSMutableArray *)statusFrames
{
    if (_statusFrames == nil)
    {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

@end
