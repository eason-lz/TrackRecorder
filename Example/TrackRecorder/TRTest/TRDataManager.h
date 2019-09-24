//
//  TRDataManager.h
//  TrackRecorderTest
//
//  Created by eason on 2019/9/23.
//  Copyright © 2019 tr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRDataManager : NSObject

+ (instancetype)sharedInstance;

- (void)addProtocol;
@end

NS_ASSUME_NONNULL_END
