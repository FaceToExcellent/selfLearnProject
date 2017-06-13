//
//  RAClearnViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/6/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "RAClearnViewController.h"
#import "ReactiveObjC.h"
#import "dog.h"
@interface RAClearnViewController ()
@property(nonatomic,strong)dog * d;
@property(nonatomic,strong)UILabel * dognameLabel;
@property(nonatomic,strong)UIButton * mybutton;
@end

@implementation RAClearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    [self demo7];
    
}

-(void)demo7{
    //command
    
    RACCommand *command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        //input 执行命令的内容 @"执行命令"
        
        
        return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            [subscriber sendNext:@"从命令里面发送的信号"];
            return nil;
        }];
    }];
    
   RACSignal * sig=  [command execute:@"执行命令"];
    [sig subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}

-(void)demo6{
  //RAC 的坑 --循环引用
    
    [self demo2];
   UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(30, 200, 200, 30)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:button];
    //target
   // __weak typeof (self)weakself =self;
    //在rac 中 self 绝大部分可能造成循环引用
    /*@weakify(self) @strongify(self) */
    @weakify(self)
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        //这里 x 就是button _mybutton
       // weakself.dognameLabel.text = @"柯基";
        @strongify(self)
        self.dognameLabel.text = @"柯基";
    }];
    
}
-(void)demo5{
    //通知
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil]subscribeNext:^(NSNotification * _Nullable x) {
        //这里是通知本身
        NSLog(@"程序进入后台监听--%@",x);
    }];
    
    
    
}
-(void)demo4{
    //文本框
    UITextField * field = [[UITextField alloc]initWithFrame:CGRectMake(30, 250, 200, 30)];
    field.backgroundColor =[UIColor grayColor];
    [self.view addSubview:field];
    
    [[field rac_textSignal]subscribeNext:^(NSString * _Nullable x) {
        //这里 x 是field 的内容
        NSLog(@"%@",x);
    }];
    
}
-(void)demo3{
    
    _mybutton =[[UIButton alloc]initWithFrame:CGRectMake(30, 200, 200, 30)];
    [_mybutton setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:_mybutton];
    //target
    [[_mybutton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        //这里 x 就是button _mybutton
        [x setBackgroundColor:[UIColor redColor]];
    }];
    
    
    
}

-(void)demo2{
    
    _dognameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 150, 300, 50)];
    _dognameLabel.textColor = [UIColor blackColor];
    _dognameLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_dognameLabel];
    
    
    
    //KVO 这里不需要移除观察者
    self.d =[[dog alloc]init];
    [RACObserve(self.d, name)subscribeNext:^(id  _Nullable x) {
        _dognameLabel.text = x;
    }];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.d.name =[NSString stringWithFormat:@"dog's name is %d",arc4random_uniform(100)];
}

-(void)demo1{
    // RACSignal
    //1。创建信号 冷信号
    //创建信号的时候  1.创建了一个 RACDynamicSignal
    //2.保存了 didSubscribe
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"信号创建");
        //3发送信号
        //nextBlock 执行
        [subscriber sendNext:@"this is a signal"];
        
        NSLog(@"发送了信号");
        return nil;
    }];
    
    //2订阅信号 热信号
    //nextBlock copy
    //didSubscribe 执行
    [signal subscribeNext:^(id  _Nullable x) {
        //x 信号的内容
        NSLog(@"%@",x);
        NSLog(@"信号订阅");
    }];
    
    //创建信号，必须订阅 要想订阅要先发送
}
  


@end
