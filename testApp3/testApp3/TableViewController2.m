//
//  TableViewController2.m
//  testApp3
//
//  Created by fisher_xia on 16/8/25.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import "TableViewController2.h"

@interface TableViewController2()

@end

@implementation TableViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
// Do any additional setup after loading the view.
    _tableView2=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:235/255.0 blue:205/255.0 alpha:1];
    //初始化数据
    [self initData];
    //指定委托
    [_tableView2 setDelegate:self];
    //指定数据委托
    [_tableView2 setDataSource:self];
    //加载tableview
    [self.view addSubview:_tableView2];

}

- (void)initData{
    //初始化数据
    _dataArray1 = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    
    _dataArray2 = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", @"d", nil];
    
    _dataArray  = [[NSMutableArray alloc] initWithObjects:_dataArray1, _dataArray2, nil];
    
    _titleArray = [[NSMutableArray alloc] initWithObjects:@"组一", @"组二", nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//指定高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
    
}

//制定个性标题。

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero ];
    //改变标题的颜色，也可用图片
    [view setBackgroundColor:[UIColor brownColor]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    label.textColor = [UIColor redColor];
    
    label.backgroundColor = [UIColor clearColor];
    
    label.text = [_titleArray objectAtIndex:section];
    
    [view addSubview:label];
    
    return view;
    
}

//指定有多少个分区(Section)，默认为1

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //返回标题数组中元素的个数来确定分区的个数
    return [_titleArray count];
    
}

//指定每个分区中有多少行，默认为1

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取dataArray中的元素，并根据每个元素（数组）来判断分区中的行数。
    return [[_dataArray objectAtIndex:section] count];
    
}

//绘制Cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    static NSString *cellIdentifier = @"Cell";
    
    //初始化cell并指定其类型，也可自定义cell
    
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:cellIdentifier];
    
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
        //取出dataArray中每个分区所对应的元素（数组），并通过其来取值。
        [[cell textLabel] setText:[[_dataArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]];
        //返回cell
    
    return cell;
    
}

//改变行的高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
}

//返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{

    return _titleArray;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //创建弹出窗口
    NSString *str = [[_dataArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
     UIAlertController *alertview=[UIAlertController alertControllerWithTitle:@"提示"
                                                                      message:str
                                                               preferredStyle:UIAlertControllerStyleAlert ];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    //UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"destructive" style:UIAlertActionStyleDestructive handler:nil];
    [alertview addAction:cancel];
    [alertview addAction:defult];

//显示（AppDelegate.h里使用self.window.rootViewController代替self）
    
    [self presentViewController:alertview animated:YES completion:nil];

}
//支持编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if(indexPath.section == 1){
            [_dataArray2 removeObjectAtIndex:indexPath.row];
        }
        if(indexPath.section == 0){
            [_dataArray1 removeObjectAtIndex:indexPath.row];
        }
        //[_dataArray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [_tableView2 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
//保存数据
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    //当点击了第二个按钮（OK）
//    if (buttonIndex==1) {
//        UITextField *textField= [alertView textFieldAtIndex:0];
//        //修改模型数据
//        //KCContactGroup *group=_contacts[_selectedIndexPath.section];
//        //KCContact *contact=group.contacts[_selectedIndexPath.row];
//        //contact.phoneNumber=textField.text;
//        //刷新表格
//        [_tableView2 reloadData];
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
