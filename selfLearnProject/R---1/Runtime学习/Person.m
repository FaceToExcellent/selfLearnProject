//
//  Person.m
//  Runloopuse
//
//  Created by HYZ on 17/5/18.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    Ivar *ivars = class_copyIvarList([Person class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        //归档
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
        
    }
    
    free(ivars);
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int count;
        Ivar *ivars = class_copyIvarList([Person class], &count);
        for (int i = 0; i<count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            //解档
            id value =   [aDecoder decodeObjectForKey:key];
            [self setValue:value forKeyPath:key];
            
        }
        free(ivars);
    }
    return self;
}

@end
