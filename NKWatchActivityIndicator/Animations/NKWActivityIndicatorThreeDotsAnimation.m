//
//  NKWActivityIndicatorThreeDotsAnimation.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/14/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <UIKit/UIKit.h>
#import "NKWActivityIndicatorThreeDotsAnimation.h"

@implementation NKWActivityIndicatorThreeDotsAnimation

- (UIImage *)drawImageWithSize:(CGSize)size tintColor:(UIColor *)tintColor
{
    CGFloat scale = [WKInterfaceDevice currentDevice].screenScale;
    
    UIGraphicsBeginImageContextWithOptions(size, false, scale);
    
    CGPoint center = CGPointMake(size.width/2.0, size.height/2);
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    CGFloat radius = MIN(size.width, size.height) / 4.0;
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
    NSAssert([images count] == 3, @"Three dots animation needs three images.");
    
    UIImage *leftDot = [self drawImageWithSize:size tintColor:tintColor];
    UIImage *centerDot = [self drawImageWithSize:size tintColor:tintColor];
    UIImage *rightDot = [self drawImageWithSize:size tintColor:tintColor];
    
    WKInterfaceImage *leftDotImage = [images objectAtIndex:0];
    WKInterfaceImage *centerDotImage = [images objectAtIndex:1];
    WKInterfaceImage *rightDotImage = [images objectAtIndex:2];

    [leftDotImage setImage:leftDot];
    [centerDotImage setImage:centerDot];
    [rightDotImage setImage:rightDot];
    
    [leftDotImage setAlpha:1];
    [leftDotImage setWidth:size.width];
    [leftDotImage setHeight:size.height];
    
    [centerDotImage setAlpha:1];
    [centerDotImage setWidth:size.width];
    [centerDotImage setHeight:size.height];
    
    [rightDotImage setAlpha:1];
    [rightDotImage setWidth:size.width];
    [rightDotImage setHeight:size.height];
    //[image setVerticalAlignment:WKInterfaceObjectVerticalAlignmentCenter];
    //[image setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentCenter];
    
    [controller animateWithDuration:duration/2.0 animations:^{
        
        [leftDotImage setAlpha:0.3];
        [leftDotImage setWidth:size.width*0.6];
        [leftDotImage setHeight:size.height*0.6];
        
        [centerDotImage setAlpha:0.3];
        [centerDotImage setWidth:size.width*0.6];
        [centerDotImage setHeight:size.height*0.6];
        
        
        [rightDotImage setAlpha:0.3];
        [rightDotImage setWidth:size.width*0.6];
        [rightDotImage setHeight:size.height*0.6];
        
        
        
    }];
    
    dispatch_time_t completionDelay = dispatch_time(DISPATCH_TIME_NOW, duration/2.0 *NSEC_PER_SEC);
    dispatch_after(completionDelay, dispatch_get_main_queue(), ^{
        
        [controller animateWithDuration:duration/2.0 animations:^{
            [leftDotImage setImage:leftDot];
            [centerDotImage setImage:centerDot];
            [rightDotImage setImage:rightDot];
            
            [leftDotImage setAlpha:1];
            [leftDotImage setWidth:size.width];
            [leftDotImage setHeight:size.height];
            
            [centerDotImage setAlpha:1];
            [centerDotImage setWidth:size.width];
            [centerDotImage setHeight:size.height];
            
            [rightDotImage setAlpha:1];
            [rightDotImage setWidth:size.width];
            [rightDotImage setHeight:size.height];
            
        }];
        
    });
    
}

@end
