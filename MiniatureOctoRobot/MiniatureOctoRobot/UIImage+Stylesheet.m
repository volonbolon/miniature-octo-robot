//
//  UIImage+Stylesheet.m
//  MiniatureOctoRobot
//
//  Created by Ariel Rodriguez on 10/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "UIImage+Stylesheet.h"
#import "NSBundle+Config.h"

@implementation UIImage (Stylesheet)
+ (instancetype)mainImage
{
    
    __block UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSBundle *configBundle = [NSBundle configBundle];
        NSDictionary *config = [configBundle config];
        NSDictionary *images = [config objectForKey:@"images"];
        NSString *filename = [images objectForKey:@"main_image_name"];
        NSArray *components = [filename componentsSeparatedByString:@"."];
        NSString *path = [configBundle pathForResource:[components firstObject] ofType:[components lastObject]];
        image = [UIImage imageWithContentsOfFile:path];
        
    });
    
    return image;
    
}
@end
