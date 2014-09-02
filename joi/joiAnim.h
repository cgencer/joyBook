//
//  joiAnim.h
//  joi
//
//  Created by Cem Gencer on 2.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"

@protocol joiAnim @end

@interface joiAnim : JSONModel

@property (strong, nonatomic) NSNumber *location;
@property (strong, nonatomic) NSNumber *interval;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *tween;

@end
