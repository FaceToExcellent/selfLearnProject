//
//  WaterWaveView.h
//  selfLearnProject
//
//  Created by HYZ on 2017/8/29.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterWaveView : UIView
/**水波速度**/
@property(nonatomic,assign)CGFloat waveSpeed;

/**
 水波振幅
 
 */
@property(nonatomic,assign)CGFloat waveAmlitude;


/**
 水波颜色
 
 */
@property(nonatomic,strong)UIColor * waveColor;


/**
 水波高度
 
 */
@property(nonatomic,assign)CGFloat waveHeight;

- (void)destroy;



/**
 
 其他参数
 */

@property(nonatomic,strong)CAShapeLayer * firstShapeLayer;
@property(nonatomic,strong)CAShapeLayer *
    sencondShapeLayer;
@property(nonatomic,strong)CADisplayLink *
    waveDisplayLink;

@property(nonatomic,assign)CGFloat offsetX;
@property(nonatomic,assign)CGFloat waveWidth;





@end
