//
//  mylabelbarView.m
//  selfLearnProject
//
//  Created by HYZ on 2017/8/9.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "mylabelbarView.h"

@implementation mylabelbarView

-(void)layoutSubviews{
    self.label.center = self.center;
    self.label.frame = CGRectMake(0, 10, self.frame.size.width, 10);
    self.label.hidden = selfWIDTH < SCREEN_WIDTH/15?YES:NO;
    self.label.text = [NSString stringWithFormat:@"%f",selfHEIGHT];
    
}

-(UILabel *)label
{
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:12];
        [self addSubview:_label];
    }
    return _label;
}

@end
