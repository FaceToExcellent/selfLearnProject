//
//  SecondViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic)BOOL success;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.VCClassNameArray = @[@"socketlearnViewController",@"biaozhixunhuanViewController",@"AVFoudationlearnViewController",@"AVLearn2ViewController",@"CAGradientLearnViewController"];
    self.VCClasstitleArray = @[@"socket学习",@"标志循环",@"点读机",@"视频",@"文字渐变"];
    // Do any additional setup after loading the view.
    //[self sortQueue];
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
