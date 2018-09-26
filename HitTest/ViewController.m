//
//  ViewController.m
//  HitTest
//
//  Created by duoyi on 2018/9/26.
//  Copyright © 2018年 duoyi. All rights reserved.
//

#import "ViewController.h"
#import "AView.h"
#import "BView.h"
#import "CView.h"
#import "DView.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AView *aView = (AView *)[self createViewWithClass:AView.class];
    BView *bView = (BView *)[self createViewWithClass:BView.class];
    CView *cView = (CView *)[self createViewWithClass:CView.class];
    DView *dView = (DView *)[self createViewWithClass:DView.class];
    
    [self.view addSubview:aView];
    [aView addSubview:bView];
    [aView addSubview:cView];
    [self.view addSubview:dView];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    aView.frame = CGRectMake(0, 0, screenSize.width, screenSize.width);
    bView.frame = CGRectMake(10, 10, 100, 100);
    cView.frame = CGRectMake(80, 80, 100, 100);
    dView.frame = CGRectMake(0, CGRectGetMaxY(aView.frame), 100, 100);
    
}

- (UIView *)createViewWithClass:(Class)class{
    UIView *view = [[class alloc] init];
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
