//
//  UITableView+TrackRecord.m
//  trtest
//
//  Created by eason on 2019/9/4.
//  Copyright © 2019 tr. All rights reserved.
//

#import "UITableView+TrackRecord.h"
#import "TrackRecordManager.h"

@implementation UITableView (TrackRecord)
+ (void)load {
    [[TrackRecordManager sharedInstance] exchangeMethodWithOriginalClass:self originalSelector:@selector(setDelegate:) replaceClass:self replaceSelector:@selector(tr_setDelegate:)];
}

- (void)tr_setDelegate:(id<UITableViewDelegate>)delegate {
    // 调用原来实现
    [self tr_setDelegate:delegate];
    
    Class delegateClass = [delegate class];
    Class originalClass = [self class];
    SEL originalSel = @selector(tableView:didSelectRowAtIndexPath:);
    SEL replaceSel = @selector(tr_tableView:didSelectRowAtIndexPath:);
 
    [[TrackRecordManager sharedInstance] addAndExangeMethodWithDelegateClass:delegateClass originalSelector:originalSel originalClass:originalClass replaceSelector:replaceSel];
}

- (void)tr_tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{

    [self tr_tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    // 交换后的方法
    NSString *targetName = NSStringFromClass([[[TrackRecordManager sharedInstance] getViewControllerWithTarget:tableView] class]);
    NSDictionary *dic = [TrackRecordManager sharedInstance].configDic[@"TableViewEvents"][targetName][[NSString stringWithFormat:@"%ld",indexPath.section]][[NSString stringWithFormat:@"%ld",indexPath.row]];
    if (dic) {
        // 需要埋点
        if ([[TrackRecordManager sharedInstance].delegate respondsToSelector:@selector(TrackRecordClickWithDictionary:)]) {
            [[TrackRecordManager sharedInstance].delegate TrackRecordClickWithDictionary:dic];
        }
    }
}
@end
