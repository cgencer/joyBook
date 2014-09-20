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

@property (assign, nonatomic) NSNumber<Optional> *interval;
@property (assign, nonatomic) NSNumber<Optional> *pause;
@property (strong, nonatomic) NSArray<joiFrame, Optional>* frames;

@end
