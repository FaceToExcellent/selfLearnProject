//
//  testModel.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "testModel.h"
#import "NSObject+Runtime.h"
@interface testModel()
{
    int    age;
    BOOL   sex;
    NSInteger  realage;
    NSString * name;
    NSArray * femliy;
}

@property (nonatomic, strong) NSArray *privateProperty;

@end
@implementation testModel
+ (void)load
{
    [testModel swapClassMethod:@selector(classMethod:) currentMethod:@selector(myClassMethod:)];
    [testModel swapMethod:@selector(publicMethod:) currentMethod:@selector(myPublicMethod:)];
}

+ (void)myClassMethod:(NSString *)param
{
    //这里调用的实际上是classMethod的实现
    [self myClassMethod:param];
    
     NSLog(@"%@ -- %s",param,__FUNCTION__);
}

- (void)myPublicMethod:(NSString *)param
{
    //这里调用的实际上是publicMethod的实现
    [self myPublicMethod:param];
    
    NSLog(@"%@ -- %s",param,__FUNCTION__);
}

+ (void)classMethod:(NSString *)param;
{
     NSLog(@"%@ -- %s",param,__FUNCTION__);
}

- (void)publicMethod:(NSString *)param;
{
    NSLog(@"%@ -- %s",param,__FUNCTION__);
}

- (void)privateMethod
{
    
}



@end
