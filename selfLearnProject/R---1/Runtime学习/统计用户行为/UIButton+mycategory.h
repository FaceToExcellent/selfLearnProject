//
//  UIButton+mycategory.h
//  selfLearnProject
//
//  Created by HYZ on 17/6/15.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (mycategory)
//获取button的点击次数
@property (nonatomic, assign) NSInteger btnClickedCount;

@property (nonatomic, copy) void (^currentActionBlock)() ;

@end
