//
//  LoginViewModel.m
//  Runloopuse
//
//  Created by HYZ on 17/6/13.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel
-(instancetype)init
{
    if (self = [super init]) {
        
        [self setUP];
    }
    return self;
}
-(void)setUP{
    
    _loginEnable = [RACSignal combineLatest:@[RACObserve(self, account),RACObserve(self, pwd)] reduce:^id _Nullable(NSString*acount,NSString* pwd){
         return  @(acount.length&& pwd.length);
    }];
    
    _loginCommand= [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        //密码加密 发送请求
        NSLog(@"准备发送请求");
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            //
            [subscriber sendNext:@"请求登陆的数据"];
            [subscriber sendCompleted];//发送结束
            
            return nil;
        }];
    }];
    //执行命令
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    //监听命令
    [[_loginCommand.executing skip:1]subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            NSLog(@"正在等待--");
        }else
        {
            NSLog(@"--移除等待画面");
        }
    }];

}
@end
