//
//  NSBundle+Config.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "NSBundle+Config.h"

@implementation NSBundle (Config)
+ (NSString *)configPath
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    
    NSString *configPath = [basePath stringByAppendingPathComponent:@"config.bundle"];
    
    return configPath;
    
}

+ (instancetype)configBundle
{
    
    static NSBundle *configBundle = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"red" ofType:@"bundle"];
        configBundle = [NSBundle bundleWithPath:bundlePath];
        
    });
    
    return configBundle;
    
}

- (NSDictionary *)config
{
    
    NSString *configPath = [self pathForResource:@"config" ofType:@"json"];
    NSData *d = [NSData dataWithContentsOfFile:configPath];
    NSError *error = nil;
    
    NSDictionary *config = [NSJSONSerialization JSONObjectWithData:d options:0 error:&error];
    if ( nil == config ) {
        
        NSLog(@"%@", config);
        
    }
    
    return config;
    
}
@end
