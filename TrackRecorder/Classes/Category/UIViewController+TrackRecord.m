//
//  UIViewController+TrackRecord.m
//  TrackRecord
//
//  Created by eason on 2019/8/29.
//  Copyright © 2019 普惠. All rights reserved.
//

#import "UIViewController+TrackRecord.h"
#import "TrackRecordManager.h"


@implementation UIViewController (TrackRecord)

+ (void)load {
    [[TrackRecordManager sharedInstance] exchangeMethodWithOriginalClass:self originalSelector:@selector(viewWillAppear:) replaceClass:self replaceSelector:@selector(tr_viewWillAppear:)];
}

- (void)tr_viewWillAppear:(BOOL)animated {
    // 插入埋点代码
    [self addViewWillAppear:animated];
    
    // 调用原来实现
    [self tr_viewWillAppear:animated];
}

- (void)addViewWillAppear:(BOOL)animated {
    NSDictionary *dic = [TrackRecordManager sharedInstance].configDic[@"PageEvents"][NSStringFromClass([self class])];
    if (dic) {
        // 需要埋点，发送相应数据
        if ([[TrackRecordManager sharedInstance].delegate respondsToSelector:@selector(TrackRecordVisitWithDictionary:)]) {
            [[TrackRecordManager sharedInstance].delegate TrackRecordVisitWithDictionary:dic];
        }
    }
}

@end
