//
//  myNode.m
//  selfLearnProject
//
//  Created by HYZ on 2017/7/19.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "myNode.h"

@implementation myNode

-(void)createLinkList:(NSMutableArray*)dataArray
{
    _head = [[myNode alloc]init];
    _head->_next = nil;
    myNode * ptr = _head;
    for (int i=0; i<dataArray.count; i++) {
        myNode * node = [[myNode alloc]init];
        node.data = [dataArray objectAtIndex:i];
        node->_next = nil;
        ptr->_next = node;
        ptr = node;
    }
    
}
-(void)outputLinkList{
    myNode * ptr = _head;
    if (_head.data == nil) {
        ptr = ptr.next;
    }
    while (ptr !=nil) {
        NSLog(@"%@->",ptr->_data);
        ptr = ptr->_next;
    }
}

-(void)deletemynode:(myNode*)currentnode{
    myNode * node  =_head;
    while (currentnode.data!= node.data) {
        if (node.next==nil) {
            
            currentnode = nil;
            NSLog(@"没有找到对应节点");
            return;
        }
        node = node.next;
    }
    
    currentnode = node;
    
    if (_head == nil||currentnode == nil) {
        return;
    }
    if (currentnode.next!= nil) {//不是尾节点
        currentnode.head = currentnode.next.head;
        currentnode.next = currentnode.next.next;
        
        
    }else if(_head == currentnode){//就一个节点
        _head = nil;
        currentnode = nil;
        
        
    }else
    {//尾节点
        myNode * node = _head;
        while (node.next != currentnode) {
            node = node.next;
        }
        
        node.next = nil;
        
    }
    
}
-(myNode*)findTheNodeAtindex:(NSInteger)K{
    //顺序是从1 开始的 这里没有从 0 开始
    if (_head == nil|| K ==0  ) {
        return nil;
    }
    myNode * node = _head;
    for (int i=0; i<K-1; i++) {
        if (node.next == nil) {
            return nil;
        }
        node=  node.next;
    }
    myNode * thenode = _head;
    while (node.next !=nil) {
        node = node.next;
        thenode = thenode.next;
    }
    if (thenode.next !=nil) {
      thenode = thenode.next;  
    }
    
    
    return thenode;
}

-(myNode*)reverseList:(myNode*)head{
    myNode*  aNode = nil;
    myNode*  bNode = head;
    myNode*  cNode = nil;
    while(bNode != nil) {
        cNode = bNode.next;
        bNode.next = aNode;
        aNode = bNode;
        bNode = cNode;
    }
    return aNode;
    
  
}

-(myNode*)mergelist2:(myNode *)aHead node2:(myNode *)bHead{
    if(aHead == nil)
        return bHead;
    if(bHead == nil)
        return aHead;
    myNode* mergeHead = nil;
    if(aHead.data > bHead.data) {
        mergeHead = bHead;
        mergeHead.next = [self mergelist2:aHead node2:bHead.next];
    }else {
        mergeHead = aHead;
        mergeHead.next = [self mergelist2:aHead.next node2:bHead];
    }
    return mergeHead;
}
-(myNode*)mergelist:(myNode*)node1 node2 :(myNode*)node2{
    if (node1 == nil) {
        return node2;
    }
    if (node2 == nil) {
        return node1;
    }
    myNode * mergeHead = [[myNode alloc]init];
    myNode * current   = [[myNode alloc]init];
    if (node1.data > node2.data) {
        mergeHead = node2;
        node2 = node2.next;
    }else
    {
        mergeHead = node1;
        node1 = node1.next;
    }
    
    current = mergeHead;
    while (node1!= nil && node2 != nil) {
        if (node1.data >node2.data) {
            current.next = node2;
            node2 = node2.next;
        }else
        {
            current.next = node1;
            node1 = node1.next;
        }
        
        current = current.next;
    }
    
    if (node1 == nil) {
        current.next = node2;
        
    }else
    {
        current.next = node1;
    }
    return mergeHead;
    
}
@end
