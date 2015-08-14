//
//  AnimationTableRowController.h
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/13/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface AnimationTableRowController : NSObject

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *animationType;
@property (strong, nonatomic) NSString *className;

@end
