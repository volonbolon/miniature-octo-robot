//
//  OnboardingViewController.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "OnboardingViewController.h"

@interface OnboardingViewController ()
- (IBAction)buttonTapped:(id)sender;
@end

@implementation OnboardingViewController

- (IBAction)buttonTapped:(id)sender {
    
    [[self delegate] onboardingChoosen:[(UIView *)sender tag]];
    
}
@end
