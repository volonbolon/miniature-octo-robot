//
//  NSBundle+Config.h
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Config)
+ (NSString *)configPath;
+ (instancetype)configBundle;
- (NSDictionary *)config;
@end
