//
//  UIFont+Stylesheet.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "UIFont+Stylesheet.h"
#import "NSBundle+Config.h"

@implementation UIFont (Stylesheet)
+ (UIFont *)fontForTextField
{
    
    __block UIFont *fontForTextField = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSDictionary *config = [[NSBundle configBundle] config];
        
        NSDictionary *fontInfo = [config objectForKey:@"textfield_font"];
        
        fontForTextField = [UIFont fontWithName:[fontInfo objectForKey:@"name"] size:[[fontInfo objectForKey:@"size"] floatValue]];
        
    });
    
    return fontForTextField;
    
}
@end
