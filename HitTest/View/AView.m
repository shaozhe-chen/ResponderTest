//
//  AView.m
//  HitTest
//
//  Created by duoyi on 2018/9/26.
//  Copyright © 2018年 duoyi. All rights reserved.
//

#import "AView.h"

@implementation AView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

//重载
- (void)updateTitle:(NSString *)title{
    [super updateTitle:@"A"];
}

//重写描述
+(NSString *)description{
    return @"我是A";
}
@end
