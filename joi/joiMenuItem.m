//
//  joiMenuItem.m
//  joi
//
//  Created by Cem Gencer on 9.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiMenuItem.h"

@implementation joiMenuItem

@synthesize interval;
@synthesize pause;

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{
    @"menuItem.interval": @"interval",
    @"menuItem.pause": @"pause",
    @"menuItem.frames": @"frames",
  }];
}

@end
