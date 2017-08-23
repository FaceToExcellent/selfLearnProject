//
//  QQAppController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/23.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "QQAppController.h"
#import "AppDelegate.h"
#import "WRNavigationBar.h"

#define NAVBAR_COLORCHANGE_POINT -80
#define IMAGE_HEIGHT 260
#define SCROLL_DOWN_LIMIT 100
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)
@interface QQAppController ()

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UIImageView * imgView;



@end

@implementation QQAppController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"qq应用";
    self.tableView.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT -64, 0, 0, 0);
    
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
