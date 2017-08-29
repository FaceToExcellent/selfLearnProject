//
//  WaterWaveView.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/29.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "WaterWaveView.h"

@implementation WaterWaveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


-(void)setupUI{
    //初始化
    self.waveSpeed = 0.1;
    self.waveAmlitude = 3;
    self.waveWidth = 2.5* M_PI/self.bounds.size.width;
    self.waveHeight = self.frame.size.height/2;
    
    self.firstShapeLayer = [CAShapeLayer layer];
    self.firstShapeLayer.fillColor =  [UIColor colorWithRed:255 / 255 green:255 / 255 blue:255 / 255 alpha:0.5].CGColor;
    [self.layer addSublayer:self.firstShapeLayer];
    
    
    self.sencondShapeLayer = [CAShapeLayer layer];
    self.sencondShapeLayer.fillColor = [UIColor colorWithRed:255 / 255 green:255 / 255 blue:255 / 255 alpha:0.5].CGColor;
    [self.layer addSublayer:self.sencondShapeLayer];
    
    
    self.waveDisplayLink =  [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
     [self.waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)getCurrentWave{
   
    self.offsetX += self.waveSpeed;
    //
    
    /**
     
     第一条线
     */
    
    CGMutablePathRef firstPath = CGPathCreateMutable();
    CGPathMoveToPoint(firstPath, nil, 0, self.waveHeight);
    CGFloat firstY = self.bounds.size.height /2;
    for (float x= 0.f; x<=self.bounds.size.width; x++) {
        firstY = self.waveAmlitude * sin(self.waveWidth *x + _offsetX)+self.waveHeight;
        CGPathAddLineToPoint(firstPath, nil, x, firstY);
        
        
    }
    
    CGPathAddLineToPoint(firstPath, nil, self.bounds.size.width,self.frame.size.height);
    CGPathAddLineToPoint(firstPath, nil, 0, self.frame.size.height);
    
    //结束绘图
    CGPathCloseSubpath(firstPath);
    self.firstShapeLayer.path = firstPath;
    CGPathRelease(firstPath);
    
    
    /**
     
     第二条线
     */
    
    CGMutablePathRef secondPath = CGPathCreateMutable();
    CGPathMoveToPoint(secondPath, nil, 0, self.waveHeight+100);
    CGFloat secondY = self.bounds.size.height/2;
    for (float x= 0.f; x<=self.bounds.size.width; x++) {
        secondY = self.waveAmlitude * sin(_waveWidth * x+ _offsetX -self.bounds.size.width/2)+self.waveHeight;
        CGPathAddLineToPoint(secondPath, nil, x, secondY);
        
    }
    
    CGPathAddLineToPoint(secondPath, nil, self.bounds.size.width, self.frame.size.height);
    CGPathAddLineToPoint(secondPath, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(secondPath);
    self.sencondShapeLayer.path = secondPath;
    
    CGPathRelease(secondPath);
    
    
}



-(void)setWaveColor:(UIColor *)waveColor
{
    _waveColor = waveColor;
    
    self.firstShapeLayer.fillColor = waveColor.CGColor;
    
    self.sencondShapeLayer.fillColor = waveColor.CGColor;
}



- (void)destroy
{
    [self.waveDisplayLink invalidate];
    self.firstShapeLayer = nil;
    self.sencondShapeLayer = nil;
    self.waveDisplayLink = nil;
}
































@end
