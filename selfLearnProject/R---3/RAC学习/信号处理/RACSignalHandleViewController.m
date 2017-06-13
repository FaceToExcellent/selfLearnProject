//
//  RACSignalHandleViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/6/13.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "RACSignalHandleViewController.h"
#import "ReactiveObjC.h"//不会智能提示
@interface RACSignalHandleViewController ()

@end

@implementation RACSignalHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Map_rac];
}

-(void)signal{
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"signal"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@", x);
    }error:^(NSError * _Nullable error) {
        NSLog(@"error = %@", error);
    }completed:^{
        NSLog(@"completed");

    }];
}

-(void)Map_rac{
    //文本框
    UITextField * field = [[UITextField alloc]initWithFrame:CGRectMake(30, 70, 200, 30)];
    field.backgroundColor =[UIColor grayColor];
    [self.view addSubview:field];
    
   [[ field.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
       NSLog(@"field.text -- %@", value);
       return value;
    }]subscribeNext:^(id  _Nullable x) {
        field.text = x;
        
        NSLog(@"field.text.lenght--%ld",field.text.length);
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
