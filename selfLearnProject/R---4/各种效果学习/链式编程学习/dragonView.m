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



@end
