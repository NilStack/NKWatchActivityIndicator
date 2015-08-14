//
//  NKWActivityIndicatorAnimationProtocol.h
//  NKWatchActivityIndicatorDemo
//
//  Created by Peng on 8/13/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>

@protocol NKWActivityIndicatorAnimationProtocol <NSObject>

- (void)setupAnimationInController:(WKInterfaceController*)controller Images:(NSArray*)images withSize:(CGSize)size tintColor:(UIColor *)tintColor duration:(CGFloat)duration;

@end
