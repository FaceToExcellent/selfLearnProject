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


-(void)outputLinkList
{
    
    myNode * ptr = _head->_next;
    while (ptr !=nil) {
        NSLog(@"%@->",ptr->_data);
        ptr = ptr->_next;
    }
    
    
}

@end
