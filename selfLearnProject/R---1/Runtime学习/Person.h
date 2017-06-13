//
//  Person.h
//  Runloopuse
//
//  Created by HYZ on 17/5/18.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * age;
@property(nonatomic,strong)NSString * weight;
@end
