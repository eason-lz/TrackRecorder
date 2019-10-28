#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UICollectionView+TrackRecord.h"
#import "UIControl+TrackRecord.h"
#import "UITableView+TrackRecord.h"
#import "UITapGestureRecognizer+TrackRecord.h"
#import "UIViewController+TrackRecord.h"
#import "TrackRecordManager.h"

FOUNDATION_EXPORT double TrackRecorderVersionNumber;
FOUNDATION_EXPORT const unsigned char TrackRecorderVersionString[];

