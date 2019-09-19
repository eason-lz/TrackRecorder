//
//  TRViewController.m
//  TrackRecorder
//
//  Created by 18210437675@163.com on 09/19/2019.
//  Copyright (c) 2019 18210437675@163.com. All rights reserved.
//

#import "TRViewController.h"
#import <TrackRecorder/TrackRecorder.h>

@interface TRViewController ()<TrackRecordDelegate>

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [TrackRecordManager sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)TrackRecordClickWithDictionary:(nonnull NSDictionary *)dic {
    NSLog(@"%@",dic);
}

- (void)TrackRecordVisitWithDictionary:(nonnull NSDictionary *)dic {
    NSLog(@"%@",dic);
}


@end
