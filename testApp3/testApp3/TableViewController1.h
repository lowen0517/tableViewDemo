//
//  TableViewController1.h
//  testApp3
//
//  Created by fisher_xia on 16/8/25.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController1 : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewWithXib;

@end
