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
    return 8;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    UIView * taskView = view;
    if (!taskView) {
        taskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _tasksize.width, _tasksize.height)];
        
       
        
        
        UIImageView * imageView =[[UIImageView alloc]initWithFrame:taskView.bounds];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [imageView setBackgroundColor:[UIColor whiteColor]];
        
        UIImage * taskImage = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
        
        [imageView setImage: taskImage];
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
        
        //[imageView addSubview:label];
        [taskView addSubview:imageView];
    }
    
    return taskView;
}

//计算缩放
-(CGFloat)calcSacalewithOffset:(CGFloat)offset{
    return  offset * 0.02f +1.0f;
}

//计算位移
-(CGFloat)calcTranslationWithOffset:(CGFloat)offset{
    CGFloat z = 5.0f/4.0f;
    CGFloat a = 5.0f/8.0f;
    if (offset >= z/a) {
        return 2.0;
    }
    return 1/(z-a*offset)-1/z;
}
-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    
    CGFloat scale =[self calcSacalewithOffset:offset];
    CGFloat translation = [self calcTranslationWithOffset:offset];
    
    return CATransform3DScale(CATransform3DTranslate(transform, translation*self.tasksize.width, 0, offset), scale, scale, 1.0);
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
