//
//  BaseView.m
//  HitTest
//
//  Created by duoyi on 2018/9/26.
//  Copyright © 2018年 duoyi. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation BaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLabel];
        [self updateTitle:nil];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

#pragma mark 重载
- (void)updateTitle:(NSString *)title{
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
}

#pragma mark Getter
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _titleLabel;
}
@end
