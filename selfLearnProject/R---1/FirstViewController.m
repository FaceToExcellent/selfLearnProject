//
//  FirstViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.VCClassNameArray = @[@"runlooponeViewController",@"runlooptwoViewController",@"GCDtimerViewController",@"imageCellTestViewController",@"RuntimetestViewController",@"testViewController",@"usetestViewController",@"categorylearnVC"];
    self.VCClasstitleArray = @[@"RunLoop初级练习",@"基础知识点整理",@"精准GCD",@"RunLoop实际应用于cell渲染",@"Runtime做归档解档",@"RunTime应用",@"基本用法",@"categorylearnVC"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
