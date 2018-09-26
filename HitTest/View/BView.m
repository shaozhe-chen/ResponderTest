//
//  BView.m
//  HitTest
//
//  Created by duoyi on 2018/9/26.
//  Copyright © 2018年 duoyi. All rights reserved.
//

#import "BView.h"

@implementation BView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

//重载
- (void)updateTitle:(NSString *)title{
    [super updateTitle:@"B"];
}

//重写描述
+(NSString *)description{
    return @"我是B";
}
@end
