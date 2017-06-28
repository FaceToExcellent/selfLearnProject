//
//  testModel.h
//  selfLearnProject
//
//  Created by HYZ on 17/6/28.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface testModel : NSObject<UITextFieldDelegate>
@property (nonatomic, copy) NSString *publicProperty;


+ (void)classMethod:(NSString *)param;

- (void)publicMethod:(NSString *)param;
@end
