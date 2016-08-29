//
//  XYViewController.h
//  testApp3
//
//  Created by fisher_xia on 16/8/25.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textField1;
@property (strong, nonatomic) IBOutlet UITextField *textField2;
@property (nonatomic,strong) UIButton *loginButton;

-(void)login:(UIButton *)btn;
-(void)addView1;

@end
