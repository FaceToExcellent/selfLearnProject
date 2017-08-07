//
//  SortViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/7.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UISegmentedControl *countSegmentControl;
@property (nonatomic, strong) UISegmentedControl *orderSegmentControl;
@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * reloadButton =[[UIButton alloc]init];
    reloadButton.frame = CGRectMake(20, 20, 100, 30);
    reloadButton.backgroundColor = [UIColor blueColor];
    [reloadButton setTitle:@"重置" forState:UIControlStateNormal];
    [reloadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:reloadButton];
    [reloadButton addTarget:self action:@selector(onReset) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * sortButton =[[UIButton alloc]init];
    sortButton.frame = CGRectMake(200, 20, 100, 30);
    sortButton.backgroundColor = [UIColor blueColor];
    [sortButton setTitle:@"排序" forState:UIControlStateNormal];
    [sortButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:sortButton];
    [sortButton addTarget:self action:@selector(onSort) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.segmentControl.frame = CGRectMake(8, 70, SCREEN_WIDTH-16, 30);
    
    self.countSegmentControl.frame =CGRectMake(8, 115, SCREEN_WIDTH-16, 30);
    self.orderSegmentControl.frame = CGRectMake(8, 160, SCREEN_WIDTH-16, 30);
    
    
      [self onReset];
    
}

-(void)onReset{
    
}

-(void)onSort{
    
}


- (void)onSegmentControlChanged:(UISegmentedControl *)segmentControl {
    [self onReset];

}

- (void)countSegmentControlChanged:(UISegmentedControl *)segmentControl{
    
    
}

- (void)orderSegmentControlChanged:(UISegmentedControl *)segmentControl{
    
    
}
#pragma mark Getter && Setter
-(UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"选择", @"冒泡", @"插入",@"归并", @"快速", @"双路", @"三路", @"堆排"]];
        _segmentControl.selectedSegmentIndex = 0;
        [_segmentControl addTarget:self action:@selector(onSegmentControlChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_segmentControl];
    }
    
    return _segmentControl;
}
-(UISegmentedControl *)countSegmentControl
{
    if (!_countSegmentControl) {
        _countSegmentControl =[[UISegmentedControl alloc]initWithItems:@[@"5", @"10",@"20", @"50",@"100"]];
        _countSegmentControl.selectedSegmentIndex =4;
        [_countSegmentControl addTarget:self action:@selector(countSegmentControlChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_countSegmentControl];
    }
    return  _countSegmentControl;
}

-(UISegmentedControl *)orderSegmentControl
{
    if (!_orderSegmentControl) {
        _orderSegmentControl = [[UISegmentedControl alloc]initWithItems:@[@"乱序", @"近乎有序", @"大量重复元素"]];
        _orderSegmentControl.selectedSegmentIndex = 0;
        [_orderSegmentControl addTarget:self action:@selector(orderSegmentControlChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_orderSegmentControl];
        
    }
    
    return _orderSegmentControl;
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
