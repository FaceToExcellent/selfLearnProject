//
//  runlooponeViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "runlooponeViewController.h"

@interface runlooponeViewController ()

@end

@implementation runlooponeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   //默认加入runloop
//   [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerclick) userInfo:nil repeats:YES]
//    ;
    
     NSLog(@"runloop");
  NSTimer * timer=   [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerclick) userInfo:nil repeats:YES];
    //默认mode
    //NSDefaultRunLoopMode
    //UITrackingRunLoopMode 有UI事件交互的时候才会触发
    //NSRunLoopCommonModes   仅仅是个占位符 （在以上两种模式下）
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
  //  button 并不能影响runloop
//    UIButton * but = [[UIButton alloc]init];
//    but.frame = CGRectMake(50, 100, 200, 100);
//    [but setBackgroundColor:[UIColor grayColor]];
//    [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchDragInside];
//    [self.view addSubview:but];
}
-(void)butClick{
   // NSLog(@"UITrackingRunLoopMode -- ");
}
-(void)timerclick{
  //  static int num = 0;
    //主线程输出
   // NSLog(@"%@ %d",[NSThread currentThread],num++);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
