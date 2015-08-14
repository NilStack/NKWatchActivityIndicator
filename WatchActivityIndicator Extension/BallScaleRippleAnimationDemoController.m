//
//  BallScaleRippleAnimationDemoController.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/14/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "BallScaleRippleAnimationDemoController.h"
#import "NKWActivityIndicatorAnimation.h"

@interface BallScaleRippleAnimationDemoController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *indicatorImage;
@property (strong, nonatomic) NKWActivityIndicatorAnimation *animation;

@end

@implementation BallScaleRippleAnimationDemoController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.animation = [[NKWActivityIndicatorAnimation alloc] initWithType:NKWActivityIndicatorAnimationTypeBallScaleRipple controller:self images:@[self.indicatorImage]];
    
    [self.animation startAnimating];

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    [self.animation stopAnimating];
}

@end



