//
//  DView.m
//  HitTest
//
//  Created by duoyi on 2018/9/26.
//  Copyright © 2018年 duoyi. All rights reserved.
//

#import "DView.h"

@implementation DView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

//重载
- (void)updateTitle:(NSString *)title{
    [super updateTitle:@"D"];
}

//重写描述
+(NSString *)description{
    return @"我是D";
}
@end
