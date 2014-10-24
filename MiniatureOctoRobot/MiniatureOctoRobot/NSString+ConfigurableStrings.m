//
//  NSString+ConfigurableStrings.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "NSString+ConfigurableStrings.h"
#import "NSBundle+Config.h"

@implementation NSString (ConfigurableStrings)
+ (instancetype)title
{
    
    __block NSString *title = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSBundle *configBundle = [NSBundle configBundle];
        NSDictionary *config = [configBundle config];
        title = [config objectForKey:@"title"];
        
    });
    
    return title;
    
}
@end
