//
//  InterfaceController.m
//  WatchActivityIndicator Extension
//
//  Created by Peng on 8/13/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "InterfaceController.h"
#import "NKWActivityIndicatorAnimation.h"
#import "AnimationTableRowController.h"

NSString const *kItemKeyTitle  = @"title";
NSString const *kItemKeyClassName = @"className";

@interface InterfaceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *animationTable;

@property (strong, nonatomic) NSArray *animationTypes;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.animationTypes = @[@{kItemKeyTitle:@"BallScale",
                          kItemKeyClassName:@"BallScaleAnimationDemoController"},
                            
                            @{kItemKeyTitle:@"BallScaleRipple",
                          kItemKeyClassName:@"BallScaleRippleAnimationDemoController"},
                            
                            @{kItemKeyTitle:@"TwoDots",
                              kItemKeyClassName:@"TwoDotsAnimationDemoController"},
                            
                            @{kItemKeyTitle:@"ThreeDots",
                              kItemKeyClassName:@"ThreeDotsAnimationDemoController"},
                            
                            @{kItemKeyTitle:@"BallZigZagDeflect",
                              kItemKeyClassName:@"BallZigZagDeflectAnimationDemoController"},
                            
                            @{kItemKeyTitle:@"BallZigZag",
                              kItemKeyClassName:@"BallZigZagAnimationDemoController"}
                            ];
    [self.animationTable setNumberOfRows:self.animationTypes.count withRowType:@"AnimationTableRowController"];
    
    [self.animationTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        AnimationTableRowController* row = [self.animationTable rowControllerAtIndex:idx];
        
        NSString *title = [(NSDictionary*)obj objectForKey:kItemKeyTitle];
        NSString *className = [(NSDictionary*)obj objectForKey:kItemKeyClassName];
        [row.animationType setText: title];
        row.className = className;
        
    }];

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    

}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    AnimationTableRowController* row = (AnimationTableRowController*)[self.animationTable rowControllerAtIndex:rowIndex];
    
    [self pushControllerWithName:row.className context:nil];
}

@end



