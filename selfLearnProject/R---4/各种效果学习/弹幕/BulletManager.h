//
//  BulletManager.h
//  selfLearnProject
//
//  Created by HYZ on 17/7/5.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BulletView.h"
@interface BulletManager : NSObject

@property(nonatomic,copy)void(^genertateViewBlock)(BulletView* view);
-(void)start;
-(void)stop;
@end
