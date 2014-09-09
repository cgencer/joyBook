//
//  joiMenuItem.h
//  joi
//
//  Created by Cem Gencer on 9.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"
#import "joiFrame.h"

@protocol joiMenuItem @end

@interface joiMenuItem : JSONModel

@property (strong, nonatomic) NSNumber *interval;
@property (strong, nonatomic) NSNumber *pause;
@property (strong, nonatomic) NSArray<joiFrame, ConvertOnDemand>* frames;

@end
