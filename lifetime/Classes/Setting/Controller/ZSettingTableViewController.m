//
//  ZSettingTableViewController.m
//  lifetime
//
//  Created by ZHUYN on 15/5/8.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZSettingTableViewController.h"
#import "MJExtension.h"
#import "ZCellData.h"
#import <MessageUI/MessageUI.h>

@interface ZSettingTableViewController () <MFMailComposeViewControllerDelegate>

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *cellDataArray;

@end

@implementation ZSettingTableViewController

- (NSArray *)dataArray
{
    if (_dataArray == nil)
    {
        _dataArray = @[
                        @[
                            @{
                                @"text": @"修改个人信息",
                                @"accessoryType": @(UITableViewCellAccessoryDisclosureIndicator),
                              },
                            @{
                                @"text": @"修改密码",
                                @"accessoryType": @(UITableViewCellAccessoryDisclosureIndicator),
                              },
                            @{
                                @"text": @"退出登录",
                              }
                          ],
                        @[
                            @{
                                @"text": @"清除缓存",
                              }
                          ],
                        @[
                            @{
                                @"text": @"意见反馈",
                                @"detailText": @"support@qdan.me"
                              },
                            @{
                                @"text": @"评价我们",
                              },
                            @{
                                @"text": @"服务条款",
                                @"accessoryType": @(UITableViewCellAccessoryDisclosureIndicator),
                              },
                            @{
                                @"text": @"关于",
                                @"detailText": @"0.1.1",
                                @"accessoryType": @(UITableViewCellAccessoryDisclosureIndicator),
                              }
                          ]
                       ];
    }
    return _dataArray;
}

- (NSArray *)cellDataArray
{
    if (_cellDataArray == nil)
    {
        _cellDataArray = [ZCellData objectArrayWithKeyValuesArray:self.dataArray];
    }
    return _cellDataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.cellDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section)
    {
        case 0:
            return 3;
            break;
            
        case 1:
            return 1;
            break;
            
        default:
            return 4;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *settingCellID = @"settingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingCellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:settingCellID];
    }
    
    // Configure the cell...
    ZCellData *cellData = self.cellDataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = cellData.text;
    cell.detailTextLabel.text = cellData.detailText;
    cell.accessoryType = cellData.accessoryType;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 56;
            break;
            
        case 1:
            return 30;
            break;
            
        default:
            return 30;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"帐号：";
            break;
            
        case 1:
            return @"设置";
            break;
            
        case 2:
            return @"支持";
            break;
            
        default:
            return nil;
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ((indexPath.section == 2) && (indexPath.row == 1))
//    {
////        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms://itunes.apple.com/cn/app/id967710424?mt=8"]]];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id967710424?mt=8"]]];
//    }
    
    switch (indexPath.section)
    {
        case 0:
            switch (indexPath.row) {
                case 0:
                    ZLog(@"修改个人信息");
                    break;
                case 1:
                    ZLog(@"修改密码");
                    break;
                case 2:
                    ZLog(@"退出登录");
                    break;
                default:
                    break;
            }
            break;
            
        case 1:
            ZLog(@"清除缓存");
            break;
            
        case 2:
            switch (indexPath.row) {
                case 0:
                    ZLog(@"意见反馈");
                    [self feedback];
                    break;
                case 1:
                    ZLog(@"评价我们");
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id967710424?mt=8"]]];
                    break;
                case 2:
                    ZLog(@"服务条款");
                    break;
                case 3:
                    ZLog(@"关于");
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
}

- (void)feedback
{
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];     //创建邮件controller
    mailPicker.mailComposeDelegate = self;  //设置邮件代理
    [mailPicker setSubject:@"Send WebView ScreenShot"]; //邮件主题
    
    [mailPicker setToRecipients:[NSArray arrayWithObjects:@"zhuynchn@163.com", @"2427070954@qq.com", nil]]; //设置发送给谁，参数是NSarray
    //   [mailPicker setCcRecipients:[NSArray arrayWithObject:@"zhuqil@163.com"]]; //可以添加抄送
    // [mailPicker setBccRecipients:[NSArray arrayWithObject:@"secret@gmail.com"]];
    
    [mailPicker setMessageBody:@"WebShotScreen n in Attachment!" isHTML:NO];     //邮件主题
    UIImage *viewImage = [UIImage imageNamed:@"3"];
    NSData *imageData = UIImagePNGRepresentation(viewImage);//这里获取截图存入NSData，用于发送附件
    
    [mailPicker addAttachmentData:imageData mimeType:@"image/png" fileName:@"WebScreenShot"];//发送附件的NSData，类型，附件名
    
    [self presentViewController:mailPicker animated:YES completion:nil]; //把当前controller变为邮件controller
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result                  error:(NSError*)error
{
    switch (result){
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled…");
            break;
            
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved…");
            break;
            
        case MFMailComposeResultSent:
            NSLog(@"Mail sent…");
            break;
            
        case MFMailComposeResultFailed:
            NSLog(@"Mail send errored: %@…", [error localizedDescription]);
            break;
            
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
