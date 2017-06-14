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
    self.view.backgroundColor = [UIColor whiteColor];
    [self delay_rac];
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

-(void)Filter_rac{
    
    UITextField * field = [[UITextField alloc]initWithFrame:CGRectMake(30, 120, 200, 30)];
    field.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:field];
    
    [[field.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return  [value length] > 4;
    }]subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
}
-(void)take_rac{
    /*take 2就是获取前两个信号，skip 2就是跳过前两个。repeat是重复发送信号。*/
    /*相似的还有takeLast takeUntil takeWhileBlock skipWhileBlock skipUntilBlock repeatWhileBlock都可以根据字面意思来理解*/
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"1"];
        [subscriber sendNext:@"2"];
        [subscriber sendNext:@"3"];
        [subscriber sendNext:@"4"];
        [subscriber sendNext:@"5"];
        [subscriber sendCompleted];

        return nil;
    }]take:2]subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }completed:^{
        NSLog(@"completed");
    }];
}


-(void)delay_rac{
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"delay"];
        [subscriber sendCompleted];
        return nil;
    }]delay:2]subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
