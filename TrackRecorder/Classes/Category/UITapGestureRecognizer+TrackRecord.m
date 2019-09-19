//
//  UITapGestureRecognizer+TrackRecord.m
//  trtest
//
//  Created by eason on 2019/9/3.
//  Copyright © 2019 普惠. All rights reserved.
//

#import "UITapGestureRecognizer+TrackRecord.h"
#import "TrackRecordManager.h"


@implementation UITapGestureRecognizer (TrackRecord)

+ (void)load {
    [[TrackRecordManager sharedInstance] exchangeMethodWithOriginalClass:self originalSelector:@selector(addTarget:action:) replaceClass:self replaceSelector:@selector(tr_addTarget:action:)];
}

- (void)tr_addTarget:(id)target action:(SEL)action {
    if ([self isKindOfClass:[UITapGestureRecognizer class]]) {
        // 插入处理手势代码
        [self tr_addTarget:self action:@selector(tapCustomeAction:)];
        // 调用原来实现
        [self tr_addTarget:target action:action];
    }
}

- (void)tapCustomeAction:(UITapGestureRecognizer *)gesture {
    NSString *targetName = NSStringFromClass([[[TrackRecordManager sharedInstance] getViewControllerWithTarget:gesture.view] class]);
    NSInteger tag = gesture.view.tag;
    NSDictionary *dic = [TrackRecordManager sharedInstance].configDic[@"TapEvents"][targetName][[NSString stringWithFormat:@"%ld",(long)tag]];
    if (dic) {
        // 需要埋点，发送相应数据
        if ([[TrackRecordManager sharedInstance].delegate respondsToSelector:@selector(TrackRecordClickWithDictionary:)]) {
            [[TrackRecordManager sharedInstance].delegate TrackRecordClickWithDictionary:dic];
        }
    }
    /*
    NSArray *itemArray = [TrackRecordManager sharedInstance].configDic[@"TapEvents"][targetName];
    if (itemArray.count > 0) {
        for (int i = 0; i < itemArray.count; i ++) {
            NSDictionary *dic = itemArray[i];
            if ([dic[@"view_tag"] integerValue] == tag) {
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

