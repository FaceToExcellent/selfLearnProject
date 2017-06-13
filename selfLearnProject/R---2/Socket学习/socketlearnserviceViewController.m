//
//  socketlearnserviceViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/31.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "socketlearnserviceViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
@interface socketlearnserviceViewController ()
//服务端
@end

@implementation socketlearnserviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self service];
    // Do any additional setup after loading the view.
}

-(void)service{
    int error;//错误代码
    int fuwu = socket(AF_INET, SOCK_STREAM, 0);
    BOOL success  = (fuwu!=-1);//返回正数代表成功
    if (success) {
        //MARK: bind() 绑定
        struct sockaddr_in addr;
        addr.sin_family = AF_INET;
        addr.sin_port = htons(6789);
        addr.sin_len  = sizeof(addr);
        addr.sin_addr.s_addr = INADDR_ANY;//接收的地址 换成客户端的地址是可以进行操作的
        //返回值是个int 判断是否成功
     error =    bind(fuwu, (const struct sockaddr *)&addr, sizeof(addr));
        success = (error ==0);
        
    }
    if (success) {
        NSLog(@"绑定了");
        error = listen(fuwu, 5);
        success = (error ==0);
    }
    if (success) {
        NSLog(@"监听");
        while (true) {//保持长连接
    //MARK:   接收客户端的数据
            struct sockaddr_in paddr;//接收客户端来的数据
            int peer ;//判断成功否
            socklen_t addrLen = sizeof(paddr);//返回一个长度
            peer =    accept(fuwu, (struct sockaddr *)&paddr, &addrLen);
            success = (peer!= -1);
            if (success) {
                NSLog(@"接收成功");
                //做缓存
                char buffer[1024];
                ssize_t  count;
                size_t  len = sizeof(buffer);
                do {
                    count  = recv(peer, buffer,len, 0);
                    NSString * str = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
                    NSLog(@"%@",str);
                } while (strcmp(buffer, "exit")!=0);
         
           
              
            }
        }
    }
    
    //MARK: 关闭
    //服务器结束监听，需要在客户端进行操作
    // 关闭socket
    close(fuwu);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
