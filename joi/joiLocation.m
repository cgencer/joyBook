//
//  joiLocation.m
//  joi
//
//  Created by Cem Gencer on 3.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiLocation.h"

@implementation joiLocation

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{
    @"location.x": @"locX",
    @"location.y.usd": @"locY"
  }];
}

@end
