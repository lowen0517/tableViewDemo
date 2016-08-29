//
//  XYViewController.m
//  testApp3
//
//  Created by fisher_xia on 16/8/25.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import "XYViewController.h"
#import "TableViewController1.h"
#import "TableViewController2.h"
@interface XYViewController () <UITextFieldDelegate>

@end

@implementation XYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textField1.delegate = self;
    _textField2.delegate = self;

    // Do any additional setup after loading the view from its nib.
    
    CGRect loginButtonRect=CGRectMake(10, 340, 300, 25);
    _loginButton=[[UIButton alloc]initWithFrame:loginButtonRect];
    //设置标题内容颜色
    [_loginButton setTitleColor:[UIColor colorWithRed:178/255.0 green:34/255.0 blue:34/255.0 alpha:1] forState:UIControlStateNormal];
    //设置按钮标题
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    //添加点击事件
    [_loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    //或者直接设置控制器title（例如[self setTitle:@"Friends"]）
    self.navigationItem.title=@"主页";

    //设置导航栏右侧按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"注册"  style:UIBarButtonItemStyleDone target:self action:@selector(addView1)];
    
}
// 这个方法是UITextFieldDelegate协议里面的
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    NSLog(@"textFieldShouldReturn the keyboard *** %@ ",theTextField.text);
    if (theTextField == self.textField1 || self.textField2) {
        //这句代码可以隐藏 键盘
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)login:(UIButton *)btn{
    TableViewController2 *tableViewC2=[[TableViewController2 alloc]init];
    [self.navigationController pushViewController:tableViewC2 animated:YES];
    
}

-(void)addView1{
    //通过push导航到另外一个子视图
    TableViewController1 *tableViewC1=[[TableViewController1 alloc]init];
    [self.navigationController pushViewController:tableViewC1 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
