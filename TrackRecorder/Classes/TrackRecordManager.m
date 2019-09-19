//
//  TrackRecordManager.m
//  TrackRecord
//
//  Created by eason on 2019/8/29.
//  Copyright © 2019 普惠. All rights reserved.
//


#import "TrackRecordManager.h"

@implementation TrackRecordManager

+ (instancetype)sharedInstance
{
    static TrackRecordManager * instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TrackRecordManager alloc] init];
        instance.configDic = [instance getConfigDict];
    });
    return instance;
}

- (NSDictionary *)getConfigDict {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TrackRecordConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

// 获取控制器
- (id)getViewControllerWithTarget:(id)target {
    id nextResponder = [target nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    }else if ([nextResponder isKindOfClass:[UIView class]]){
        return [self getViewControllerWithTarget:nextResponder];
    }else {
        return nil;
    }
}

// 交换方法
- (void)exchangeMethodWithOriginalClass:(Class)originalclass originalSelector:(SEL)originalselector replaceClass:(Class)replaceclass replaceSelector:(SEL)replaceselector {
    
    Method method1 = class_getInstanceMethod(originalclass, originalselector);
    Method method2 = class_getInstanceMethod(replaceclass, replaceselector);
    method_exchangeImplementations(method1, method2);
}

// 添加方法并交换
- (void)addAndExangeMethodWithDelegateClass:(Class)delegateclass originalSelector:(SEL)originalselector originalClass:(Class)originalclass replaceSelector:(SEL)replaceselector {
    
    // 起初的方法
    Method originalMethod = class_getInstanceMethod(delegateclass, originalselector);
    // 替换的方法
    Method replaceMethod = class_getInstanceMethod(originalclass, replaceselector);
    IMP replaceMethodIMP = method_getImplementation(replaceMethod);
    
    // 将替换的方法往代理类中添加
    BOOL didAddMethod = class_addMethod(delegateclass, replaceselector, replaceMethodIMP, method_getTypeEncoding(replaceMethod));
    if (didAddMethod) {
        // 添加成功
        NSLog(@"class_addMethod succeed -->(%@)", NSStringFromSelector(replaceselector));
        // 获取新方法在代理类中的地址
        Method newMethod = class_getInstanceMethod(delegateclass, replaceselector);
        // 交换原方法和自定义方法
        method_exchangeImplementations(originalMethod, newMethod);
    }else {
        // 如果添加失败，则证明自定义方法在代理方法中，直接进行交互
        method_exchangeImplementations(originalMethod, replaceMethod);
    }
}
@end
