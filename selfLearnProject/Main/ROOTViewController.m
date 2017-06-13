//
//  ROOTViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "ROOTViewController.h"

@interface ROOTViewController ()

@end

@implementation ROOTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
  
   
    _tableView =[[UITableView alloc]init];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.frame =CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_tableView];
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = _VCClasstitleArray[indexPath.row];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _VCClasstitleArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSString * ns = [NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"];
    NSString * str = [NSString stringWithFormat:@"%@",_VCClassNameArray[indexPath.row]];
   // NSLog(@"%@",str);
   
    Class  vcClass =NSClassFromString(str);
   // NSLog(@"%@",vcClass);
    if ([vcClass isSubclassOfClass:[UIViewController class]]) {
        id vc = [[vcClass alloc]init];
      //  NSLog(@"%@",vc);
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
