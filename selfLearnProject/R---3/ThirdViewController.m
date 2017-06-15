//
//  ThirdViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "ThirdViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.VCClassNameArray = @[@"RAClearnViewController",@"RACAndMVVMlearnViewController",@"RACSignalHandleViewController",@"refreshwithRACViewController",@"combineViewController",@"RACSequenceViewController"];
    self.VCClasstitleArray = @[@"RAC",@"RAC+MVVM",@"RAC信号处理",@"RAC实现上下拉加载",@"RAC合并操作",@"RACSequence序列"];
    
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
