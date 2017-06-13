//
//  ROOTViewController.h
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ROOTViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * VCClassNameArray;
@property(nonatomic,strong)NSArray * VCClasstitleArray;
@property(nonatomic,strong)UITableView * tableView;

@end
