//
//  categorylearnVC.m
//  selfLearnProject
//
//  Created by HYZ on 2020/4/21.
//  Copyright © 2020 HYZ. All rights reserved.
//

#import "categorylearnVC.h"
#import "Person.h"
#import "Person+morefun.h"
#import  <objc/runtime.h>
@interface categorylearnVC ()

@end

@implementation categorylearnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    Person * p = [[Person alloc]init];
    [p run];
    [self printMethodNameOfClass:  [Person class]];
    // Do any additional setup after loading the view.
}

-(void)printMethodNameOfClass:(Class)cls {
    unsigned int count;
    //获取方法数组
    Method * methodlist = class_copyMethodList(cls, &count);
    //存储方法名
    NSMutableString * methodNames = [NSMutableString string];
    //遍历所有的方法
    for(int i = 0; i< count;i++) {
        //获得方法
        Method method = methodlist[i];
        //获得方法名
        NSString * methodName = NSStringFromSelector(method_getName(method));
        
        //拼接
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
        
    }
    
    free(methodlist);
    NSLog(@"%@ %@",cls,methodNames);
}


@end
