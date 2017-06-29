//
//  UIButton+ClickBlock.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/29.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "UIButton+ClickBlock.h"
#import <objc/runtime.h>

static const void * assoicatedKey = "associatedKey";
@implementation UIButton (ClickBlock)
-(void)setClick:(clickBlock)click
{
    objc_setAssociatedObject(self, assoicatedKey, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    if (click) {
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(clickBlock)click
{
    return  objc_getAssociatedObject(self, assoicatedKey);
}

-(void)buttonClick{
    if (self.click) {
        self.click();
    }
}
@end
