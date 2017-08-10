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
          
            [self selectionSort];
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





#pragma mark 私有排序算法 开始
//MARK: 选择排序
-(void)selectionSort{
    
    /**
     
     1. 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
     
     2. 再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
     
     3. 重复第二步，直到所有元素均排序完毕。
     
     */
    
    
    /**
     
     选择排序是一种简单直观的排序算法，无论什么数据进去都是 O(n?) 的时间复杂度。所以用到它的时候，数据规模越小越好。唯一的好处可能就是不占用额外的内存空间了吧。
     */
   
    
    for (int i =0; i<self.count; i++) {
        for (int j=i+1; j<self.count; j++) {
            if (self.comparator(self[i],self[j])==NSOrderedDescending) {
                [self exchangeWithIndexA:i indexB:j];
            }
        }
    }
    
}

//MARK:冒泡排序
-(void)bubbleSort{
    
    
    /**
     冒泡排序（Bubble Sort）也是一种简单直观的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
     
     */
    bool swapped;
    do{
        swapped = false;
        for (int i =1; i<self.count; i++) {
            if (self.comparator(self[i-1],self[i])==NSOrderedDescending) {
                swapped = true;
                [self exchangeWithIndexA:i indexB:i-1];
            }
        }
        
        
        
    }while (swapped);
    
    
    
}
//MARK:插入排序
-(void)inertionSort{
    
    /**
     
     1. 将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。
     
     2. 从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。（如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）
     */
    
    for (int i =0; i<self.count; i++) {
        id e = self[i];
        int j;
        for (j=i; j>0&& self.comparator(self[j-1],e)== NSOrderedDescending; j--) {
            [self exchangeWithIndexA:j indexB:j-1];
        }
    }
    
}

//MARK: 归并排序，自顶向下
-(void)mergeSort{
    
}
-(void)mergesortArray:(NSMutableArray*)array leftIndex:(int)L rightIndex:(int)R{
    if (L >= R)return;
    int mid  = (L+R)/2;
    [self mergesortArray:self leftIndex:L rightIndex:mid];
    [self mergesortArray:self leftIndex:mid +1 rightIndex:R];
    [self mergeSortArray:self LeftIndex:L midIndex:mid rightIndex:R];
}

- (void)mergeSortArray:(NSMutableArray *)array LeftIndex:(int )l midIndex:(int )mid rightIndex:(int )r{
    
    
    
    /**
     
     上午到这儿
     */
}
#pragma mark 私有排序算法 结束
-(void)exchangeWithIndexA:(NSInteger)indexA indexB:(NSInteger)indexB{
    
    if(indexA >= self.count || indexB >= self.count){
        NSLog(@"indexA:%ld,indexB:%ld",indexA,indexB);
        return;
        
    }
    //这个地方是为了交换数组内部顺序
    id  temp = self[indexA];
    self[indexA] = self[indexB];
    self[indexB] = temp;
    if (!self.objc) {
        Class class = NSClassFromString(@"SortViewController");
        id objc = [class new];
        self.objc = objc;
    }
    
    SEL func = NSSelectorFromString(@"exchangePositionWithBarOne:andBarTwo:");
    //这里是为了交换View的位置
    objc_msgSendExchangePosition(self.objc,func,temp,self[indexA]);
    
    
    
}






@end
