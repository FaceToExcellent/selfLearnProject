//
//  cat.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "cat.h"
@implementation cat

-(void)eat{
    NSLog(@"本喵吃饱了，喵~");
}
-(void)speak:(NSString*)name{
    NSLog(@"喵咪怎么叫，miao喵miao~%@",name);
}
-(void)run{
    NSLog(@"run,喵run");
}

-(void)showSizeWithWidth:(float)aWidth andHeight:(float)aHeight{
    NSLog(@"size is %.2f * %.2f",aWidth, aHeight);
}

-(float)getHeight{
    return 18.5f;
}

-(NSString *)getInfo{
    return @"Hi, my name is miao, I'm 1 years old in the year, I like fish, nice to meet you.";
}



@end
