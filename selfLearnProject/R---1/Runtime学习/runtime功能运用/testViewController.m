//
//  testViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "testViewController.h"
#import "testModel.h"
#import "NSObject+Runtime.h"
@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self demo7];
    
}

-(void)demo7{
    //方法调换成功
    [testModel classMethod:@"class---class"];
   
}
-(void)demo6{
    //添加进去了 但是不能直接调用
    [testModel addMethod:@selector(functionmyselfadded) methodImp:@selector(functionmyselfadded)];
    NSArray * arr = [testModel  fetchInstanceMethodList];
    NSLog(@"fetchInstanceMethodList---%@",arr);
}
-(void)demo5{
    NSArray * arr = [testModel  fetchProtocolList];
    NSLog(@"fetchProtocolList---%@",arr);
}
-(void)demo4{
    NSArray * arr = [testModel  fetchClassMethodList];
    NSLog(@"fetchClassMethodList---%@",arr);
}

-(void)demo3{
    NSArray * arr = [testModel  fetchInstanceMethodList];
    NSLog(@"fetchInstanceMethodList---%@",arr);
}
-(void)demo1{
    NSArray * arr = [testModel  fetchIvarList];
    NSLog(@"fetchIvarList---%@",arr);
    
}

-(void)demo2{
    NSArray * arr1 = [testModel fetchPropertyList];
    
    NSLog(@"fetchPropertyList---%@",arr1);
}


-(void)functionmyselfadded{
    NSLog(@"这个方法是我自己添加的");
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
