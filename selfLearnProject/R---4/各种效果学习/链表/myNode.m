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
@end
