//
//  combineViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/15.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "combineViewController.h"
#import "ReactiveObjC.h"//不能智能提示

@interface combineViewController ()
@property(nonatomic,strong) UITextField * field ;
@property(nonatomic,strong) UITextField * field2 ;
@property(nonatomic,strong) UIButton    * loginbutton;
@end

@implementation combineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _field = [[UITextField alloc]initWithFrame:CGRectMake(30, 120, 200, 30)];
    _field.backgroundColor =[UIColor grayColor];
    [self.view addSubview:_field];
    _field2 = [[UITextField alloc]initWithFrame:CGRectMake(30, 170, 200, 30)];
    _field2.backgroundColor =[UIColor grayColor];
    [self.view addSubview:_field2];
    
    
    _loginbutton =[[UIButton alloc]initWithFrame:CGRectMake(60, 220,140, 30)];
    [_loginbutton setBackgroundColor:[UIColor greenColor]];
    [_loginbutton setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:_loginbutton];
    
    [self tuple_rac];
    
}

-(void)tuple_rac{
    RACTuple * tuple = RACTuplePack(@1,@2,@3);
    RACTupleUnpack_(NSNumber * num1,NSNumber * num2,NSNumber * num3) = tuple;
    // 快速包装一个元组
    // 把包装的类型放在宏的参数里面,就会自动包装
    NSLog(@"%@ %@ %@", num1, num2, num3);
}
-(void)define_rac{
    RAC(_field,text) = _field2.rac_textSignal;
    //@weakify(self);
    [RACObserve(self, field2.rac_textSignal)subscribeNext:^(id  _Nullable x) {
      //  @strongify(self);
        NSLog(@"%@",x);
    }];
}

-(void)concat_rac{
    /*使用需求：有两部分数据：想让上部分先执行，完了之后再让下部分执行（都可获取值） ，类似于同步*/
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"上半部分数据"];
        [subscriber sendCompleted];
        return nil;
    }];
    RACSignal * signalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"下半部分数据"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal * concatSignal = [signalA concat:signalB];
    [concatSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"concatSignal%@",x);
    }];
    
}
-(void)then_rac{
    /*使用需求：有两部分数据：想让上部分先进行网络请求但是过滤掉数据，然后进行下部分的，拿到下部分数据 */
    
    RACSignal * signalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"----发送上部分请求---afn");
        [subscriber sendNext:@"上半部分"];
        [subscriber sendCompleted];
        
        return nil;
        
    }];
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // 发送请求
        NSLog(@"--发送下部分请求--afn");
        [subscriber sendNext:@"下半部分"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    
    RACSignal * thenSignal = [signalA then:^RACSignal * _Nonnull{
        return  signalB;
    }];
    [thenSignal subscribeNext:^(id  _Nullable x) {
         NSLog(@"thenSignal%@", x);
    }];
    
}
-(void)merge_rac{
    /*merge:多个信号合并成一个信号，任何一个信号有新值就会调用 ,任何一个信号请求完成都会被订阅到 */
    RACSubject * subjA = [RACSubject subject];
    RACSubject  *subjB =[RACSubject subject];
    RACSignal * mergeSignal =[subjA merge:subjB];
    [mergeSignal subscribeNext:^(id  _Nullable x) {
         NSLog(@"%@", x);
    }];
    // 发送信号---交换位置则数据结果顺序也会交换
    [subjA sendNext:@"上部分"];
    [subjB sendNext:@"下部分"];
    
}
-(void)zipWith_rac{
    /*使用场:当一个界面多个请求的时候，要等所有请求完成才更新UI*/
    RACSubject * subjA =[RACSubject subject];
    RACSubject * subjB = [RACSubject subject];
    RACSignal* zipsignal = [subjA zipWith:subjB];
    [zipsignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x); //所有的值都被包装成了元组
    }];
    
    //发送信号 交互顺序，元组内元素的顺序不能变，跟发送的顺序无关，而是跟压缩的顺序有关[signalA zipWith:signalB]---先是A后是B
    [subjA sendNext:@"A"];
    [subjB sendNext:@"B"];
    
}

-(void)combineLatest_rac{
    RACSignal * comsignal = [RACSignal combineLatest:@[_field.rac_textSignal,_field2.rac_textSignal] reduce:^id _Nullable(NSString *account, NSString *pwd){
        //reduce里的参数一定要和combineLatest数组里的一一对应。 
        return @(account.length&&pwd.length);
        
    }];
    
    RAC(self.loginbutton,enabled) = comsignal;
    
}

@end
