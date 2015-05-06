//
//  MyData.h
//  表格折叠效果
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyData : NSObject
{
    NSMutableArray *_array;//每组的数据
    BOOL _isShow;          //组的状态，yes显示组，no不显示组
    NSString *_name;       //组名
}
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) BOOL isShow;
@end
