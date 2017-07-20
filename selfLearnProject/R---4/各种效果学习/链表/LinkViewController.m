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
@property(nonatomic)  myNode * nodelist;
@end

@implementation LinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * data = [[NSMutableArray alloc]init];
    
    NSArray * arr = @[@"第一节",@"第二节",@"第三节",@"第4节",@"第5节",@"第6节"];
    
    [data addObjectsFromArray:arr];
    
     _nodelist =[[myNode alloc]init];
    [_nodelist createLinkList:data];
  //  [_nodelist outputLinkList];
    

    
   // [self demo3];
    
    NSMutableArray * arr1 = [[NSMutableArray alloc]initWithArray:@[@1,@2,@4]];
    myNode * node1 = [[myNode alloc]init];
    [node1 createLinkList:arr1];
    
  //  [node1 outputLinkList];
    
    NSMutableArray * arr2 = [[NSMutableArray alloc]initWithArray:@[@3,@5,@7]];
    myNode * node2 = [[myNode alloc]init];
    [node2 createLinkList:arr2];
    
   // [node2 outputLinkList];

    
}

-(void)demo3{
    myNode * reversenode = [_nodelist reverseList:_nodelist];
    // NSLog(@"倒序链表%@",reversenode);
    
    [reversenode outputLinkList];
}
-(void)demo2{
    
   myNode * node =  [_nodelist findTheNodeAtindex:4];
    NSLog(@"找到的是%@",node.data);
    
}
-(void)demo1{
    myNode * node = [[myNode alloc]init];
    //node.data = [arr objectAtIndex:2];
    node.data = @"node";
    [_nodelist deletemynode:node];
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
