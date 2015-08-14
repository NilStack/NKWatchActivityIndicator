//
//  TwoDotsAnimationDemoController.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/14/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "TwoDotsAnimationDemoController.h"
#import "NKWActivityIndicatorAnimation.h"

@interface TwoDotsAnimationDemoController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *leftDotImage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *rightDotImage;

@property (strong, nonatomic) NKWActivityIndicatorAnimation *animation;

@end

@implementation TwoDotsAnimationDemoController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.animation = [[NKWActivityIndicatorAnimation alloc] initWithType:NKWActivityIndicatorAnimationTypeTwoDotsAnimation controller:self images:@[self.leftDotImage, self.rightDotImage] tintColor:[UIColor whiteColor] size:CGSizeMake(self.contentFrame.size.width/2.0, self.contentFrame.size.height) duration:2.0];
    
    [self.animation startAnimating];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    [self.animation stopAnimating];
}

@end



