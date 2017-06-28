//
//  dogModel.h
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dogModel : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, strong) NSDictionary *info;
@property (nonatomic, strong) dogModel *sondog;
@end
