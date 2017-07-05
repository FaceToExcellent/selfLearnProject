//
//  backViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "backViewController.h"

@interface backViewController ()

@end

@implementation backViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /************************实现导航不透明，视图自动下移64*********************************/
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"image"] forBarMetrics:UIBarMetricsDefault];
    /**********************************************************/
    
     [self setupLeftBarButton];
    
    
}
#pragma mark - 自定义返回按钮
- (void)setupLeftBarButton {
    // 自定义 leftBarButtonItem ，UIImageRenderingModeAlwaysOriginal 防止图片被渲染
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]                                              style:UIBarButtonItemStylePlain                                              target:self action:@selector(leftBarButtonClick)];
    // 防止返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate
    = (id<UIGestureRecognizerDelegate>)self;
}
#pragma mark - 返回按钮的点击事件
- (void)leftBarButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotate
{
    return NO;
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
