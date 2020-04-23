//
//  snTableViewCell.m
//  selfLearnProject
//
//  Created by HYZ on 2020/4/23.
//  Copyright © 2020 HYZ. All rights reserved.
//

#import "snTableViewCell.h"
#import "Masonry.h"
@interface snTableViewCell()
@property (nonatomic,strong) UIView * bgview ;
@end
@implementation snTableViewCell


-(instancetype)init {
    if (self =  [super init]) {
        
        _bgview = [[UIView alloc]init];
        [self.contentView addSubview:_bgview];
        [_bgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(15);
            make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
            make.top.bottom.equalTo(self.contentView);
          
        }];
        
     
    }
    
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
