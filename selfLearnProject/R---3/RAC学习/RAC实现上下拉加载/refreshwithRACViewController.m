//
//  refreshwithRACViewController.m
//  selfLearnProject
//
//  Created by HYZ on 17/6/14.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "refreshwithRACViewController.h"
#import "ReactiveObjC.h"//不能智能提示
@interface refreshwithRACViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataarray;
@end

@implementation refreshwithRACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataarray = [NSMutableArray arrayWithCapacity:4];
    NSArray * array = @[@"这是第一个",@"这是第2个",@"这是第3个",@"这是第4个",@"这是第5个"];
    [_dataarray addObjectsFromArray:array];
    [self tableviewMaker];
    [self loadMoreData];
    
    [[[[RACObserve(self.tableView, contentOffset)map:^id _Nullable(id  _Nullable value) {
        
        
      //  NSLog(@"条件1::::%f",(self.tableView.contentOffset.y - (self.tableView.contentSize.height-VIEWHEIGHT)));
    
        
        if (self.tableView.contentOffset.y<-50) {
            //下拉
            //NSLog(@"下拉 worked");
            return @"1";
        } else if(self.tableView.contentOffset.y>self.tableView.contentSize.height-VIEWHEIGHT+60){
            //上啦 这里的 60 是为了上拉效果
           // NSLog(@"上啦 worked");
            return @"2";
        }else
        {
            return @"0";
        }
        
    }]distinctUntilChanged]delay:0.5] subscribeNext:^(id  _Nullable x) {
       // NSLog(@"%@",x); 这里的delay模拟加载时间
        if ([x integerValue] == 1) {
            [_tableView reloadData];
            
        }else if([x integerValue] == 2){
            [self loadMoreData];
        }
        
        
    }];
    
    
    
    
    
}
-(void)tableviewMaker{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT-49)];
    _tableView.dataSource =self;
    _tableView.delegate   = self;
    [self.view addSubview:_tableView];
}
-(void)loadMoreData{
    
    NSArray * array = @[@"这是第一个",@"这是第一个",@"这是第一个",@"这是第一个",@"这是第一个"];
    [_dataarray addObjectsFromArray:array];
    NSLog(@"_dataarray.count%ld",_dataarray.count);
    [_tableView reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return _dataarray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%@",indexPath.row, [_dataarray objectAtIndex:indexPath.row]];
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
