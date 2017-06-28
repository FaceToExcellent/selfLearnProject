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

@end
