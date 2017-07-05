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

@end


@implementation BulletManager

-(void)stop{
    
}
-(void)start{
    [self.bulletComments removeAllObjects];
    [self.bulletComments addObjectsFromArray:self.datasouce];
    
    [self initBulletComment];
}

//初始化弹幕随机分配弹幕轨迹
-(void)initBulletComment{
    
    NSMutableArray * trajectorys =[NSMutableArray arrayWithArray:@[@(0),@(1),@(2)]];
    for (int i =0; i<3; i++) {
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
    
    BulletView * view = [[BulletView alloc]initWithComment:comment];
    view.trajectory = trajectory;
    [self.bulletViews addObject:view];
    __weak typeof (view)weakview = view;
    __weak typeof (self)myself = self;
    view.moveStatusBlock =^{
       //移除屏幕后销毁弹幕
        [weakview stopAnimation];
        [myself.bulletViews removeObject:weakview];
    };
    
    if (self.genertateViewBlock) {
        self.genertateViewBlock(view);
    }
    
}


-(NSMutableArray *)datasouce
{
    if(!_datasouce){
        _datasouce = [NSMutableArray arrayWithArray:  @[@"弹幕111111",@"弹幕2",@"弹幕3333333333"]];
        
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
