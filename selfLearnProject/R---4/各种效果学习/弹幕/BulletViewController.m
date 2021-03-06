//
//  BulletViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/7/5.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "BulletViewController.h"
#import "BulletView.h"
#import "BulletManager.h"
@interface BulletViewController ()
@property(nonatomic,strong)BulletManager * Manager;
@end

@implementation BulletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Manager = [[BulletManager alloc]init];
    __weak typeof (self)myself = self;
    self.Manager.genertateViewBlock = ^(BulletView *view){
        
        [myself addBulletView:view];
    };
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:@"start" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 10, 40, 40);
    [btn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * stop = [UIButton buttonWithType:UIButtonTypeCustom];
    [stop setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [stop setTitle:@"stop" forState:UIControlStateNormal];
    stop.frame = CGRectMake(160, 10, 40, 40);
    [stop addTarget:self action:@selector(clickstop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stop];
}

-(void)clickstop{
    [self.Manager stop];
}
-(void)clickButton{
    [self.Manager start];
    
}


-(void)addBulletView:(BulletView*)view{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    view.frame = CGRectMake(width, 100+view.trajectory*50, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
    [self.view addSubview:view];
    [view startAnimation];
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
