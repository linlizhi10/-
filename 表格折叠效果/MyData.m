//
//  MyData.m
//  表格折叠效果
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "MyData.h"

@implementation MyData
-(id)init
{
    self=[super init];
    if (self) {
        _array=[[NSMutableArray alloc]init];
        _isShow=NO;
    }
    return self;
}
@end
