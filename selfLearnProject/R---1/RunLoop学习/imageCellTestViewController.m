//
//  imageCellTestViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/16.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "imageCellTestViewController.h"
#import <CoreFoundation/CoreFoundation.h>
typedef void(^RunLoopBlock)(void);

@interface imageCellTestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSTimer * timer;
//装任务的数组
@property(nonatomic,strong)NSMutableArray *tasks;
//最大任务数
@property(nonatomic)NSUInteger maxQueuenumber;
@end

@implementation imageCellTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加观察者
    [self addRunLoopObserver];
  
    _tasks = [NSMutableArray array];
    _maxQueuenumber = 15;
    
    _timer =[NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    
    
    
    
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
}

-(void)timeMethod{
    //什么都不写 runloop就会自动的不断循环
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 600;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"RunloopCell"];
    //这里因为是一张图片，在重用机制下，会不那么卡
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RunloopCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    for (NSInteger i =1; i<5; i++) {
        [[cell.contentView viewWithTag:i]removeFromSuperview];;
    }
    
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(5, 5, 200, 10);
    label.textColor = [UIColor blackColor];
    label.tag = 4;
    label.text = [NSString stringWithFormat:@"我是cell的第--------%ld行",indexPath.row];
    [cell.contentView addSubview:label];
    //尴尬了 并没有卡
    //这里是耗时操作  Runloop负责在一次循环中渲染UI
    //类方法不用加weak
    __weak __typeof(self)weakSelf = self;
    [self addTask:^{
        [weakSelf addiMageWith1:cell];
    }];
    [self addTask:^{
        [weakSelf addiMageWith2:cell];
    }];
    [self addTask:^{
        [weakSelf addiMageWith3:cell];
    }];
   
  
    return cell;
    
}

-(void)addTask:(RunLoopBlock)task{
    [self.tasks addObject:task];
    if (self.tasks.count>_maxQueuenumber) {
        [self.tasks removeObjectAtIndex:0];
    }
}
//回调函数
static void CallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    //取出任务执行
    imageCellTestViewController * vc = (__bridge imageCellTestViewController *)(info);
    if (vc.tasks.count ==0) {
        return;
    }
    RunLoopBlock task =   vc.tasks.firstObject;
    task();
    
    [vc.tasks removeObjectAtIndex:0];
    
    //NSLog(@"观察中");
}
#pragma mark -- cfrunloop
-(void)addRunLoopObserver{
    //当前RunLoop
    CFRunLoopRef runloop  = CFRunLoopGetCurrent();
    //定义一个上下文
    CFRunLoopObserverContext context ={
      0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    //定义一个观察者
   static CFRunLoopObserverRef defultModeOberver;
    //创建一个观察者
    defultModeOberver = CFRunLoopObserverCreate(NULL, kCFRunLoopAfterWaiting, YES, 0, &CallBack, &context);
    //添加Runloop到观察者
    CFRunLoopAddObserver(runloop, defultModeOberver, kCFRunLoopCommonModes);
    //此处必须释放
    CFRelease(defultModeOberver);
    
    
}

//MARK: 把图片放到工程里然后用路径去取，会卡，把图片直接放到Assets里面，用[image imageName:]不会卡
-(void)addiMageWith1:(UITableViewCell*)cell
{
    UIImageView * imageView =[[UIImageView alloc]init];
    //imageView.backgroundColor = [UIColor grayColor];
    
    imageView.frame = CGRectMake(5, 20, 85, 85);
    imageView.tag =1;
//      NSString * path = [[NSBundle mainBundle]pathForResource:@"testimage" ofType:@"jpg"];
//    UIImage * image =[UIImage  imageWithContentsOfFile:path];
     UIImage * image =[UIImage  imageNamed:@"1080-1920testIMage"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView];
    } completion:nil];
    
}
-(void)addiMageWith2:(UITableViewCell*)cell
{
    UIImageView * imageView =[[UIImageView alloc]init];
    imageView.frame = CGRectMake(95, 20, 85, 85);
    imageView.tag =2;
//    NSString * path = [[NSBundle mainBundle]pathForResource:@"1080-1920testIMage" ofType:@"png"];
//    NSString * path = [[NSBundle mainBundle]pathForResource:@"testimage" ofType:@"jpg"];
//    UIImage * image =[UIImage  imageWithContentsOfFile:path];
//MARK:使用这种方式，内存会由300降为100 然后更加流畅 清晰度没有下降
     UIImage * image =[UIImage  imageNamed:@"1080-1920testIMage"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView];
    } completion:nil];
    
}
-(void)addiMageWith3:(UITableViewCell*)cell
{
    UIImageView * imageView =[[UIImageView alloc]init];
    imageView.frame = CGRectMake(185, 20, 85, 85);
    imageView.tag =3;
    //放在Assets里面的图片 用路径取不到
//    NSString * path = [[NSBundle mainBundle]pathForResource:@"1080-1920testIMage" ofType:@"png"];
//    NSString * path = [[NSBundle mainBundle]pathForResource:@"testimage" ofType:@"jpg"];
//    UIImage * image =[UIImage  imageWithContentsOfFile:path];
    UIImage * image =[UIImage  imageNamed:@"1080-1920testIMage"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView];
    } completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
