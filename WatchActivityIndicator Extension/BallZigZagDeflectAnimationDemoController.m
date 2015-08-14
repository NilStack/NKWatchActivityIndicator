//
//  BallZigZagDeflectAnimationDemoController.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/14/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "BallZigZagDeflectAnimationDemoController.h"
#import "NKWActivityIndicatorAnimation.h"

@interface BallZigZagDeflectAnimationDemoController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *topBallImage;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *bottomBallImage;

@property (strong, nonatomic) NKWActivityIndicatorAnimation *animation;

@end

@implementation BallZigZagDeflectAnimationDemoController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.animation = [[NKWActivityIndicatorAnimation alloc] initWithType:NKWActivityIndicatorAnimationTypeBallZigZagDeflectAnimation controller:self images:@[self.topBallImage, self.bottomBallImage] tintColor:[UIColor whiteColor] size:CGSizeMake(20, 20) duration:2.0];
    
    [self.animation startAnimating];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    [self.animation stopAnimating];

}

@end



