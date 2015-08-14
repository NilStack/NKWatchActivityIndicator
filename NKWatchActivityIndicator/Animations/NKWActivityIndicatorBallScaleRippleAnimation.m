//
//  NKWActivityIndicatorBallScaleRippleAnimation.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/13/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import "NKWActivityIndicatorBallScaleRippleAnimation.h"

@implementation NKWActivityIndicatorBallScaleRippleAnimation

- (UIImage *)drawImageWithSize:(CGSize)size tintColor:(UIColor *)tintColor
{
    CGFloat scale = [WKInterfaceDevice currentDevice].screenScale;
    
    UIGraphicsBeginImageContextWithOptions(size, false, scale);
    
    CGPoint center = CGPointMake(size.width/2.0, size.height/2);
    CGFloat radius = MIN(size.width/2.0, size.height/2.0) / 2.0;
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    circlePath.lineWidth = 4.0;
    
    [tintColor setStroke];
    [circlePath stroke];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
    
}

- (void)setupAnimationInController:(WKInterfaceController*)controller Images:(NSArray*)images withSize:(CGSize)size tintColor:(UIColor *)tintColor duration:(CGFloat)duration
{
    NSAssert([images count] == 1, @"Ball scale ripple animation needs one image.");
    WKInterfaceImage *image = (WKInterfaceImage *)[images objectAtIndex:0];
    
    UIImage *img = [self drawImageWithSize:size tintColor:tintColor];
    
    [image setImage:img];
    
    [image setAlpha:1];
    [image setWidth:0.0];
    [image setHeight:0.0];
    [image setVerticalAlignment:WKInterfaceObjectVerticalAlignmentCenter];
    [image setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentCenter];
    
    [controller animateWithDuration:duration animations:^{
        [image setWidth:size.width];
        [image setHeight:size.height];
        
        [image setAlpha:0];
        
    }];
    
}

@end
