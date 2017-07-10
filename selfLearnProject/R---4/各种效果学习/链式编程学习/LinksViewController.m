//
//  LinksViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/7/10.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "LinksViewController.h"
#import "dragonView.h"
@interface LinksViewController ()
@property(nonatomic,strong)dragonView * littleDragon;
@end

@implementation LinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _littleDragon = [[dragonView alloc]init];
    
    [self demo1];
}
-(void)demo1{
    
    [_littleDragon eat];
    [_littleDragon run];
    
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
