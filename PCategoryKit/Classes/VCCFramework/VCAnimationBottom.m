//
//  VCAnimationBottom.m
//  QunariPhone
//
//  Created by 姜琢 on 13-9-10.
//  Copyright (c) 2013年 Qunar.com. All rights reserved.
//

#import "VCAnimationBottom.h"

@implementation VCAnimationBottom

+ (VCAnimationBottom *)defaultAnimation
{
    return [[VCAnimationBottom alloc] init];
}

- (void)pushAnimationFromTopVC:(UIViewController *)topVC
                    ToArriveVC:(UIViewController *)arriveVC
                WithCompletion:(void (^)(BOOL finished))completion
{
    CGRect frame = [[arriveVC view] frame];
    frame.origin.y = frame.size.height;
    [[arriveVC view] setFrame:frame];
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect frameArriveVC = [[arriveVC view] frame];
                         frameArriveVC.origin.y = 0;
                         [[arriveVC view] setFrame:frameArriveVC];
                     }
                     completion:completion];
}

- (void)popAnimationFromTopVC:(UIViewController *)topVC
                   ToArriveVC:(UIViewController *)arriveVC
               WithCompletion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGRect frameArriveVC = [[arriveVC view] frame];
                         frameArriveVC.origin.y = frameArriveVC.size.height;
                         [[topVC view] setFrame:frameArriveVC];
                     }
                     completion:completion];
}

@end
