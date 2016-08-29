//
//  TableViewController1.m
//  testApp3
//
//  Created by fisher_xia on 16/8/25.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import "TableViewController1.h"

@interface TableViewController1 ()

@end

@implementation TableViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:_tableViewWithXib];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:cellIdentifier];
 
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    //取出dataArray中每个分区所对应的元素（数组），并通过其来取值。
    for(NSInteger i = 0; i<10;i++){
         [[cell textLabel] setText:@"abc %d"];
    }
   
    //返回cell
    
    return cell;

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
