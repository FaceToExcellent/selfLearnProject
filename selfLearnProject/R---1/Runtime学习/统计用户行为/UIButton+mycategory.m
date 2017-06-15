//
//  UIButton+mycategory.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/15.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "UIButton+mycategory.h"
#import <objc/runtime.h>
#import <objc/message.h>

/*OBJC_ASSOCIATION_ASSIGN    指定关联对象的弱引用
 OBJC_ASSOCIATION_RETAIN_NONATOMIC  指定关联对象的强引用,这个关联不是原子性的
 OBJC_ASSOCIATION_COPY_NONATOMIC  指定复制关联的对象,这个关联不是原子性的
 OBJC_ASSOCIATION_RETAIN  指定关联对象的强引用,这个关联是原子性的
 OBJC_ASSOCIATION_COPY  指定复制关联的对象,这个关联是原子性的*/
NSString * const fy_btnClickedCountKey = nil;
NSString * const fy_btnCurrentActionBlockKey = nil;

@implementation UIButton (mycategory)
+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //SEL是selector在Objc中的表示类型
        SEL origilaSEL = @selector(addTarget:action:forControlEvents:);
        SEL hookSEL = @selector(fy_addTarget:action:forControlEvents:);
        
        //交换方法
        //class_getInstanceMethod获取对象方法,class_getClassMethod获取类方法
        Method origilalMethod = class_getInstanceMethod(self, origilaSEL);
        Method hookMethod = class_getInstanceMethod(self, hookSEL);
        
        //可以直接用这一句交换不用下面的方法
      //  method_exchangeImplementations(origilalMethod, hookMethod);
        
        
        /**
         动态添加方法
         
         @param self 给哪个类添加方法
         @param origilaSEL 添加方法的方法编号(方法名字)
         @param self 实现这个方法的函数
         @param origilaSEL 一个定义该函数返回值类型和参数类型的字符串
         @return <#return value description#>
         */
        class_addMethod(self, origilaSEL, class_getMethodImplementation(self, origilaSEL), method_getTypeEncoding(origilalMethod));
        class_addMethod(self, hookSEL, class_getMethodImplementation(self, hookSEL), method_getTypeEncoding(hookMethod));
        
        method_exchangeImplementations(class_getInstanceMethod(self, origilaSEL), class_getInstanceMethod(self, hookSEL));
        
    });
}

- (void)fy_addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    __weak typeof(target) weakTarget = target;
    __weak typeof(self) weakSelf  = self;
    
    //利用 关联对象 给UIButton 增加了一个 block
    if (action) {
        
        [self  setCurrentActionBlock:^{
            @try {
                //这句话啥意思 不懂
                ((void (*)(void *, SEL,  typeof(weakSelf) ))objc_msgSend)((__bridge void *)(weakTarget), action , weakSelf);
            } @catch (NSException *exception) {
            } @finally {
            }
            
        }];
    }
    
    //发送消息 其实是本身  要执行的action 先执行，写下来的 fy_clicked:方法
    //为什么这么写而不是用官方的方法呢?因为经过上面的方法交换,下面的这个方法已经相当于系统的addTarget方法了,如果再使用addTarget那么是无法使用系统的方法了
    [self fy_addTarget:self action:@selector(fy_clicked:) forControlEvents:controlEvents];
}

//拦截了按钮点击后要执行的代码
- (void)fy_clicked:(UIButton *)sender{
    //统计 在这个方法中执行想要操作的
    
    self.btnClickedCount++;
    
    NSLog(@"%@ 点击 %ld次 ",[sender titleForState:UIControlStateNormal], self.btnClickedCount);
    
    //执行原来要执行的方法
    sender.currentActionBlock();
}

//增加一个 block 关联UIButton
- (void)setCurrentActionBlock:(void (^)())currentActionBlock{
    
    objc_setAssociatedObject(self, &fy_btnCurrentActionBlockKey, currentActionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())currentActionBlock{
    return objc_getAssociatedObject(self, &fy_btnCurrentActionBlockKey);
}

#pragma mark -统计
//在分类中增加了 btnClickedCount的 (setter 和 getter）方法，使用关联对象增加了相关的成员空间,注意这里的名字必须符合苹果那一套命名规则
- (NSInteger)btnClickedCount{
    //根据关联的key获取到关联的值
    id tmp = objc_getAssociatedObject(self, &fy_btnClickedCountKey);
    NSNumber *number = tmp;
    return number.integerValue;
}


- (void)setBtnClickedCount:(NSInteger)btnClickedCount{
    
    /**
     添加关联
     
     @param self 给哪个对象添加关联
     @param fy_btnClickedCountKey 关联的key,通过这个key获取
     @param btnClickedCount 关联的值
     @param OBJC_ASSOCIATION_ASSIGN关联的策略
     @return <#return value description#>
     */
    objc_setAssociatedObject(self, &fy_btnClickedCountKey, @(btnClickedCount), OBJC_ASSOCIATION_ASSIGN);
}

@end
