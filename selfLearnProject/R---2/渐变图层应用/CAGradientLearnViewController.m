//
//  CAGradientLearnViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/6/2.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "CAGradientLearnViewController.h"

@interface CAGradientLearnViewController ()
@property(nonatomic,strong)CAGradientLayer *gradientLayer;
@end

@implementation CAGradientLearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    UILabel * lable = [[UILabel alloc]init];
    lable.text = @"CAGradientLearnViewController.h";
    [lable sizeToFit];
    lable.center = CGPointMake(140, 100);
    /*
     // 疑问：label只是用来做文字裁剪，能否不添加到view上。
     // 必须要把Label添加到view上，如果不添加到view上，label的图层就不能调用drawRect方法绘制文字，也就没有文字裁剪了。
     // 如何验证，自定义Label,重写drawRect方法，看是否调用,发现不添加上去，就不能调用
*/
    [self.view addSubview:lable];
    
    
    //创建渐变层颜色
   _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = lable.frame;
    //设置渐变层的颜色，随机颜色渐变
    _gradientLayer.colors = @[(id)[self randomColor].CGColor,(id)[self randomColor].CGColor,(id)[self randomColor].CGColor];
    /* // 疑问:渐变层能不能加在label上
     // 不能，mask原理：默认会显示mask层底部的内容，如果渐变层放在mask层上，就不能显示了*/
    
    //添加渐变层到控制器的View层
    [self.view.layer addSublayer:_gradientLayer];
    /* // mask层工作原理:按照透明度裁剪，只保留非透明部分，文字就是非透明的，因此除了文字，其他都被裁剪掉，这样就只会显示文字下面渐变层的内容，相当于留了文字的区域，让渐变层去填充文字的颜色。*/
    //设置渐变层的剪裁
    _gradientLayer.mask = lable.layer;
    /*  // 注意:一旦把label层设置为mask层，label层就不能显示了,会直接从父层中移除，然后作为渐变层的mask层，且label层的父层会指向渐变层，这样做的目的：以渐变层为坐标系，方便计算裁剪区域，如果以其他层为坐标系，还需要做点的转换，需要把别的坐标系上的点，转换成自己坐标系上点，判断当前点在不在裁剪范围内，比较麻烦。*/
    //父层改了，坐标也就改了，需要重新设置label的位置，才能正确的设置剪裁区域
    lable.frame = _gradientLayer.bounds;
    //利用定时器，快速改变颜色，就有颜色变化了
//    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(textcolorChange)];
//    
//    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [NSTimer scheduledTimerWithTimeInterval:.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self textcolorChange];
    }];
    
}

-(void)textcolorChange{
    _gradientLayer.colors =  @[(id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor];
}
-(UIColor*)randomColor{
    
    CGFloat r= arc4random_uniform(256)/255.0;
    CGFloat g= arc4random_uniform(256)/255.0;
    CGFloat b= arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
