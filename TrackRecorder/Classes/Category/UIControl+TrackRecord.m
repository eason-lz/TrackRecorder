//
//  UIControl+TrackRecord.m
//  TrackRecord
//
//  Created by eason on 2019/8/29.
//  Copyright © 2019 普惠. All rights reserved.
//

#import "UIControl+TrackRecord.h"
#import "TrackRecordManager.h"

@implementation UIControl (TrackRecord)

+ (void)load {
    [[TrackRecordManager sharedInstance] exchangeMethodWithOriginalClass:self originalSelector:@selector(sendAction:to:forEvent:) replaceClass:self replaceSelector:@selector(tr_sendAction:to:forEvent:)];
}

- (void)tr_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    // 插入埋点代码
    [self addTRAction:action to:target forEvent:event];
    // 调用原来实现
    [self tr_sendAction:action to:target forEvent:event];
}

- (void)addTRAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSString *targetName;
    if ([target isKindOfClass:[UIViewController class]]) {
        targetName = NSStringFromClass([target class]);
    }else if ([target isKindOfClass:[UIView class]]) {
        targetName = NSStringFromClass([[[TrackRecordManager sharedInstance] getViewControllerWithTarget:target] class]);
    }else {
        return;
    }
    NSDictionary *dic = [TrackRecordManager sharedInstance].configDic[@"ControlEvents"][targetName][NSStringFromSelector(action)];
    if (dic) {
        // 需要埋点，发送相应数据
        if ([[TrackRecordManager sharedInstance].delegate respondsToSelector:@selector(TrackRecordClickWithDictionary:)]) {
            [[TrackRecordManager sharedInstance].delegate TrackRecordClickWithDictionary:dic];
        }
    }
    /*
    NSArray *itemArray = [TrackRecordManager sharedInstance].configDic[@"ControlEvents"][targetName];
    if (itemArray.count > 0) {
        for (int i = 0; i < itemArray.count; i ++) {
            NSDictionary *dic = itemArray[i];
            if ([dic[@"action_name"] isEqualToString:NSStringFromSelector(action)]) {
                // 需要埋点，发送相应数据
                if ([[TrackRecordManager sharedInstance].delegate respondsToSelector:@selector(TrackRecordClickWithDictionary:)]) {
                    [[TrackRecordManager sharedInstance].delegate TrackRecordClickWithDictionary:dic];
                }

            }
        }
    }
     */
}



@end
