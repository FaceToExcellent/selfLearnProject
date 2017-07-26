//
//  TaskViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/7/26.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "TaskViewController.h"
#import "iCarousel.h"
@interface TaskViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong) iCarousel * carousle;
@property(nonatomic,assign) CGSize tasksize;
@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat taskWidth = SCREEN_WIDTH*5.0/7.0;
    
    self.tasksize = CGSizeMake(taskWidth, taskWidth*16.0/9.0);
    [self.view setBackgroundColor:[UIColor grayColor]];
    self.carousle =[[iCarousel alloc]initWithFrame:BOUNDS];
    [self.view addSubview:_carousle];
    _carousle.delegate = self;
    _carousle.dataSource = self;
    [_carousle setType:iCarouselTypeCustom];
    [_carousle setBounceDistance:0.1];
    
    
    
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 10;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    UIView * taskView = view;
    if (!taskView) {
        taskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _tasksize.width, _tasksize.height)];
        
       
        
        
        UIImageView * imageView =[[UIImageView alloc]initWithFrame:taskView.bounds];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [imageView setBackgroundColor:[UIColor whiteColor]];
        UILabel * label = [[UILabel alloc]initWithFrame:taskView.frame];
        [label setText:[@(index) stringValue]];
        [label setFont:[UIFont systemFontOfSize:50]];
        [label setTextAlignment: NSTextAlignmentCenter];
        label.textColor = [UIColor blackColor];
        
        [taskView.layer setShadowPath:[UIBezierPath bezierPathWithRoundedRect:imageView.frame cornerRadius:5.0f].CGPath];
        
        [taskView.layer setShadowRadius:3.0f];
        [taskView.layer setShadowColor:[UIColor blackColor].CGColor];
        [taskView.layer setShadowOffset:CGSizeZero];
        
     
        CAShapeLayer * layer =[CAShapeLayer layer];
        [layer setFrame:imageView.bounds];
        [layer setPath:[UIBezierPath bezierPathWithRoundedRect:imageView.frame cornerRadius:5.0f].CGPath];
        [imageView.layer setMask:layer];
        
        [imageView addSubview:label];
        [taskView addSubview:imageView];
    }
    
    return taskView;
}
-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    
    return CATransform3DTranslate(transform, offset*self.tasksize.width, 0, 0);
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
