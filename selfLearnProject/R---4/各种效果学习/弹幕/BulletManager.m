//
//  BulletManager.m
//  selfLearnProject
//
//  Created by HYZ on 17/7/5.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "BulletManager.h"
#import "BulletView.h"
@interface BulletManager()
//数据来源
@property(nonatomic,strong)NSMutableArray * datasouce;
//弹幕使用过程中的数组变量
@property(nonatomic,strong)NSMutableArray * bulletComments;
//存储弹幕View的数组变量
@property(nonatomic,strong)NSMutableArray * bulletViews;

@property BOOL  bStopAnimation;

@end


@implementation BulletManager
-(instancetype)init
{
    if (self = [super init]) {
        
        self.bStopAnimation = YES;
        
    }
    return self;
}
-(void)stop{
    if (self.bStopAnimation) {
        return;
    }
    self.bStopAnimation =YES;
    [self.bulletViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BulletView * view = obj;
        [view stopAnimation];
        view = nil;
    }];
    
    [self.bulletViews removeAllObjects];
}
-(void)start{
    if (!self.bStopAnimation) {
        return;
    }
    self.bStopAnimation =NO;
    [self.bulletComments removeAllObjects];
    [self.bulletComments addObjectsFromArray:self.datasouce];
    
    [self initBulletComment];
}

//初始化弹幕随机分配弹幕轨迹
-(void)initBulletComment{
    
    NSMutableArray * trajectorys =[NSMutableArray arrayWithArray:@[@(0),@(1),@(2),@(3),@(4),@(5),@(6),@(7),@(8)]];
    for (int i =0; i<9; i++) {
        if (self.bulletComments.count>0) {
            //通过随机数获取弹幕的轨迹
            NSInteger index = arc4random()%trajectorys.count;
            int trajectory = [[trajectorys objectAtIndex:index]intValue];
            [trajectorys removeObjectAtIndex:index];
            
            //从弹幕数组中逐一取出弹幕数据
            NSString * comment = [self.bulletComments firstObject];
            [self.bulletComments removeObjectAtIndex:0];
            //创建弹幕View
            [self creatBulletView:comment trajectory:trajectory];

        }
        
           }
    
}
-(void)creatBulletView:(NSString*)comment trajectory:(int)trajectory
{
    if (self.bStopAnimation) {
        return;
    }
    
    BulletView * view = [[BulletView alloc]initWithComment:comment];
    view.trajectory = trajectory;
    [self.bulletViews addObject:view];
    __weak typeof (view)weakview = view;
    __weak typeof (self)myself = self;
    view.moveStatusBlock =^(MoveStatus status){
        if (self.bStopAnimation) {
            return ;
        }
        switch (status) {
            case Start:{
               //弹幕开始进入屏幕 将View 加入弹幕管理中
                [myself.bulletViews addObject:weakview];
            }
                
                break;
            case Enter:{
                //弹幕完全飞入屏幕
                //判断是否还有内容
                NSString * comment = [myself nextComment];
                if (comment) {
                    [myself creatBulletView:comment trajectory:trajectory];
                }
                
            }
                
                break;
            case End:{
                //弹幕完全飞出屏幕后
                if ([myself.bulletViews containsObject:weakview]) {
                    [weakview stopAnimation];
                    [myself.bulletViews removeObject:weakview];
                }
                
                if (myself.bulletViews.count == 0) {
                    //屏幕上没有弹幕了
                    self.bStopAnimation = YES;
                    [myself start];
                }
                
            }
                
                break;
            default:
                break;
        }
        
    };
    
    if (self.genertateViewBlock) {
        self.genertateViewBlock(view);
    }
    
}

-(NSString*)nextComment{
    if (self.bulletComments.count ==0) {
        return nil;
    }
    NSString * comment = [self.bulletComments firstObject];
    if (comment) {
        //removeObject 会把内容一样的做为一个个对象
        [self.bulletComments removeObjectAtIndex:0];
    }
    
    return comment;
}


-(NSMutableArray *)datasouce
{
    if(!_datasouce){
        _datasouce = [NSMutableArray arrayWithArray:  @[@"弹幕111111",@"弹幕2",@"弹幕3333333333",@"弹幕44",@"弹幕55",@"弹幕666",@"弹幕777",@"弹幕888",@"弹幕999",@"_datasouce弹幕111111",@"_datasouce弹幕2",@"_datasouce弹幕3333333333",@"_datasouce弹幕44",@"_datasouce弹幕55",@"_datasouce弹幕666",@"_datasouce弹幕777",@"_datasouce弹幕888",@"_datasouce弹幕999",@"rray弹幕111111",@"rray弹幕2",@"rray弹幕3333333333",@"rray弹幕44",@"rray弹幕55",@"rray弹幕666",@"rray弹幕777",@"rray弹幕888",@"rray弹幕999",]];
        
    }
    return _datasouce;
}
-(NSMutableArray *)bulletComments
{
    if(!_bulletComments){
        _bulletComments = [NSMutableArray arrayWithCapacity:4];
        
    }
    return _bulletComments;
}
-(NSMutableArray *)bulletViews
{
    if(!_bulletViews){
        _bulletViews = [NSMutableArray arrayWithCapacity:4];
        
    }
    return _bulletViews;
}
@end
