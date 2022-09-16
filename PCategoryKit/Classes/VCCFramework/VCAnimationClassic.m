//
//  VCPushAnimation.m
//  QunariPhone
//
//  Created by 姜琢 on 12-11-12.
//  Copyright (c) 2012年 Qunar.com All rights reserved.
//

#import "VCAnimationClassic.h"

@implementation VCAnimationClassic

+ (VCAnimationClassic *)defaultAnimation
{
    return [[VCAnimationClassic alloc] init];
}

- (void)pushAnimationFromTopVC:(UIViewController *)topVC
					ToArriveVC:(UIViewController *)arriveVC
				WithCompletion:(void (^)(BOOL finished))completion
{
    CGRect frame = [[arriveVC view] frame];
    frame.origin.x = frame.size.width;
    [[arriveVC view] setFrame:frame];
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect frameTopVC = [[topVC view] frame];
                         CGRect frameArriveVC = [[arriveVC view] frame];
                         
                         frameTopVC.origin.x = -frameTopVC.size.width;
                         [[topVC view] setFrame:frameTopVC];
                         
                         frameArriveVC.origin.x = 0;
                         [[arriveVC view] setFrame:frameArriveVC];
                     }
                     completion:completion];
}

- (void)popAnimationFromTopVC:(UIViewController *)topVC
				   ToArriveVC:(UIViewController *)arriveVC
			   WithCompletion:(void (^)(BOOL finished))completion
{
    CGRect frame = [[arriveVC view] frame];
    frame.origin.x = -frame.size.width;
    [[arriveVC view] setFrame:frame];

    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGRect frameTopVC = [[topVC view] frame];
                         CGRect frameArriveVC = [[arriveVC view] frame];

                         frameTopVC.origin.x = frameTopVC.size.width;
                         [[topVC view] setFrame:frameTopVC];
                         
                         frameArriveVC.origin.x = 0;
                         [[arriveVC view] setFrame:frameArriveVC];
                     }
                     completion:completion];
}

@end
