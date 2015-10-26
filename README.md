#NKWatchActivityIndicator#

![Verision](https://img.shields.io/badge/pod-v0.1.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-watchOS-ff69b4.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

An activity indicator library for Apple Watch and a sample to **push the limits of animation in watchOS 2**. We are trying to implement beautiful indicators in [this fork of DGActivityIndicatorView](https://github.com/ninjaprox/DGActivityIndicatorView) and support ball scale, ball scale ripple, tow dots, three dots, ball zigzag, ball zigzag deflect animations now and will integrate more.
**Static screenshots can't show the animation effect, please make sure see the gif below.**

![gif](https://db.tt/UAWEZ1AF)

##Usage##

###Cocoapods###

In your watchOS target

    pod 'NKWatchActivityIndicator'
    
Then

    pod install
    
And

    #import "NKWActivityIndicatorAnimation.h"

[Using Cocoapods with watchOS 2](https://medium.com/@JTEhlert/using-cocoapods-with-watchos-2-723b92eae04f) by Justin Ehlert

[Integrating CocoaPods into native watchOS targets](https://github.com/neonichu/native-watchOS-example) by Boris Bügling

###Copy NKWatchActivityIndicator folder to watch app extension ###

######Note: because the limition of WatchKit, maybe you need to use similiar UI elements and layouts as we did in demo for some animation effects

##Requirements##
* watchOS ~> 2.0
* Xcode >= 7.0

##Examples##
Add and layout UI elements in storyboard as we did in demo or customize to meet your requirements
Then 
   
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


##TODO##
* more testing
* refactoring
* more indicator types

##License##
This code is distributed under the terms and conditions of the MIT license.

##Thanks##
Awesome activity indicator library [DGActivityIndicatorView](https://github.com/ninjaprox/DGActivityIndicatorView)
