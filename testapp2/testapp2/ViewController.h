//
//  ViewController.h
//  testapp2
//
//  Created by fisher_xia on 16/8/23.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,strong) IBOutlet UITextField *userName;
@property (nonatomic,strong) IBOutlet UITextField *userPassword;

-(IBAction)login:(UIButton *)btn;

@end

