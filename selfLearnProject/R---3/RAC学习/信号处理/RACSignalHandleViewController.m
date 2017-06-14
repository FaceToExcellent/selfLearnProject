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
@property(nonatomic,strong) UITextField * field ;
@property(nonatomic,strong) UITextField * field2 ;
@property(nonatomic,strong) UIButton    * loginbutton;
@end

@implementation RACSignalHandleViewController

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
    
  
    [self flattenMap_rac];
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
     @weakify(self);
    
   [[ _field.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
       NSLog(@"field.text -- %@", value);
       return value;
    }]subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.field.text = x;
        
        NSLog(@"field.text.lenght--%ld",_field.text.length);
    }];
    
    
}

-(void)Filter_rac{
    
   
    
    [[_field.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
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
    
    NSLog(@"before --delay");
}

-(void)throttle_rac{
    /*节流，在我们做搜索框的时候，有时候需求的时实时搜索，即用户每每输入字符，view都要求展现搜索结果。这时如果用户搜索的字符串较长，那么由于网络请求的延时可能造成UI显示错误，并且多次不必要的请求还会加大服务器的压力，这显然是不合理的，此时我们就需要用到节流。*/
    [[[_field rac_textSignal]throttle:0.5]subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    /*加了节流管道，后面跟上了类型为NSTimeInterval的参数后，只有0.5S内信号不产生变化才会发送请求，这样快速的输入也不会造成多次输出。*/
    
    
}

-(void)distintUntilChanged_rac{
    /*网络请求中为了减轻服务器压力，无用的请求我们应该尽可能不发送。distinctUntilChanged的作用是使RAC不会连续发送两次相同的信号，这样就解决了这个问题。*/
    [[[_field rac_textSignal]distinctUntilChanged]subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"distintUntilChanged===%@",x);
    }];
}

-(void)timeout_rac{
    
    /*超时信号，当超出限定时间后会给订阅者发送error信号。*/
   [[[ RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       
    [[RACScheduler mainThreadScheduler]afterDelay:3 schedule:^{
        [subscriber sendNext:@"delay"];
        [subscriber sendCompleted];
        
    }];
       
       return nil;
   }]timeout:2 onScheduler:[RACScheduler mainThreadScheduler]]subscribeNext:^(id  _Nullable x) {
       NSLog(@"%@", x);
   }error:^(NSError * _Nullable error) {
       NSLog(@"%@", error);
   }];
    
    /*由于在创建信号是限定了延迟3秒发送，但是加了timeout2秒的限定，所以这一定是一个超时信号。这个信号被订阅后，由于超时，不会执行订阅成功的输出x方法，而是跳到error的块输出了错误信息。timeout在用RAC封装网络请求时可以节省不少的代码量。*/

}

-(void)ignore_rac{
    /*忽略信号，指定一个任意类型的量（可以是字符串，数组等），当需要发送信号时讲进行判断，若相同则该信号会被忽略发送。*/
    [[[_field rac_textSignal]ignore:@"good"]subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
    /*只能忽略和good完全相同的，不能忽略句中含有*/
}

-(RACSignal*)signalInButton{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:_field.text];
        [subscriber sendNext:_field2.text];
        [subscriber sendCompleted];
        
        return nil;
    }];
}
-(void)flattenMap_rac{
    
   RAC(_loginbutton,enabled)= [RACSignal combineLatest:@[_field.rac_textSignal,_field2.rac_textSignal] reduce:^id _Nullable(NSString * name,NSString* pwd){
    
       return @(name.length&&pwd.length);
        
   }];
    @weakify(self);
    [[self.loginbutton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
      @strongify(self);
        [[self signalInButton]subscribeNext:^(id  _Nullable x) {
            NSLog(@"%@",x);
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
