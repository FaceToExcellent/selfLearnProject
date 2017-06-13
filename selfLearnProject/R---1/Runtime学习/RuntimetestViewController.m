//
//  RuntimetestViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/18.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "RuntimetestViewController.h"
#import "Person.h"
@interface RuntimetestViewController ()


@end

@implementation RuntimetestViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //归档
    Person * p = [[Person alloc]init];
    p.name = @"化玖";
    p.age  = @"-25year";
    p.weight = @"55kg";
    
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"runtime.测试"];
    
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    
    [self read];
    
}
-(void)read{
    //解档
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"runtime.测试"];
    Person * p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"\n未来女儿的名字--%@\n距离18岁的时间--%@\n体重--%@",p.name,p.age,p.weight);
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
