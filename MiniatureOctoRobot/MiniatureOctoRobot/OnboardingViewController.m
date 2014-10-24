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

- (IBAction)buttonTapped:(id)sender {
    
    NSString *configPath = [NSBundle configPath];
    NSString *docsPath = [configPath stringByDeletingLastPathComponent];
    NSString *zippedConfigPath = [[NSBundle mainBundle] pathForResource:@"red" ofType:@"zip"];
    
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
    
    BOOL success = [dfm moveItemAtPath:[docsPath stringByAppendingPathComponent:@"red"] toPath:configPath error:&error];
    
    if ( !success ) {
        
        NSLog(@"%@",error);
        
    }
    
    [[self delegate] onboardingChoosen:[(UIView *)sender tag]];
    
}
@end
