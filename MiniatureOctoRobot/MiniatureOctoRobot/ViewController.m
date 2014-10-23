//
//  ViewController.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "OnboardingViewController.h"

@interface ViewController () <OnboardingViewControllerDelegate>
@property BOOL onboardingShown;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setOnboardingShown:NO];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    if ( ![self onboardingShown] ) {
        
        [self performSegueWithIdentifier:@"OnboardingSegue" sender:nil];
        
        [self setOnboardingShown:YES];
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ( [[segue identifier] isEqualToString:@"OnboardingSegue"] ) {
        
        [(OnboardingViewController *)[segue destinationViewController] setDelegate:self];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OnboardingViewControllerDelegate
- (void)onboardingChoosen:(OnboardingSelection)onboardingSelection
{
    
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor redColor]];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
