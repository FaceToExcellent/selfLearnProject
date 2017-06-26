//
//  dayoneViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/23.
//  Copyright © 2017年 HYZ. All rights reserved.
//

@interface person:NSObject
@property(nonatomic,copy)NSString * name;
-(void)speak;
@end
@implementation person
-(void)speak{
    NSLog(@"my name's %@", self.name);
}
@end
#import "dayoneViewController.h"

@interface dayoneViewController ()

@end



@implementation dayoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self _cmdqusetion];
}


-(void)_cmdqusetion{
    id cls  =[person class];
    void * obj = &cls;
    [(__bridge id)obj speak];
    
   // 崩溃在NSLog()  此处与别人不一样 不知道原因
    
}
-(void)isKindAndMenberDefine{
    BOOL res1 = [(id)[dayoneViewController class]isKindOfClass:[backViewController class] ];
    BOOL res2 = [(id)[dayoneViewController class]isKindOfClass:[dayoneViewController class]];
    BOOL res3  = [(id)[dayoneViewController class]isMemberOfClass:[dayoneViewController class]];
    BOOL res4 = [(id)[NSObject class]isKindOfClass:[NSObject class]];
    BOOL res5 =[(id)[NSObject class]isMemberOfClass:[NSObject class]];
     NSLog(@"%d %d %d %d %d", res1, res2, res3, res4,res5);
    
    /*0 0 0 1 0*/
    
    BOOL res6 = [(id)self isKindOfClass:[dayoneViewController class]];
    BOOL res7 = [(id)self isMemberOfClass:[dayoneViewController class]];
    BOOL res8 = [(id)self isKindOfClass:[backViewController class]];
    BOOL res9 = [(id)self isMemberOfClass:[backViewController class]];
    
    NSLog(@"%d--- %d--- %d--- %d", res6, res7, res8, res9);
    /*1--- 1--- 1--- 0*/
    
    /*+ (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
     if (tcls == cls) return YES;
     }
     return NO;
     }
     
     - (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
     if (tcls == cls) return YES;
     }
     return NO;
     }
     
     + (BOOL)isMemberOfClass:(Class)cls {
     return object_getClass((id)self) == cls;
     }
     
     - (BOOL)isMemberOfClass:(Class)cls {
     return [self class] == cls;
     }*/
    
    /*上面是调用类方法 下面是调用对象方法*/
}

-(void)classandsuper{
    NSLog(@"%@",NSStringFromClass([self class]));
    NSLog(@"%@",NSStringFromClass([super class]));
    NSLog(@"%@",NSStringFromClass([self.superclass class]));
    /*  输出结果1：dayoneViewController
     输出结果2：dayoneViewController
     输出结果3：backViewController */
    
    /*在调用 [super class]的时候，runtime会去调用 objc_msgSendSuper而不是objc_Send*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
