//
//  dragonView.h
//  selfLearnProject
//
//  Created by HYZ on 17/7/10.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dragonView : UIView
-(void)eat;
-(void)run;

-(dragonView*)eat2;
-(dragonView*)run2;

-(dragonView*)eat3:(NSString*)food;
-(dragonView*)run3:(float)metter;


-(void(^)())eat4;
-(void(^)())run4;

- (dragonView*(^)())eat5;
- (dragonView*(^)())run5;


- (dragonView*(^)(NSString*food))eat6;
- (dragonView*(^)(float metter))run6;


-(void)jump:(void(^)())block;
-(void)play:(void(^)())block;

-(void)jump2:(void(^)(float metter))block;
-(void)play2:(void(^)(NSString* something))block;

-(dragonView*)jump3:(void(^)())block;
-(dragonView*)play3:(void(^)())block;

-(dragonView*)jump4:(void(^)(float metter))block;
-(dragonView*)play4:(void(^)(NSString* something))block;

-(void(^)(float metter,void(^)(float metter)))jump5;
-(void(^)(NSString *str,void(^)(NSString*str)))play5;

-(dragonView*(^)(float metter,void(^)(float metter)))jump6;
-(dragonView*(^)(NSString *str,void(^)(NSString*str)))play6;

@end
