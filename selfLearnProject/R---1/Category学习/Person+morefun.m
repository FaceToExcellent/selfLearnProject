//
//  Person+morefun.m
//  selfLearnProject
//
//  Created by HYZ on 2020/4/21.
//  Copyright © 2020 HYZ. All rights reserved.
//

#import "Person+morefun.h"

@implementation Person (morefun)
//Category is implementing a method which will also be implemented by its primary class
-(void)run2{
    //如果主要类里面写了这个方法 会有以上警告
    //如果相同会放到一起  haha, eat, run, run, speak,
    //如果不一样 就是按顺序 run2, haha, eat, run, speak,
}

-(void) haha{
    
}
@end
