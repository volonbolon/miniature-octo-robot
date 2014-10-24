//
//  OnboardingViewController.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "OnboardingViewController.h"
#import "SSZipArchive.h"
#import "NSBundle+Config.h"

@interface OnboardingViewController ()
- (IBAction)buttonTapped:(id)sender;
@end

@implementation OnboardingViewController

- (void)unzipItemWithTag:(OnboardingSelection)tag
{
    
    NSString *zipName = nil;
    switch ( tag ) {
        case OnboardingSelectionPurple:
            zipName = @"purple";
            break;
            
        case OnboardingSelectionRed:
            zipName = @"red";
            break;
            
        case OnboardingSelectionGreen:
            zipName = @"green";
            break;
    }
    
    NSString *configPath = [NSBundle configPath];
    NSString *docsPath = [configPath stringByDeletingLastPathComponent];
    NSString *zippedConfigPath = [[NSBundle mainBundle] pathForResource:zipName ofType:@"zip"];
    
    [SSZipArchive unzipFileAtPath:zippedConfigPath toDestination:docsPath];
    
    NSError *error = nil;
    NSFileManager *dfm = [NSFileManager defaultManager];
    
    if ( [dfm fileExistsAtPath:configPath] ) {
        
        NSError *deleteError = nil;
        BOOL deleteSuccess = [dfm removeItemAtPath:configPath error:&deleteError];
        if ( !deleteSuccess ) {
            
            NSLog(@"%@", deleteError);
            
        }
        
    }
    
    BOOL success = [dfm moveItemAtPath:[docsPath stringByAppendingPathComponent:zipName] toPath:configPath error:&error];
    
    if ( !success ) {
        
        NSLog(@"%@",error);
        
    }
}

- (IBAction)buttonTapped:(id)sender {
    
    NSUInteger tag = [(UIView *)sender tag];
    [self unzipItemWithTag:(OnboardingSelection)tag];
    
    [[self delegate] onboardingChoosen];
    
}
@end
