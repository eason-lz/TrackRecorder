//
//  UIColor+ArmColor.m
//  TrackRecorderTest
//
//  Created by eason on 2019/9/24.
//  Copyright © 2019 tr. All rights reserved.
//

#import "UIColor+ArmColor.h"

@implementation UIColor (ArmColor)

+ (UIColor *)armColor {
    CGFloat red = (arc4random()%256)/255.0;
    CGFloat green = (arc4random()%256)/255.0;
    CGFloat blue = (arc4random()%256)/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end
