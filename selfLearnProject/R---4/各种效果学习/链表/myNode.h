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

//链表的性能绝大情况下不如数组；

//创建链表
-(void)createLinkList:(NSMutableArray*)dataArray;
//输出链表
-(void)outputLinkList;

//在O(1)时间删除链表结点
-(void)deletemynode:(myNode*)currentnode;

//找到链表中---倒数----第k个结点   (n-k+1)个节点
-(myNode*)findTheNodeAtindex:(NSInteger)K;


@end
