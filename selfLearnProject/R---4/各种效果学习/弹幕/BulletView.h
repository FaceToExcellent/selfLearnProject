//
//  BulletView.h
//  selfLearnProject
//
//  Created by HYZ on 17/7/5.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BulletView : UIView
@property(nonatomic,assign) int trajectory;//弹道
@property(nonatomic,copy) void(^moveStatusBlock)();//弹幕的状态回调
//初始化弹幕
-(instancetype)initWithComment:(NSString *)comment;
//开始动画
-(void)startAnimation;
//结束动画
-(void)stopAnimation;
@end
