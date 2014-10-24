//
//  OnboardingViewController.h
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, OnboardingSelection) {
    OnboardingSelectionPurple = 1001,
    OnboardingSelectionRed = 1002,
    OnboardingSelectionGreen = 1003,
};

@protocol OnboardingViewControllerDelegate <NSObject>

- (void)onboardingChoosen;

@end

@interface OnboardingViewController : UIViewController
@property (weak) NSObject <OnboardingViewControllerDelegate> *delegate;
@end
