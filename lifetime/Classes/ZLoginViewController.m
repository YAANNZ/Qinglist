//
//  ZLoginViewController.m
//  lifetime
//
//  Created by ZHUYN on 15/8/2.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import "ZLoginViewController.h"
#import "MobClick.h"

@interface ZLoginViewController ()

@property (nonatomic,weak) UITextField *emailTextField;
@property (nonatomic,weak) UITextField *passwordTextField;

@end

@implementation ZLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubViews];
}

#pragma mark - 添加子控件
- (void)setupSubViews
{
    UIImageView *bgImageV = [[UIImageView alloc] initWithFrame:self.view.frame];
    bgImageV.image = [UIImage imageNamed:@"init_bg"];
    bgImageV.userInteractionEnabled = YES;
    [self.view addSubview:bgImageV];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginBtn.size = [UIImage imageNamed:@"login_btn"].size;
    loginBtn.x = (self.view.width - loginBtn.width) / 2;
    loginBtn.y = self.view.height / 2 - loginBtn.height;
    [bgImageV addSubview:loginBtn];
    
    UIImageView *textFieldBgImageV = [[UIImageView alloc] init];
    textFieldBgImageV.image = [UIImage imageNamed:@"login_form"];
    textFieldBgImageV.size = textFieldBgImageV.image.size;
    textFieldBgImageV.x = (self.view.width - textFieldBgImageV.width) / 2;
    textFieldBgImageV.y = loginBtn.y - 22 - textFieldBgImageV.height;
    textFieldBgImageV.userInteractionEnabled = YES;
    [bgImageV addSubview:textFieldBgImageV];
    
    UITextField *emailTextField = [[UITextField alloc] init];
    self.emailTextField = emailTextField;
    emailTextField.frame = CGRectMake(5, 0, textFieldBgImageV.width - 10, textFieldBgImageV.height / 2);
    emailTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_icon_email"]];
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.placeholder = @"邮箱";
    emailTextField.backgroundColor = [UIColor clearColor];
    [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [textFieldBgImageV addSubview:emailTextField];
    
    UITextField *passwordTextField = [[UITextField alloc ] init];
    self.passwordTextField = passwordTextField;
    passwordTextField.frame = CGRectMake(5, emailTextField.height, emailTextField.width, emailTextField.height);
    passwordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_icon_passwd"]];;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.placeholder = @"密码";
    passwordTextField.backgroundColor = [UIColor clearColor];
    [textFieldBgImageV addSubview:passwordTextField];
    
    UIImageView *logoImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"init_logo"]];
    logoImageV.x = (self.view.width - logoImageV.width) / 2;
    logoImageV.y = textFieldBgImageV.y - logoImageV.height;
    [bgImageV addSubview:logoImageV];
    
    UIButton *afterLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    afterLogin.frame = CGRectMake(loginBtn.x, loginBtn.y + loginBtn.height + 22, loginBtn.width, loginBtn.height);
    [afterLogin setTitle:@"暂不登录" forState:UIControlStateNormal];
    [afterLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [afterLogin addTarget:self action:@selector(afterLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageV addSubview:afterLogin];
}

#pragma mark - 登录按钮点击事件处理
- (void)loginBtnClick:(UIButton *)loginButton
{
    // 检测是否输入了邮箱
    
    // 友盟统计
    NSDictionary *dict = @{@"username" : self.emailTextField.text, @"password" : self.passwordTextField.text};
    [MobClick event:@"login" attributes:dict];
}

#pragma mark - 暂不登录按钮点击事件的处理
- (void)afterLoginClick:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
