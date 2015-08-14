//
//  BallScaleAnimationDemoController.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/13/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "BallScaleAnimationDemoController.h"
#import "NKWActivityIndicatorAnimation.h"

@interface BallScaleAnimationDemoController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *indicatorImage;
@property (strong, nonatomic) NKWActivityIndicatorAnimation *animation;

@end

@implementation BallScaleAnimationDemoController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.animation = [[NKWActivityIndicatorAnimation alloc] initWithType:NKWActivityIndicatorAnimationTypeBallScale controller:self images:@[self.indicatorImage]];
    
    [self.animation startAnimating];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    [self.animation stopAnimating];

}

@end



