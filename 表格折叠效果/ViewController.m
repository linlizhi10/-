//
//  ViewController.m
//  表格折叠效果
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "ViewController.h"
#import "FoldingTableVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    FoldingTableVC *fold=[[FoldingTableVC alloc]init];
    [self presentViewController:fold animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
