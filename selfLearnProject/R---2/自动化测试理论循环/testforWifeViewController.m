//
//  testforWifeViewController.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/8.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "testforWifeViewController.h"

@interface testforWifeViewController ()
@property(nonatomic,strong)UIWebView * webView;
@end

@implementation testforWifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   //[self loadLocalHTMLFileToUIWebView];
    
    [self load2];
    // Do any additional setup after loading the view.
}
- (void)loadLocalHTMLFileToUIWebView{
   
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 20;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, width, height)];
    // 2.创建URL
    NSURL *url = [NSURL URLWithString:@"http://www.youku.com"];
    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 4.加载网页
    [webView loadRequest:request];
    // 5.最后将webView添加到界面
    [self.view addSubview:webView];
    self.webView = webView;
    
    
 
    
    

}

-(void)load2{
    
   _webView =  [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH , SCREEN_HEIGHT)];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"testimage" ofType:@"jpg"];
    
//    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSURL * url = [NSURL fileURLWithPath:path isDirectory:NO];
    NSString *htmlString = [NSString stringWithFormat:@"<!DOCTYPE html><html><img src=\"%@\" width=\"100%%\" height=\"100%%\"><body></body></html>",[url absoluteString]];
    
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
    [self.view addSubview:_webView];
    
    
  
    
    
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
