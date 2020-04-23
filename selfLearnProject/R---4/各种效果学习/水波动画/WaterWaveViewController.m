//
//  WaterWaveViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/29.
//  Copyright © 2017年 HYZ. All rights reserved.
//
#import "WaterWaveView.h"
#import "WaterWaveViewController.h"
#import "Masonry.h"
@interface WaterWaveViewController ()

@end

@implementation WaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
   
    
    UIView * backview  = [[UIView alloc]init];
    backview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backview];
    [backview  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10) ;
        
    }];
    
    
    
    
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
