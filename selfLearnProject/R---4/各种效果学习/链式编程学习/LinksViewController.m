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
    self.view.backgroundColor = [UIColor whiteColor];
    _littleDragon = [[dragonView alloc]init];
    
    [self demo9];
}
-(void)demo9{
    [[_littleDragon jump4:^(float metter) {
        NSLog(@"我看你可以跳%.2f米",metter);
    }]play4:^(NSString *something) {
        NSLog(@"一起去玩%@",something);
    }];
}
-(void)demo8{
    [[_littleDragon jump3:^{
        NSLog(@"我可以跳10000米高");
    }]play3:^{
        NSLog(@"play 飞机");
    }];
}
-(void)demo7{
    [_littleDragon jump:^{
         NSLog(@"我来控制输出什么");
    }];
    [_littleDragon play:^{
        NSLog(@"我来决定玩什么");
    }];
    
    [_littleDragon jump2:^(float metter) {
        NSLog(@"被控制要跳%.2f米",metter);
    }];
    [_littleDragon play2:^(NSString *something) {
         NSLog(@"被要求玩%@",something);
    }];
    
}
-(void)demo6{
    _littleDragon.eat6(@"apple").eat6(@"banana").run6(100);
}
-(void)demo5{
    _littleDragon.eat5().eat5().run5();
}
-(void)demo4{
    _littleDragon.eat4();
    _littleDragon.run4();
}
-(void)demo3{
    [[[_littleDragon eat3:@"apple"]eat3:@"banana"]run3:10000];
    
}
-(void)demo2{
    [[_littleDragon eat2]run2];
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
