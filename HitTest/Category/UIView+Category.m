//
//  UIView+Category.m
//  HitTest
//
//  Created by duoyi on 2018/9/26.
//  Copyright © 2018年 duoyi. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/message.h>

@implementation UIView (Category)

+(void)load{
    //交换pointInside:withEvent:方法实现
    Method orig_pointMethod = class_getInstanceMethod(self, @selector(pointInside:withEvent:));
    Method cust_pointMethod = class_getInstanceMethod(self, @selector(sz_pointInside:withEvent:));
    method_exchangeImplementations(orig_pointMethod, cust_pointMethod);
    
    //交换hitTest:withEvent:方法实现
    Method orig_hitTestMethod = class_getInstanceMethod(self, @selector(hitTest:withEvent:));
    Method cust_hitTestMethod = class_getInstanceMethod(self, @selector(sz_hitTest:withEvent:));
    method_exchangeImplementations(orig_hitTestMethod, cust_hitTestMethod);
}

- (BOOL)sz_pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL pointInside = [self sz_pointInside:point withEvent:event];
    if (pointInside) {
        NSLog(@"%@ --- 触摸点落在%@上",NSStringFromSelector(_cmd),[self getClassName:self.description]);
    }
    else{
        NSLog(@"%@ --- 触摸不在%@上",NSStringFromSelector(_cmd),[self getClassName:self.description]);
    }
    return pointInside;
}

- (UIView *)sz_hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *touchView = [self sz_hitTest:point withEvent:event];
    if (touchView != nil) {
        NSLog(@"%@ --- 最佳响应view是%@",NSStringFromSelector(_cmd),[self getClassName:self.description]);
    }
    else{
        NSLog(@"%@ --- 不是最佳响应view%@",NSStringFromSelector(_cmd),[self getClassName:self.description]);
    }
    return touchView;
}

- (NSString *)getClassName:(NSString *)description{
    NSArray *descs = [description componentsSeparatedByString:@":"];
    return descs.firstObject;
}
@end
