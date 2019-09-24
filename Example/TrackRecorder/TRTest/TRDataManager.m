//
//  TRDataManager.m
//  TrackRecorderTest
//
//  Created by eason on 2019/9/23.
//  Copyright © 2019 tr. All rights reserved.
//

#import "TRDataManager.h"
#import <TrackRecorder/TrackRecordManager.h>

@interface TRDataManager ()<TrackRecordDelegate>

@end

@implementation TRDataManager

+ (instancetype)sharedInstance
{
    static TRDataManager * instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TRDataManager alloc] init];
    });
    return instance;
}

- (void)addProtocol {
    TrackRecordManager.sharedInstance.delegate = self;
}

- (void)TrackRecordClickWithDictionary:(nonnull NSDictionary *)dic {
    NSLog(@"click%@",dic);
}

- (void)TrackRecordVisitWithDictionary:(nonnull NSDictionary *)dic {
    NSLog(@"visit%@",dic);
}

@end
