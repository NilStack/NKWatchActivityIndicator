//
//  NKWActivityIndicatorAnimation.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/13/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "NKWActivityIndicatorAnimation.h"
#import "NKWActivityIndicatorAnimationProtocol.h"
#import "NKWActivityIndicatorBallScaleAnimation.h"
#import "NKWActivityIndicatorBallScaleRippleAnimation.h"
#import "NKWActivityIndicatorTwoDotsAnimation.h"
#import "NKWActivityIndicatorThreeDotsAnimation.h"
#import "NKWActivityIndicatorBallZigZagDeflectAnimation.h"
#import "NKWActivityIndicatorBallZigZagAnimation.h"

@implementation NKWActivityIndicatorAnimation

#pragma mark -
#pragma mark Constructors

- (id)initWithType:(NKWActivityIndicatorAnimationType)type controller:(WKInterfaceController*)controller images:(NSArray*)images
{

    CGSize size = controller.contentFrame.size;
    return [self initWithType:type controller:controller images:(NSArray*)images tintColor:[UIColor whiteColor] size:size duration:1.0];
}

- (id)initWithType:(NKWActivityIndicatorAnimationType)type controller:(WKInterfaceController*)controller images:(NSArray*)images tintColor:(UIColor *)tintColor {
    
    CGSize size = controller.contentFrame.size;
    return [self initWithType:type controller:controller images:(NSArray*)images tintColor:tintColor size:size duration:1.0];
}

- (id)initWithType:(NKWActivityIndicatorAnimationType)type controller:(WKInterfaceController*)controller images:(NSArray*)images tintColor:(UIColor *)tintColor size:(CGSize)size {
    
    return [self initWithType:type controller:controller images:(NSArray*)images tintColor:tintColor size:size duration:1.0];
}

- (id)initWithType:(NKWActivityIndicatorAnimationType)type  controller:(WKInterfaceController*)controller images:(NSArray*)images tintColor:(UIColor *)tintColor size:(CGSize)size duration:(CGFloat)duration
{
    
    self = [super init];
    if (self) {
        _type = type;
        _controller = controller;
        _images = images;
        _size = size;
        _tintColor = tintColor;
        _duration = duration;
    }
    return self;
}

#pragma mark -
#pragma mark Methods

- (void)setupAnimation
{
    id<NKWActivityIndicatorAnimationProtocol> animation = [NKWActivityIndicatorAnimation activityIndicatorAnimationForAnimationType:_type];
    
    if ([animation respondsToSelector:@selector(setupAnimationInController:Images:withSize:tintColor:duration:)]) {
        [animation setupAnimationInController:_controller Images:_images withSize:_size tintColor:_tintColor duration:_duration];
        
    }
    
}

- (void)startAnimating
{
    
    self.indicatorTimer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(setupAnimation) userInfo:nil repeats:YES];
    _animating = YES;
}

- (void)stopAnimating
{
    
    [self.indicatorTimer invalidate];
    self.indicatorTimer = nil; // ????
    _animating = NO;
}

#pragma mark -
#pragma mark Getters

+ (id<NKWActivityIndicatorAnimationProtocol>)activityIndicatorAnimationForAnimationType:(NKWActivityIndicatorAnimationType)type {
    switch (type) {
        case NKWActivityIndicatorAnimationTypeBallScale:
            return [[NKWActivityIndicatorBallScaleAnimation alloc] init];
        case NKWActivityIndicatorAnimationTypeBallScaleRipple:
            return [[NKWActivityIndicatorBallScaleRippleAnimation alloc] init];
        case NKWActivityIndicatorAnimationTypeTwoDotsAnimation:
            return [[NKWActivityIndicatorTwoDotsAnimation alloc] init];
        case NKWActivityIndicatorAnimationTypeThreeDotsAnimation:
            return [[NKWActivityIndicatorThreeDotsAnimation alloc] init];
        case NKWActivityIndicatorAnimationTypeBallZigZagDeflectAnimation:
            return [[NKWActivityIndicatorBallZigZagDeflectAnimation alloc] init];
        case NKWActivityIndicatorAnimationTypeBallZigZagAnimation:
            return [[NKWActivityIndicatorBallZigZagAnimation alloc] init];
    }
    
    return nil;
}

@end
