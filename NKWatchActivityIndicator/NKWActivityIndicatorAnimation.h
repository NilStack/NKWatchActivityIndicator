//
//  NKWActivityIndicatorAnimation.h
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/13/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>

typedef NS_ENUM(NSUInteger, NKWActivityIndicatorAnimationType)
{
    NKWActivityIndicatorAnimationTypeBallScale,
    NKWActivityIndicatorAnimationTypeBallScaleRipple,
    NKWActivityIndicatorAnimationTypeTwoDotsAnimation,
    NKWActivityIndicatorAnimationTypeThreeDotsAnimation,
    NKWActivityIndicatorAnimationTypeBallZigZagDeflectAnimation,
    NKWActivityIndicatorAnimationTypeBallZigZagAnimation
    
};

@interface NKWActivityIndicatorAnimation : NSObject

- (id)initWithType:(NKWActivityIndicatorAnimationType)type controller:(WKInterfaceController*)controller images:(NSArray*)images;

- (id)initWithType:(NKWActivityIndicatorAnimationType)type controller:(WKInterfaceController*)controller images:(NSArray*)images tintColor:(UIColor *)tintColor;

- (id)initWithType:(NKWActivityIndicatorAnimationType)type controller:(WKInterfaceController*)controller images:(NSArray*)images tintColor:(UIColor *)tintColor size:(CGSize)size;

- (id)initWithType:(NKWActivityIndicatorAnimationType)type  controller:(WKInterfaceController*)controller images:(NSArray*)images tintColor:(UIColor *)tintColor size:(CGSize)size duration:(CGFloat)duration;

@property (nonatomic, weak) WKInterfaceController* controller;
@property (nonatomic) WKInterfaceImage *image;
@property (nonatomic) NSArray<WKInterfaceImage *> *images;

@property (nonatomic) NKWActivityIndicatorAnimationType type;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic) CGSize size;
@property (nonatomic) CGFloat duration;

@property (strong, nonatomic) NSTimer *indicatorTimer;

@property (nonatomic, readonly) BOOL animating;

- (void)startAnimating;
- (void)stopAnimating;

@end
