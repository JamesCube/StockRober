//
//  testAPI.m
//  Rober
//
//  Created by Hanxun on 17/2/6.
//  Copyright © 2017年 Hanxun. All rights reserved.
//

#import "testAPI.h"
#import "Rober-Swift.h"

@implementation testAPI



#pragma mark 使用Swift方法

- (void)useSwiftMethod {
    
    testSwift * wigt = [[testSwift alloc] init];
    NSLog(@"%@", wigt.returnSwiftName);
}


- (void)testOC
{
    NSLog(@"我是OC文件");
}


@end
