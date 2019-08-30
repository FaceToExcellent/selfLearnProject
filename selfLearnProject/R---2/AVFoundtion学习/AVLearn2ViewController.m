//
//  AVLearn2ViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/6/1.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "AVLearn2ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface AVLearn2ViewController ()
@property(nonatomic,strong)AVPlayer * player;
@end

@implementation AVLearn2ViewController
//本地视频

- (void)viewDidLoad {    [super viewDidLoad];
    NSURL * url = [[NSBundle mainBundle]URLForResource:@"凉凉.mp4" withExtension:nil];
    //视频属性 items
    //playerItemWithAsset 通过对系统的相册内容进行访问，创建出一个需要播放的内容
    //这里我们也可以在网络上获取到视频的数据进行播放
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    self.player = [AVPlayer playerWithPlayerItem:item];
   // item 
   // item.duration
   // item.status
   // seektoTime;不属于AVPlayerItem 属于avplayer 调到指定时间点播放
    
    AVPlayerLayer * layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    layer.frame = self.view.frame;
    
    //直接放置图层进行播放 如果直接放在View上可以播放，但是没有画面 渲染是在layer上
    [self.view.layer addSublayer:layer];
    //开始播放
    [self.player play];
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
