//
//  LoginViewModel.h
//  Runloopuse
//
//  Created by HYZ on 17/6/13.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"
@interface LoginViewModel : NSObject



@property(nonatomic,strong)RACSignal * loginEnable;

@property(nonatomic,strong)NSString * account;
@property(nonatomic,strong)NSString * pwd;

@property(nonatomic,strong)RACCommand * loginCommand;

@end
