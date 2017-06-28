//
//  NSObject+Runtime.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>
@implementation NSObject (Runtime)
+(NSArray*)fetchIvarList{
    unsigned int count = 0;
    Ivar * ivarList  = class_copyIvarList(self, &count);
    NSMutableArray * mutableList = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i=0 ; i<count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char * ivarName = ivar_getName(ivarList[i]);
        const char * ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"type"] = [NSString stringWithUTF8String:ivarType];
        dic[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        
        [mutableList addObject:dic];
    }
    
    free(ivarList);
    
    
    
    return [NSArray arrayWithArray:mutableList];
}
@end
