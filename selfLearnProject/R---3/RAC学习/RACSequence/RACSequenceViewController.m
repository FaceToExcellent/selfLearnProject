//
//  RACSequenceViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/15.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "RACSequenceViewController.h"
#import "ReactiveObjC.h"//不能智能提示
@interface RACSequenceViewController ()

@end

@implementation RACSequenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self reduce];
    
}

-(void)arraySequence{
    
    /*这里可以将NSArray，NSDictionary转换为RACSequence。并且通过RACSequence转为RACSignal。*/
    NSArray * array = @[@"a",@"b",@"c"];
    RACSequence * arraySeq = array.rac_sequence;
    RACSignal * arraySignal = arraySeq.signal;
    [arraySignal subscribeNext:^(id  _Nullable x) {
         NSLog(@"%@",x);
    }];
    //此处会多次输出直到数组输出完毕
    
}

-(void)dictSequence{
    NSDictionary *dict = @{@"k1" : @"value1",
                           @"k2" : @"value2"};
    RACSequence *dictSeq = dict.rac_sequence;
    RACSignal *dictSignal = dictSeq.signal;
    
    // 字典中的数据流比较特殊、是一个`RACTuple`类型，下面会讲到。
    [dictSignal subscribeNext:^(RACTuple *tupe) {
        NSLog(@"key = %@, value = %@", tupe.first, tupe.second);
    }];
    // 所有的key的序列
//    RACSequence *keysSeq = dict.rac_keySequence;
//    // 所有的value的序列
//    RACSequence *valuesSeq = dict.rac_valueSequence;
}
-(void)reduce{
    NSArray *array1 = @[@"a", @"b", @"c"];
    NSArray *array2 = @[@1, @2, @3];
    
    id a = [array1.rac_sequence foldLeftWithStart:@"d" reduce:^id(id accumulator, id value) {
        NSLog(@"accumulator = %@, value = %@", accumulator, value);
        return [NSString stringWithFormat:@"%@ + %@",accumulator, value];
    }];
    NSLog(@"a = %@", a);
    
    id b = [array2.rac_sequence foldRightWithStart:@(4) reduce:^id(id first, RACSequence *rest) {
        NSLog(@"first = %@, rest.head = %@",first, rest.head);
        return @([first integerValue] + [rest.head integerValue]);
    }];
    NSLog(@"b = %@", b);
    
    
    NSLog(@"");
}












@end
