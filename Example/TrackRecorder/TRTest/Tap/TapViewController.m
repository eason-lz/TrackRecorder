//
//  TapViewController.m
//  TrackRecorderTest
//
//  Created by eason on 2019/9/24.
//  Copyright © 2019 tr. All rights reserved.
//

#import "TapViewController.h"
#import "UIColor+ArmColor.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"tap";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [self.view addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(tapAction:)];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor armColor];
    view1.frame = CGRectMake(150, 100, 80, 40);
    [self.view addSubview:view1];
    // 如果页面中出现多个手势需要添加tag
    view1.tag = 1;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
    [view1 addGestureRecognizer:tap1];
    [tap1 addTarget:self action:@selector(tap1Action:)];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor armColor];
    view2.frame = CGRectMake(150, 180, 80, 40);
    [self.view addSubview:view2];
    // 如果页面中出现多个手势需要添加tag
    view2.tag = 2;
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] init];
    [view2 addGestureRecognizer:tap2];
    [tap2 addTarget:self action:@selector(tap2Action:)];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor armColor];
    view3.frame = CGRectMake(150, 260, 80, 40);
    [self.view addSubview:view3];
    // 如果页面中出现多个手势需要添加tag
    view3.tag = 3;
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] init];
    [view3 addGestureRecognizer:tap3];
    [tap3 addTarget:self action:@selector(tap3Action:)];
}

-(void)tapAction:(UITapGestureRecognizer *)sender {
    NSLog(@"tap");
}

-(void)tap1Action:(UITapGestureRecognizer *)sender {
    NSLog(@"tap1");
}

-(void)tap2Action:(UITapGestureRecognizer *)sender {
    NSLog(@"tap2");
}

-(void)tap3Action:(UITapGestureRecognizer *)sender {
    NSLog(@"tap3");
}

@end
