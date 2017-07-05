//
//  BulletView.m
//  selfLearnProject
//
//  Created by HYZ on 17/7/5.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "BulletView.h"
#define Padding 10
@interface BulletView()
@property(nonatomic,strong)UILabel * lbComment;

@end
@implementation BulletView

//初始化弹幕
-(instancetype)initWithComment:(NSString *)comment{
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        //计算弹幕的宽度
        NSDictionary * attr = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGFloat width = [comment sizeWithAttributes:attr].width;
        self.bounds = CGRectMake(0, 0, width+ 2*Padding, 30);
        self.lbComment.text = comment;
        self.lbComment.frame = CGRectMake(Padding, 0, width, 30);
        
        
        
    }
    return self;
}
//开始动画
-(void)startAnimation{
    //根据弹幕的长度执行弹幕效果
    CGFloat screemWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat duration =4.0f;
    CGFloat wholeWidth = screemWidth + CGRectGetWidth(self.bounds);
    //弹幕开始
    if (self.moveStatusBlock) {
        self.moveStatusBlock(Start);
    }
    
    CGFloat speed = wholeWidth/duration;
    
    CGFloat enterDuration =  CGRectGetWidth(self.bounds)/speed;
    
    [self performSelector:@selector(EnterScreem) withObject:nil afterDelay:enterDuration];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(enterDuration*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//       
//    });
    
    
    __block CGRect frame = self.frame;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x -= wholeWidth;
        self.frame = frame;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        if (self.moveStatusBlock) {
            self.moveStatusBlock(End);
        }
        
    }];
    
}
-(void)EnterScreem{
    if (self.moveStatusBlock) {
        self.moveStatusBlock(Enter);
    }
}
//结束动画
-(void)stopAnimation{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
    
}


-(UILabel*)lbComment{
    if (!_lbComment) {
        _lbComment = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbComment.font = [UIFont systemFontOfSize:14];
        _lbComment.textColor = [UIColor whiteColor];
        _lbComment.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbComment];
        
    }
    
    return _lbComment;
}
@end
