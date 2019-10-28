//
//  TrackRecordManager.h
//  TrackRecord
//
//  Created by eason on 2019/8/29.
//  Copyright © 2019 tr. All rights reserved.
//
//  埋点manager

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TrackRecordDelegate <NSObject>

// 点击
- (void)TrackRecordClickWithDictionary:(NSDictionary *)dic;

// 访问
- (void)TrackRecordVisitWithDictionary:(NSDictionary *)dic;

@end

@interface TrackRecordManager : NSObject

@property (nonatomic, copy) NSDictionary *configDic;
@property (nonatomic, weak) id<TrackRecordDelegate> delegate;

+ (instancetype)sharedInstance;

- (id)getViewControllerWithTarget:(id)target;

// 交换方法
- (void)exchangeMethodWithOriginalClass:(Class)originalclass originalSelector:(SEL)originalselector replaceClass:(Class)replaceclass replaceSelector:(SEL)replaceselector;

// 添加方法并交换
- (void)addAndExangeMethodWithDelegateClass:(Class)delegateclass originalSelector:(SEL)originalselector originalClass:(Class)originalclass replaceSelector:(SEL)replaceselector;

// 获取当前时间
- (NSString *)getCurrentTime;

// 计算时长
- (NSString *)intervalStarTime:(NSString *)starTime andEndTime:(NSString *)endTime;

@end

NS_ASSUME_NONNULL_END
