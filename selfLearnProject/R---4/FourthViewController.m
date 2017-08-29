//
//  FourthViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.VCClassNameArray = @[@"BulletViewController",@"LinksViewController",@"MathViewController",@"LinkViewController",@"ProducerConsumerViewController",@"TaskViewController",@"LearnQuartz2DViewController",@"NavBarLearnViewController",@"WaterWaveViewController"];
    self.VCClasstitleArray = @[@"弹幕",@"链式编程学习",@"算法",@"链表",@"生产者消费者",@"仿iOS9任务管理器",@"学习Quartz2D",@"各种导航学习",@"水波动画"];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
