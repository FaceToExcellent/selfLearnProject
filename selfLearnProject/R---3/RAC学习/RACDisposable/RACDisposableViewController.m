//
//  RACDisposableViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/7/14.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "RACDisposableViewController.h"
#import "ReactiveObjC.h"//不能智能提示
@interface RACDisposableViewController ()

@end

@implementation RACDisposableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"I'm send next data"];
        return [RACDisposable disposableWithBlock:^{
             NSLog(@"disposable");
        }];
        
    }];
  
    RACDisposable * disposable =[signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [disposable dispose];
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
