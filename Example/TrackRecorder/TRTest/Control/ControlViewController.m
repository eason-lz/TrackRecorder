//
//  ControlViewController.m
//  TrackRecorderTest
//
//  Created by eason on 2019/9/24.
//  Copyright © 2019 tr. All rights reserved.
//

#import "ControlViewController.h"
#import "UIColor+ArmColor.h"

@interface ControlViewController ()

@end

@implementation ControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"control";
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor armColor];
    btn1.frame = CGRectMake(150, 100, 80, 40);
    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor armColor];
    btn2.frame = CGRectMake(150, 180, 80, 40);
    [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.backgroundColor = [UIColor armColor];
    btn3.frame = CGRectMake(150, 260, 80, 40);
    [btn3 setTitle:@"btn3" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

- (void)btn1Action:(UIButton *)btn {
    NSLog(@"btn1");
}

- (void)btn2Action:(UIButton *)btn {
    NSLog(@"btn2");
}

- (void)btn3Action:(UIButton *)btn {
    NSLog(@"btn3");
}

@end
