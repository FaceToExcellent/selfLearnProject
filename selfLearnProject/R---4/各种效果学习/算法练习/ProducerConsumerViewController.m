//
//  ProducerConsumerViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/7/25.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "ProducerConsumerViewController.h"

@interface ProducerConsumerViewController ()
@property(nonatomic,strong)NSMutableArray * arr;
@property(nonatomic,strong)NSCondition * condition;
@end

@implementation ProducerConsumerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arr = [NSMutableArray arrayWithCapacity:3];
    _condition = [[NSCondition alloc]init];
    
    //生产者
    NSThread * thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(addProduct) object:nil];
    
    [thread1 start];
    //生产者2   生产者和消费者数量不一定
    NSThread * threadx = [[NSThread alloc]initWithTarget:self selector:@selector(addProduct) object:nil];
    
    [threadx start];
    
    //消费者
    
    NSThread * thread2  =[[NSThread alloc]initWithTarget:self selector:@selector(consumerShop) object:nil];
    [thread2 start];
    
    
    
    
    
    // Do any additional setup after loading the view.
}
- (void)addProduct {
    while (true) {
        [_condition lock];
        @try {
            while (_arr.count == 10) {
                NSLog(@"库房已经满了，等待消费");
                //生产者等待，库房有空余位置
                [_condition wait];
                
            }
            
            [NSThread sleepForTimeInterval:.2];
            NSObject * obj =[[NSObject alloc]init];
            [_arr addObject:obj];
            NSLog(@"生产了一个产品，库房总数是%ld",_arr.count);
            //唤醒在此NSCondition对象上等待的单个线程 （通知消费者进行消费）
                [_condition signal];
            
        } @catch (NSException *exception) {
            NSLog(@"出现异常 %@",exception);
        } @finally {
           // NSLog(@"@finally");
            [_condition unlock];
        }
    }
    
    
}
-(void)consumerShop{
    while (true) {
        [_condition lock];
        @try {
            while (_arr.count ==0) {
                //生产者等待，库房有空余位置
                NSLog(@"库房已经空了，等待生产");
                [_condition wait];
            }
            [_arr removeLastObject];
            NSLog(@"消费了一个产品，库房总数是%ld",_arr.count);
            [_condition signal];
        } @catch (NSException *exception) {
             NSLog(@"出现异常 %@",exception);
        } @finally {
            //NSLog(@"@finally");
            [_condition unlock];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
























@end
