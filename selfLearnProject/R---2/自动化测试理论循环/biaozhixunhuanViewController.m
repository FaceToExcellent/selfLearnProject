//
//  biaozhixunhuanViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/6/1.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "biaozhixunhuanViewController.h"

@interface biaozhixunhuanViewController ()
@property(nonatomic)BOOL success;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic)NSMutableArray * array;
@end

@implementation biaozhixunhuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _success = NO;
    UIButton * button = [[UIButton alloc]init];
    button.frame = CGRectMake(20, 100, 100, 100);
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(settag) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    NSArray * arr= @[@"1NSMutableArray",@"2NSMutableArray",@"3NSMutableArray",@"4NSMutableArray",@"5NSMutableArray",@"6NSMutableArray"];
    _array =[[NSMutableArray alloc]initWithArray:arr];
   
    [self chufaFor];
    
    [self queuetest];
    // Do any additional setup after loading the view.
}
-(void)chufaFor{
    do {
          static   int i=0;
         if (i<_array.count) {
             NSLog(@"_success%d",i);
             // NSString * path = [_array objectAtIndex:i];
             i= i+1;
             _success =NO;
         }else
         {
             _success =NO;
             [_timer invalidate];
             _timer = nil;
             
             NSLog(@"过程结束，timer取消");
         }
    
        
      
       
    } while (_success);
}

-(void)settag{
     NSLog(@"butonCLick");
    //这里写关闭
    //close();
    //打开是在关闭之后
    _success = YES;
    [self chufaFor];
}

-(void)queuetest{
   
   
  _timer =   [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(settag) userInfo:nil repeats:YES];
    
  //  [[NSRunLoop  mainRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    
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
