//
//  NSObject+KeyValues.h
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyValues)
+(id)objectWithKeyValues:(NSDictionary *)aDictionary;

-(NSDictionary *)mykeyValuesWithObject;
@end
