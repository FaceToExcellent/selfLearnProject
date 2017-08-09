//
//  NSMutableArray+Sort.h
//  selfLearnProject
//
//  Created by HYZ on 2017/8/9.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,SortType) {
    SelectionSort,         //选择排序
    BubbleSort,            //冒泡排序
    InsertionSort,         //插入排序
    MergeSort,             //归并排序
    QuickSort,             //原始快速排序
    IdenticalQuickSort,    //双路快速排序
    Quick3WaysSort,        //三路快速排序
    HeapSort,              //堆排序
};
typedef NSComparisonResult(^SortComparator) (id objc1,id objc2);
@interface NSMutableArray (Sort)
- (void)sortUsingComparator:(SortComparator )comparator sortType:(SortType )sortType;

- (void)exchangeWithIndexA:(NSInteger)indexA indexB:(NSInteger)indexB;
@end
