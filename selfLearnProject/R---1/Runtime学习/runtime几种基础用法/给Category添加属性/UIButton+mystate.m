//
//  UIButton+state.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/29.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "UIButton+mystate.h"
#import <objc/runtime.h>
static NSString * stateKey = @"stateKey";
@implementation UIButton (mystate)


-(BOOL)Mystate
{
    return objc_getAssociatedObject(self, @selector(Mystate));
}

-(void)setMystate:(BOOL)Mystate
{
     objc_setAssociatedObject(self, @selector(Mystate), stateKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
