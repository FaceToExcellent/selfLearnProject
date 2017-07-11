//
//  dragonView.m
//  selfLearnProject
//
//  Created by HYZ on 17/7/10.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "dragonView.h"

@implementation dragonView

-(void)eat
{
    NSLog(@"eat");
}

-(void)run
{
    NSLog(@"run");
}

-(dragonView*)eat2{
    [self eat];
    return self;
}
-(dragonView*)run2{
    [self run];
    return self;
}

-(dragonView*)eat3:(NSString*)food{
    NSLog(@"eat--%@",food);
    return self;
}
-(dragonView*)run3:(float)metter{
    NSLog(@"run -- %.2f metter",metter);
    return self;
}

-(void(^)())eat4{
    void(^eat4Block)() = ^(void){
        NSLog(@"eat4");
    };
    
    return eat4Block;
}
-(void(^)())run4{
    void(^run4Block)() =^(void){
        NSLog(@"run4");
    };
    return run4Block;
}


- (dragonView*(^)())eat5{
    dragonView*(^eat5Block)() =^{
        
        NSLog(@"eat5");
        return  self;
    };
    return eat5Block;
}
- (dragonView*(^)())run5{
    dragonView*(^run5Block)() =^{
        
        NSLog(@"run5");
        return  self;
    };
    return run5Block;

}



- (dragonView*(^)(NSString*food))eat6{
    dragonView*(^eat6Block)(NSString*food) = ^(NSString*food){
        NSLog(@"food6");
        return self;
    };
    return eat6Block;
}
- (dragonView*(^)(float metter))run6{
    dragonView*(^run6Block)(float metter) =^(float metter){
        NSLog(@"run6");
        return self;
    };
    return run6Block;
}
-(void)jump:(void(^)())block{
    if (block) {
        block();
    }
}
-(void)play:(void(^)())block{
    if (block) {
        block();
    }
}

-(void)jump2:(void(^)(float metter))block{
    if (block) {
        block(100);
    }
}
-(void)play2:(void(^)(NSString* something))block{
    if (block) {
        block(@"basketball");
    }
}


-(dragonView*)jump3:(void(^)())block{
    if (block) {
        block();
    }
    return self;
}
-(dragonView*)play3:(void(^)())block{
    if (block) {
        block();
    }
    return self;
}

-(dragonView*)jump4:(void(^)(float metter))block{
    if (block) {
        block(1);
    }
    return self;
}
-(dragonView*)play4:(void(^)(NSString* something))block{
    if (block) {
        block(@"打篮球");
    }
    return self;
}


-(void(^)(float metter,void(^)(float metter)))jump5{
    void(^jump5Block)(float metter,void(^)(float metter)) = ^(float metter,void(^dragonBLock)(float metter)){
        if (dragonBLock) {
            dragonBLock(metter);
        }
    };
    return jump5Block;
}
-(void(^)(NSString *str,void(^)(NSString*str)))play5{
//    void(^paly5Block)(NSString*str,void(^)(NSString*str)) = ^(NSString * str,void(^dragonBLock)(NSString*str)){
//        if (dragonBLock) {
//            dragonBLock(str);
//        }
//    };
//    return paly5Block;
    
    return ^(NSString*str,void(^dragonBLock)(NSString*str)){
        if (dragonBLock) {
            dragonBLock(str);
        }
    };
}
-(dragonView*(^)(float metter,void(^)(float metter)))jump6{
    dragonView*(^jump6Block)(float metter,void(^)(float metter)) = ^(float metter,void(^dragonBlick)(float metter)){
        if (dragonBlick) {
            dragonBlick(metter);
        }
        return self;
    };
    return jump6Block;
    
}
-(dragonView*(^)(NSString *str,void(^)(NSString*str)))play6{
    return ^(NSString *str,void(^dragonBlick)(NSString*str)){
        if (dragonBlick) {
            dragonBlick([NSString stringWithFormat:@"加一个漂亮的签名 %@",str]);
        }
        return self;
    };
}



-(dragonView*(^)(NSString* str1,NSString *str2,void(^)(NSString*str1,NSString*str2)))myfunctionn{
    
    return ^(NSString*str1,NSString *str2,void(^myBLock)(NSString*str1,NSString*str2)){
        if (myBLock) {
            myBLock([NSString stringWithFormat:@"第一个参数 %@",str1],[NSString stringWithFormat:@"第二个参数 %@",str2]);
        }
        
        return self;
    };
    
}





@end
