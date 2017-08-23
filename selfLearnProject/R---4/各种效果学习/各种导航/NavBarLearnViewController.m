//
//  NavBarLearnViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/23.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "NavBarLearnViewController.h"

@interface NavBarLearnViewController ()

@end

@implementation NavBarLearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.VCClassNameArray = @[@"QQAppController"];
    self.VCClasstitleArray = @[@"qq应用类导航"];
    
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
