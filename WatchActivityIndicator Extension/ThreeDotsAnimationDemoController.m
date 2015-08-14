//
//  ThreeDotsAnimationDemoController.m
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/14/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "ThreeDotsAnimationDemoController.h"
#import "NKWActivityIndicatorAnimation.h"

@interface ThreeDotsAnimationDemoController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *leftDotImage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *centerDotImage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *rightDotImage;

@property (strong, nonatomic) NKWActivityIndicatorAnimation *animation;

@end

@implementation ThreeDotsAnimationDemoController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.animation = [[NKWActivityIndicatorAnimation alloc] initWithType:NKWActivityIndicatorAnimationTypeThreeDotsAnimation controller:self images:@[self.leftDotImage, self.centerDotImage, self.rightDotImage] tintColor:[UIColor whiteColor] size:CGSizeMake(self.contentFrame.size.width*0.2, self.contentFrame.size.height*0.2) duration:1.0];
    
    [self.animation startAnimating];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    [self.animation stopAnimating];
}

@end



