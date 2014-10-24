//
//  ViewController.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "OnboardingViewController.h"
#import "UIColor+Stylesheet.h"
#import "UIFont+Stylesheet.h"
#import "UIImage+Stylesheet.h"
#import "NSString+ConfigurableStrings.h"

@interface ViewController () <OnboardingViewControllerDelegate>
@property BOOL onboardingShown;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
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
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor navbarTintColor]];
    
    [[UITextField appearance] setFont:[UIFont fontForTextField]];
    
    [[self imageView] setImage:[UIImage mainImage]];
    
    [self setTitle:[NSString title]];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
