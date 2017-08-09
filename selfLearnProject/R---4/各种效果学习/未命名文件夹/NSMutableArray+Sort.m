//
//  NSMutableArray+Sort.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/9.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "NSMutableArray+Sort.h"

#import <objc/message.h>
#import <UIKit/UIKit.h>
#import "mylabelbarView.h"
//#import "MBHeap.h"
void(*objc_msgSendExchangePosition)(id self ,SEL _cmd,id objc1,id objc2) = (void*)objc_msgSend;
void (*objc_msgSendSortArray)(id self,SEL _cmd,id sortArray) = (void *)objc_msgSend;
@interface NSMutableArray()

@property(nonatomic, copy) SortComparator comparator;
@property(nonatomic, strong) id objc;


@end
@implementation NSMutableArray (Sort)
-(void)sortUsingComparator:(SortComparator)comparator sortType:(SortType)sortType
{
    
    self.comparator = comparator;
    Class class = NSClassFromString(@"SortViewController");
    id objc = [class new];
    self.objc = objc;
    switch (sortType) {
        case SelectionSort:
            //选择排序
          
            break;
        case BubbleSort:
            //冒泡排序
            
            break;
        case InsertionSort:
            //插入排序
            
            break;
        case MergeSort:
            //归并排序
            
            break;
        case QuickSort:
            //快速排序
          
            break;
        case IdenticalQuickSort:
            //双路快速排序
           
            break;
        case Quick3WaysSort:
            //三路快速排序
            
            break;
        case HeapSort:
            //堆排序
          
            break;
        default:
            break;
    }
    
    
}

-(void)exchangeWithIndexA:(NSInteger)indexA indexB:(NSInteger)indexB{
    
}

@end
