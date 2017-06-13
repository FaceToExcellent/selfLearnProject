//
//  socketlearnViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/31.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "socketlearnViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
@interface socketlearnViewController ()

@end

@implementation socketlearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*1.第一个参数是传输协议
      2.第二个参数是一个接口类型 SOCK_STREAM 流 TCP  SOCK_DGRAM 流 UDP
     3.第三个参数是协议*/
//MARK: 建立socket 返回值是正数代表创建成功
    int client =   socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
//MARK: 建立连接
    /*1.第一个参数 客户端的socket 
      2.第二个参数  */
    struct sockaddr_in serviceAddr;
    serviceAddr.sin_family = AF_INET;//协议簇
    serviceAddr.sin_port   = htons(4321);//端口号 4321
    serviceAddr.sin_addr.s_addr = inet_addr("127.0.0.1");//强制转换类型 本机作为一个服务器
    //返回值 int 返回值是正数代表连接失败 这里返回的正数是错误码
   int result =  connect(client,( const struct sockaddr* )&serviceAddr, sizeof(serviceAddr));
    if (result==0) {
        //连接成功 在服务器开启端口 让客户端连接  nc -lk 4321(命令行开启端口 )
        NSLog(@"socket连接成功");
 //MARK:  进行通讯
        NSString * message = @"socket 通讯开启";
        /*1.第一个参数 客户端的socket
          2.第二个参数 发送内容的地址 
          3.第三个参数 发送内容的长度
          4.第四个参数 发送的标识 一般赋值为0*/
       ssize_t sendlength=    send(client, message.UTF8String, strlen(message.UTF8String), 0);
         /*发送消息的长度*/
        NSLog(@"发了%zd个字符",sendlength);
//MARK: 服务器返回消息
        /*1.第一个参数 客户端socket 
          2.第二个参数  返回内容
          3.第三个参数  返回内容的长度
          4.最后一个参数 标识*/
        //接收的数据 需要缓存  需要和发送的数据转化成一致
        uint8_t buffer[1024];
        
        ssize_t recvLen = recv(client, buffer, sizeof(buffer), 0);
        NSLog(@"接收了%zd个字符",recvLen);
        NSData * data =[NSData dataWithBytes:buffer length:recvLen];
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);//在输入前不能回车 输入后回车
//MARK: 关闭
        close(client);
       
    }else
    {
        //连接失败 -1 端口没开启
        NSLog(@"socket连接失败%d",result);
    }
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
