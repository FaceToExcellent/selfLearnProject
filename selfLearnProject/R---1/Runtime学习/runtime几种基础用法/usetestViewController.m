//
//  usetestViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//
#import "cat.h"
#import "dogModel.h"
#import "NSObject+KeyValues.h"
#import "UIButton+ClickBlock.h"
#import "UIButton+mystate.h"
#import "Monkey.h"

#import "usetestViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface usetestViewController ()

@end

@implementation usetestViewController{
    NSDictionary *dictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dictionary = @{
                   @"name":@"doubao",
                   @"age":@4,
                   @"height":@18.5,
                   @"info":@{
                           @"address":@"zhongguo",
                           },
                   @"son":@{
                           @"name":@"keji",
                           @"info":@{
                                   @"address":@"zhongguo",
                                   },
                           }
                   };

//    [self demo2];
//     [self demo3];
    
    [self demo6];
}
-(void)demo6{
    Monkey *monkey = [[Monkey alloc]init];
    ((void (*)(id,SEL))objc_msgSend)(monkey,sel_registerName("fly"));
}
-(void)demo5{
    //这个功能不错
    UIButton *  button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 40);
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    button.Mystate = YES;//增加一个状态 在需要时有用
    button.click = ^{
        NSLog(@"buttonCLick click");
    };
}
-(void)demo4{
    //这种方式有点多余 并不高明
      dogModel *model = [dogModel objectWithKeyValues:dictionary];
    NSLog(@"model%@",model.name);
}

-(void)demo3{
    //解档
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"runtimedog"];
     dogModel * p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
     NSLog(@"\n未来狗狗的名字--%@,%@",p.name,p.age);
    
}
-(void)demo2{
    
    //归档
    
    dogModel * dog = [[dogModel alloc]init];
    
    dog.name = @"柯基";
    dog.age = @1;
    dog.phoneNumber = @"12345678901";
    
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"runtimedog"];
    
    [NSKeyedArchiver archiveRootObject:dog toFile:filePath];
    
}

-(void)demo1{
    
    
    cat * any = [[cat  alloc]init];
    
    ((void (*)(id,SEL))objc_msgSend)(any,sel_registerName("eat"));
    ((void (*)(id,SEL,NSString*))objc_msgSend)(any,sel_registerName("speak:"),@"anycat");
    ((void (*)(id,SEL,float,float))objc_msgSend)(any,sel_registerName("showSizeWithWidth:andHeight:"),10.0f,100.0f);
    float f = ((float (*)(id,SEL))objc_msgSend)(any,sel_registerName("getHeight"));
    NSLog(@"height is %.2f",f);
    NSString * info = ((NSString* (*)(id,SEL))objc_msgSend)(any,sel_registerName("getInfo"));
    NSLog(@"%@",info);
    
    
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
