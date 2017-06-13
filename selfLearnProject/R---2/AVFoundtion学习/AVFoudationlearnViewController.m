//
//  AVFoudationlearnViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/6/1.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "AVFoudationlearnViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface AVFoudationlearnViewController ()
@property(nonatomic,strong)NSString * str;
@end
//点读机
@implementation AVFoudationlearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //语音合成器 嘴
    AVSpeechSynthesizer * synthesizer = [[AVSpeechSynthesizer alloc]init];
    //舌头
    _str = [[NSString alloc]init];
    _str =@"这么一个成熟的框架早已有无数人对其架构进行过透彻的分析，老司机说了也是一样的，但作为程序员最快的成长就是不断地重造轮子。当然你造轮子不一定是要替代原来的，只是扩展一种思路";
    AVSpeechUtterance * utterance =[[AVSpeechUtterance alloc]initWithString:_str];
    //如果要识别中文 要设置语言 zh-CN en-US
    NSArray *vioces = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"],[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"]];
    utterance.voice = vioces[0];//不改变语言，依旧能够识别英文
    //舌头的控制器
    utterance.rate = 0.3;
    //音量 ios手机的声音控制就是通过这个属性来实现的
    utterance.volume = 0.8;
    //音调
    utterance.pitchMultiplier = 1;
    
    
    //通过嘴巴用舌头说话
    [synthesizer speakUtterance:utterance];
    
    
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
