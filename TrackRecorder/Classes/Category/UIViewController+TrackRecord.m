//
//  UIViewController+TrackRecord.m
//  TrackRecord
//
//  Created by eason on 2019/8/29.
//  Copyright © 2019 tr. All rights reserved.
//

#import "UIViewController+TrackRecord.h"
#import "TrackRecordManager.h"
#import <objc/runtime.h>

static char *kStartTimeKey = "kStartTime";
static char *kEndTimeKey = "kEndTime";

@implementation UIViewController (TrackRecord)

+ (void)load {
    [[TrackRecordManager sharedInstance] exchangeMethodWithOriginalClass:self originalSelector:@selector(viewWillAppear:) replaceClass:self replaceSelector:@selector(tr_viewWillAppear:)];
    
    [[TrackRecordManager sharedInstance] exchangeMethodWithOriginalClass:self originalSelector:@selector(viewWillDisappear:) replaceClass:self replaceSelector:@selector(tr_viewWillDisappear:)];
}

- (void)tr_viewWillAppear:(BOOL)animated {
    // 插入埋点代码
    [self addViewWillAppear:animated];
    
    // 调用原来实现
    [self tr_viewWillAppear:animated];
}

- (void)tr_viewWillDisappear:(BOOL)animated {
    // 插入埋点代码
    [self addViewWillDisappear:animated];
    
    // 调用原来实现
    [self tr_viewWillDisappear:animated];
}

- (void)addViewWillAppear:(BOOL)animated {
    // 记录进入时间
    objc_setAssociatedObject(self, kStartTimeKey, [[TrackRecordManager sharedInstance] getCurrentTime], OBJC_ASSOCIATION_COPY);
}

- (void)addViewWillDisappear:(BOOL)animated {
    // 记录退出时间
    objc_setAssociatedObject(self, kEndTimeKey, [[TrackRecordManager sharedInstance] getCurrentTime], OBJC_ASSOCIATION_COPY);
    
    NSDictionary *dic = [TrackRecordManager sharedInstance].configDic[@"PageEvents"][NSStringFromClass([self class])];
    if (dic) {
        // 需要埋点，发送相应数据
        NSMutableDictionary * mutableDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        NSString *startTime = (NSString *)objc_getAssociatedObject(self, kStartTimeKey);
        NSString *endTime = (NSString *)objc_getAssociatedObject(self, kEndTimeKey);
        NSString *duration = [[TrackRecordManager sharedInstance] intervalStarTime:startTime andEndTime:endTime];
        [mutableDic setValue:startTime forKey:@"start_time"];
        [mutableDic setValue:endTime forKey:@"end_time"];
        [mutableDic setValue:duration forKey:@"duration"];
        if ([[TrackRecordManager sharedInstance].delegate respondsToSelector:@selector(TrackRecordVisitWithDictionary:)]) {
            [[TrackRecordManager sharedInstance].delegate TrackRecordVisitWithDictionary:mutableDic];
        }
    }
}

@end
