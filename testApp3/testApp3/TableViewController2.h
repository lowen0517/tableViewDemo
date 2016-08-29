//
//  TableViewController2.h
//  testApp3
//
//  Created by fisher_xia on 16/8/25.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface TableViewController2 : UIViewController<UITableViewDataSource,UITableViewDelegate>
//
@property (strong, nonatomic)UITableView *tableView2;
//定义数据数组1
@property(strong,nonatomic) NSMutableArray *dataArray1;
//定义数据数组2
@property(strong,nonatomic) NSMutableArray *dataArray2;
//定义数组集合
@property(strong,nonatomic) NSMutableArray *dataArray;
//定义组名数组
@property(strong,nonatomic) NSMutableArray *titleArray;


@end
