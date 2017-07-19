//
//  myNode.h
//  selfLearnProject
//
//  Created by HYZ on 2017/7/19.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myNode : NSObject
@property(nonatomic) id data;
@property(nonatomic,strong)myNode * head;
@property(nonatomic,strong)myNode * next;


-(void)createLinkList:(NSMutableArray*)dataArray;
-(void)outputLinkList;

@end
