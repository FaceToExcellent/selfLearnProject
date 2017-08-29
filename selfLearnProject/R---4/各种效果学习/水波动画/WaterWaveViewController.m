//
//  WaterWaveViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/29.
//  Copyright © 2017年 HYZ. All rights reserved.
//
#import "WaterWaveView.h"
#import "WaterWaveViewController.h"

@interface WaterWaveViewController ()

@end

@implementation WaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
   
    
    UIView * backview  = [[UIView alloc]initWithFrame:CGRectMake(70, 150, 200, 200)];
    backview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backview];
    
    WaterWaveView * view  = [[WaterWaveView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [backview addSubview:view];
    
    view.waveColor = [UIColor blueColor];
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = view.frame.size.width/2;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
