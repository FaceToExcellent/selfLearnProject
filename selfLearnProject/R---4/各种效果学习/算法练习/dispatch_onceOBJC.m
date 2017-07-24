//
//  dispatch_onceOBJC.m
//  selfLearnProject
//
//  Created by HYZ on 2017/7/24.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "dispatch_onceOBJC.h"

@implementation dispatch_onceOBJC
static dispatch_onceOBJC * share = nil;
+(dispatch_onceOBJC*)shareManager{
    static dispatch_once_t once = 0;
    dispatch_once(&once, ^{
       
        share  =[[super allocWithZone:NULL]init];
    });
    return share;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self shareManager];
}

@end
