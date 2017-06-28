//
//  NSObject+Runtime.h
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)
/** 获取类的成员变量列表，其中包括属性生成的成员变量*/
+(NSArray*)fetchIvarList;
/**属性列表，包括私有和公有属性，也包括分类中的属性*/
+ (NSArray *)fetchPropertyList;
/**获取类的实例方法列表，包括getter, setter, 分类中的方法*/
+ (NSArray *)fetchInstanceMethodList;
/**获取类的类方法列表*/
+ (NSArray *)fetchClassMethodList;
/**获取协议列表*/
+ (NSArray *)fetchProtocolList;
/**给类添加方法*/
+ (void)addMethod:(SEL)methodSel methodImp:(SEL)methodImp;
/**将类的两个实例方法进行交换*/
+ (void)swapMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
/**将类的两个类方法进行交换*/
+ (void)swapClassMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
@end
