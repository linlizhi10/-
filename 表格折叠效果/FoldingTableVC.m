//
//  FoldingTableVC.m
//  表格折叠效果
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "FoldingTableVC.h"
#import "MyData.h"
@interface FoldingTableVC ()

@end

@implementation FoldingTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //全局数据源
    _dataArray=[[NSMutableArray alloc]init];
    //添加数据
    for (int i='A'; i<='Z'; i++) {
        
        MyData *myData=[[MyData alloc]init];
        myData.name=[NSString stringWithFormat:@"%c",i];
//        if (i=='A') {
//            myData.isShow=YES;
//        }
        for (int j=0; j<10; j++) {
            [myData.array addObject:[NSString stringWithFormat:@"%c-%d",i,j]];
            
        }
        [_dataArray addObject:myData];
    }
    _myTableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.rowHeight=30;
    [self.view addSubview:_myTableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [_dataArray count];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MyData *data=[_dataArray objectAtIndex:section];
    if ([data isShow]) {
        return [[data array] count];
    }
    else
    {
       
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strID=@"cellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:strID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
        
    }
    
    MyData *data=[_dataArray objectAtIndex:indexPath.section];
    NSString *str=[[data array]objectAtIndex:indexPath.row];
    cell.textLabel.text=str;
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MyData *myData=[_dataArray objectAtIndex:section];
    NSString *str=myData.name;
    return str;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MyData *data=[_dataArray objectAtIndex:section];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 320, 30);
    [btn setTitle:data.name forState:UIControlStateNormal];
    btn.tag=section;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    if (section%2) {
        btn.backgroundColor=[UIColor darkGrayColor];
    }
    else
    {
        btn.backgroundColor=[UIColor lightGrayColor];
    }
    return btn;
}
-(void)btnClick:(UIButton *)btn
{
    MyData *data=[_dataArray objectAtIndex:btn.tag];
    //改变组的显示状态
    if ([data isShow]) {
        [data setIsShow:NO];
    }
    else
    {
        [data setIsShow:YES];
    }
    [_myTableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
