//
//  UIResponder+Category.m
//  HitTest
//
//  Created by duoyi on 2018/9/26.
//  Copyright © 2018年 duoyi. All rights reserved.
//

#import "UIResponder+Category.h"
#import <objc/message.h>

@implementation UIResponder (Category)

+ (void)load{
    //交换touchesBegan:withEvent:方法实现
    Method orig_pointMethod = class_getInstanceMethod(self, @selector(touchesBegan:withEvent:));
    Method cust_pointMethod = class_getInstanceMethod(self, @selector(sz_touchesBegan:withEvent:));
    method_exchangeImplementations(orig_pointMethod, cust_pointMethod);
}

//点击获取响应链条
- (void)sz_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIResponder *next = self;
    
    while (next != nil) {
        NSLog(@"%@",[self getClassName:next.description]);
        next = next.nextResponder;
    }
}

- (NSString *)getClassName:(NSString *)description{
    NSArray *descs = [description componentsSeparatedByString:@":"];
    return descs.firstObject;
}

@end
