//
//  UIButton+ClickBlock.h
//  selfLearnProject
//
//  Created by HYZ on 17/6/29.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^clickBlock) (void);
@interface UIButton (ClickBlock)
@property(nonatomic,copy) clickBlock click;
@end
