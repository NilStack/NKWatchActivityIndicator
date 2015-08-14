//
//  NKWActivityIndicatorBallZigZagAnimation.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/14/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <UIKit/UIKit.h>
#import "NKWActivityIndicatorBallZigZagAnimation.h"

@implementation NKWActivityIndicatorBallZigZagAnimation

- (UIImage *)drawImageWithSize:(CGSize)size tintColor:(UIColor *)tintColor
{
    CGFloat scale = [WKInterfaceDevice currentDevice].screenScale;
    
    UIGraphicsBeginImageContextWithOptions(size, false, scale);

    CGPoint center = CGPointMake(size.width/2.0, size.height/2);
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    CGFloat radius = MIN(size.width/2.0, size.height/2.0) / 2.0;
    [circlePath addArcWithCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    [tintColor setFill];
    [circlePath fill];

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)setupAnimationInController:(WKInterfaceController*)controller Images:(NSArray*)images withSize:(CGSize)size tintColor:(UIColor *)tintColor duration:(CGFloat)duration
{
    NSAssert([images count] == 2, @"Ball ZigZag Deflect animation needs two images.");
    
    UIImage *topBall = [self drawImageWithSize:size tintColor:tintColor];
    
    UIImage *bottomBall = [self drawImageWithSize:size tintColor:tintColor];
    
    WKInterfaceImage *topBallImage = [images objectAtIndex:0];
    WKInterfaceImage *bottomBallImage = [images objectAtIndex:1];
    
    [topBallImage setImage:topBall];
    [bottomBallImage setImage:bottomBall];
    
    [topBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentCenter];
    [topBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentBottom];
    
    [bottomBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentCenter];
    [bottomBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentTop];
    
    [controller animateWithDuration:duration/3.0 animations:^{
        
        [topBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentLeft];
        [topBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentTop];
        
        
        [bottomBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentRight];
        [bottomBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentBottom];
    }];
    
    dispatch_time_t firstDelay = dispatch_time(DISPATCH_TIME_NOW, duration/3.0 *NSEC_PER_SEC);
    dispatch_after(firstDelay, dispatch_get_main_queue(), ^{
        
        [controller animateWithDuration:duration/3.0 animations:^{
            
            [topBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentRight];
            [topBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentTop];
            
            
            [bottomBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentLeft];
            [bottomBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentBottom];
        }];
        
    });
    
    dispatch_time_t secondDelay = dispatch_time(DISPATCH_TIME_NOW, duration*2/3.0 *NSEC_PER_SEC);
    dispatch_after(secondDelay, dispatch_get_main_queue(), ^{
        
        [controller animateWithDuration:duration/3.0 animations:^{
            
            [topBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentCenter];
            [topBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentBottom];
            
            [bottomBallImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentCenter];
            [bottomBallImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentTop];
            
        }];
        
    });
    
}

@end
