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

//创建链表
-(void)createLinkList:(NSMutableArray*)dataArray;
//输出链表
-(void)outputLinkList;

//在O(1)时间删除链表结点
-(void)deletemynode:(myNode*)currentnode;

//找到链表中---倒数----第k个结点   (n-k+1)个节点
-(myNode*)findTheNodeAtindex:(NSInteger)K;
//反转链表 有问题
-(myNode*)reverseList:(myNode*)head;
//合并链表
-(myNode*)mergelist:(myNode*)node1 node2 :(myNode*)node2;


@end
