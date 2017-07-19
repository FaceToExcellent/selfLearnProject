//
//  MathViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/7/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "MathViewController.h"

@interface MathViewController ()

@end

@implementation MathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self questionONE:100];
   
   // [self questionTWO:6 M:4];
    
   // [self questionThree:@"inputttttt"];
    
    [self questionFour];
}


-(void)questionFour{
   // n个点，坐标x[i]从小到大，每个点可以选择Left或者Right的方向前进，速度v=1，求相遇的时间。

    
}

-(void)questionThree:(NSString *)inputString{
    //N个字符的字符串，找到最短的区间，包含所有字符串出现过的字符，输出区间长度
     char  a[inputString.length];
    char b[inputString.length];
    for (int i = 0 ;i<inputString.length;i++) {
        
        char mychar  = [inputString characterAtIndex:i];
        
       // NSLog(@"%c",mychar);
    
        a[i] = mychar;
        b[i] = mychar;
    }
    //去重
    static int  n = 0;
    for (int i=0; i<inputString.length;i++) {
        for (int j=0; j<inputString.length; j++) {
            if (b[i] == b[j]) {
                if (i != j) {
                    b[j] = 0;
                }
            }
            
        }
        
        NSLog(@"%c",b[i]);
        
        if (b[i]!= 0) {
            n++;
        }
        
    }
    
    NSLog(@"%d",n);
    //确定范围
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (int i=0; i<n; i++) {
        
        char  siglechar = b[i];
        [arr addObject:[NSString stringWithCString:&siglechar encoding:4]];
    }
   // NSLog(@"%@",arr);
    NSString * str =@"";
    for (int i=0; i<arr.count; i++) {
        str = [str stringByAppendingString:[arr objectAtIndex:i]];
        
    }
    //方案 5 错误 ；；；；；；；；
//    NSLog(@"%@",str);
//    NSLog(@"%@",inputString);
//    //只有写成这样才管用
//    NSRange  range = [@"inputtttt" rangeOfString:@"input"];
//    
//    NSLog(@"%@", NSStringFromRange(range));
   
//方案 6 方法很笨 需要改进 是不是需要链表
    
    
    //确定范围·1 最小范围，开始是字符的总数
        /* 2.如果第一个空间不存在，则空间从左往右扩展1 ，一直到确定包含算有字符
            3.包含所有字符，但是不是字符串所有长度的时候，确定抛弃剩余部分
            4.如果包含字符就是所有的字符长度，则从左起第二个字符开始，直到确定范围，如果范围是所有长度-1，则继续右移动1*/
   
    
    
    
}
-(void)questionTWO:(NSInteger)N M:(NSInteger)M{
    //NxN的棋盘，每个格子可以放一个车，有M个车，问：每个车放完后，棋盘还剩多少格子是所有车攻击范围外？
    //情况 ：M 个车 的攻击范围内，不再出现车 车的同行和同列会遭到攻击
    //M 只要落下就会产生位置 X 和 Y 出现后便不再出现相同数字
   
    NSMutableDictionary * resultdict = [[NSMutableDictionary alloc]init];
    while (resultdict.count<M) {
        //加入，重复位置会覆盖加入不成功 同时相同的key 也会被覆盖掉
        NSInteger X = arc4random()%N;
        NSInteger Y = arc4random()%N;
        if([resultdict.allValues containsObject:[NSString stringWithFormat:@"%ld",X]]){
            //相同值的去掉
        }else
        {
             [resultdict setObject:[NSString stringWithFormat:@"%ld",X] forKey:[NSString stringWithFormat:@"%ld",Y]];
        }
    }
    //放入位置确定
    NSLog(@"%@",resultdict);
    NSMutableArray * Aarray = [[NSMutableArray alloc]init];
    NSMutableArray * Barray = [[NSMutableArray alloc]init];
    for (int i=0; i<N; i++) {
        //A 为列数组
        [Aarray addObject:[NSString stringWithFormat:@"%d",i]];
        //B 为行数组
        [Barray addObject:[NSString stringWithFormat:@"%d",i]];
    }
   //去掉同行
        for (NSString *str in resultdict.allKeys) {
            if ([Barray containsObject:str]) {
                [Barray removeObject:str];
            }
        }
    NSLog(@"Barray%@",Barray);
    //去掉同列
        for (NSString *str in resultdict.allValues) {
            if ([Aarray containsObject:str]) {
                [Aarray removeObject:str];
            }
        }
    NSLog(@"Aarray%@",Aarray);
    
    NSInteger sumResult  =  Aarray.count * Barray.count;
    
    NSLog(@"sumResult%ld",sumResult);
}


-(void)questionONE:(NSInteger)N{
    //question：N（N为偶数）个数字，把数字平分 N/2 组，使得每组的数字和相等
    NSMutableArray * NArray =[[NSMutableArray alloc]init];
    NSMutableDictionary * result= [[NSMutableDictionary alloc]init];
    static int sum;
    for (int i=0; i<N; i++) {
        [NArray addObject:[NSString stringWithFormat:@"%d",i]];
        sum = sum +i;
    }
   // NSLog(@"%d",sum);
    int  k = sum/(N/2);
    for(int j=0 ;j<(N/2);j++){
         int x =  k - [NArray[j]intValue];
       // NSLog(@"%d",x);
        for(int i= 0;i<NArray.count;i++) {
            int m = [[NArray objectAtIndex:i]intValue];
            if (x == m) {
                [result setObject:[NArray objectAtIndex:i] forKey:NArray[j]];
                
            }
        }
    }
    NSLog(@"%@",result);
    
    // k = sum / (n/2)
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
