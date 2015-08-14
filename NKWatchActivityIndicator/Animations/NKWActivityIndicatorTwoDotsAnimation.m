//
//  NKWActivityIndicatorTwoDotsAnimation.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/14/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <UIKit/UIKit.h>
#import "NKWActivityIndicatorTwoDotsAnimation.h"

@implementation NKWActivityIndicatorTwoDotsAnimation

- (UIImage *)drawImageWithSize:(CGSize)size center:(CGPoint)center tintColor:(UIColor *)tintColor
{
    CGFloat scale = [WKInterfaceDevice currentDevice].screenScale;
    
    UIGraphicsBeginImageContextWithOptions(size, false, scale);
    
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    CGFloat radius = MIN(size.width/2.0, size.height/2.0) / 2.0;
    [circlePath addArcWithCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    circlePath.lineWidth = 2.0;
    
    [tintColor setFill];
    [circlePath fill];
    [tintColor setStroke];
    [circlePath stroke];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
    
}

- (void)setupAnimationInController:(WKInterfaceController*)controller Images:(NSArray*)images withSize:(CGSize)size tintColor:(UIColor *)tintColor duration:(CGFloat)duration
{
    
    NSAssert([images count] == 2, @"Two dots animation needs two images.");
    
    WKInterfaceImage *leftDotImage = (WKInterfaceImage *)[images objectAtIndex:0];
    WKInterfaceImage *rightDotImage = (WKInterfaceImage *)[images objectAtIndex:1];
    
    UIImage *leftDot = [self drawImageWithSize:size center:CGPointMake(size.width/2.0+14, size.height/2) tintColor:tintColor];
    UIImage *rightDot = [self drawImageWithSize:size center:CGPointMake(size.width/2.0-14, size.height/2) tintColor:tintColor];
    
    [leftDotImage setImage:leftDot];
    [rightDotImage setImage:rightDot];
    
    [leftDotImage setAlpha:0.0];
    [leftDotImage setWidth:0.0];
    [leftDotImage setHeight:0.0];
    [leftDotImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentCenter];
    [leftDotImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentRight];
    
    [rightDotImage setAlpha:1];
    [rightDotImage setWidth:size.width];
    [rightDotImage setHeight:size.height];
    [rightDotImage setVerticalAlignment:WKInterfaceObjectVerticalAlignmentCenter];
    [rightDotImage setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentLeft];
    
    [controller animateWithDuration:duration/2.0 animations:^{
        [leftDotImage setWidth:size.width];
        [leftDotImage setHeight:size.height];
        [leftDotImage setAlpha:1];
        
        [rightDotImage setAlpha:0.0];
        [rightDotImage setWidth:0.0];
        [rightDotImage setHeight:0.0];
        
        dispatch_time_t completionDelay = dispatch_time(DISPATCH_TIME_NOW, duration/2.0 *NSEC_PER_SEC);
        dispatch_after(completionDelay, dispatch_get_main_queue(), ^{
            
            [controller animateWithDuration:duration/2.0 animations:^{
                [leftDotImage setAlpha:0.0];
                [leftDotImage setWidth:0.0];
                [leftDotImage setHeight:0.0];
                
                
                [rightDotImage setAlpha:1];
                [rightDotImage setWidth:size.width];
                [rightDotImage setHeight:size.height];
                
            }];
            
        });

        
    }];
}

@end
