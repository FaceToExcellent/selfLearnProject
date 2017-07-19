//
//  LinkViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/7/19.
//  Copyright © 2017年 HYZ. All rights reserved.
//
#import "myNode.h"
#import "LinkViewController.h"

@interface LinkViewController ()

@end

@implementation LinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * data = [[NSMutableArray alloc]init];
    
    NSArray * arr = @[@"第一节",@"第二节",@"第三节",@"第4节",@"第5节",@"第6节"];
    
    [data addObjectsFromArray:arr];
    
    myNode * nodelist =[[myNode alloc]init];
    [nodelist createLinkList:data];
    [nodelist outputLinkList];
    
    
    
    // Do any additional setup after loading the view.
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
