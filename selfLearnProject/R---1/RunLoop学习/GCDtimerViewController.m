//
//  GCDtimerViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/16.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "GCDtimerViewController.h"

@interface GCDtimerViewController ()
@property(strong)dispatch_source_t  timer;
@end

@implementation GCDtimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    //定时器
  _timer =   dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_time_t start = DISPATCH_TIME_NOW;
    //此处单位是纳秒 10000000000
    dispatch_time_t interval = 1.0* NSEC_PER_SEC;
    
    dispatch_source_set_timer(_timer, start,interval , 0);
    //设置回调
    dispatch_source_set_event_handler(_timer, ^{
      //  NSLog(@"---%@---%@--",[NSRunLoop currentRunLoop],[NSThread currentThread]);
        
    });
    
    
    //启动定时器
    dispatch_resume(_timer);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
