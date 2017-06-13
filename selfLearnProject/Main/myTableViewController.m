//
//  myTableViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "myTableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"


@interface myTableViewController ()

@end

@implementation myTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary * attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    
    NSMutableDictionary * selectedAttr =[NSMutableDictionary dictionary];
    selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttr[NSForegroundColorAttributeName]=[UIColor redColor];
    
    UITabBarItem * item =[UITabBarItem appearance];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    
    FirstViewController * fvc = [[FirstViewController alloc]init];
    UINavigationController * nvc1 = [[UINavigationController alloc]initWithRootViewController:fvc];
    [self setChildVC:nvc1 title:@"第一" image:@"TabBar_me_boy_23x23_" seletedImage:@"TabBar_me_boy_selected_23x23_"];
    
    
    SecondViewController * vc2 = [[SecondViewController alloc]init];
    UINavigationController * nvc2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    [self setChildVC:nvc2 title:@"第二" image:@"TabBar_gift_23x23_" seletedImage:@"TabBar_gift_selected_23x23_"];
    
    ThirdViewController * vc3 = [[ThirdViewController alloc]init];
    UINavigationController * nvc3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    [self setChildVC:nvc3 title:@"第三" image:@"TabBar_category_23x23_" seletedImage:@"TabBar_category_Selected_23x23_"];
    
    FourthViewController * vc4 = [[FourthViewController alloc]init];
    UINavigationController * nvc4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    [self setChildVC:nvc4 title:@"第四" image:@"TabBar_home_23x23_" seletedImage:@"TabBar_home_selected_23x23_"];
    
    

    
  
}


-(void)setChildVC:(UINavigationController*)vc title:(NSString*)title image:(NSString*)image seletedImage:(NSString*)seletedImage{
    vc.tabBarItem.title =title;
    UIImage * image1 = [UIImage imageNamed:image];
    image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.image =image1;
    //必须这样才能保持原色
    UIImage * image2 = [UIImage imageNamed:seletedImage];
    image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage =image2;
    
    vc.view.backgroundColor =[UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0  blue:arc4random_uniform(100)/100.0  alpha:1.0];
    [self addChildViewController:vc];
    
    
     self.tabBar.translucent = NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
