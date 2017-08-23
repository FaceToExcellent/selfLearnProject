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
    self.tableView.frame =CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
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
