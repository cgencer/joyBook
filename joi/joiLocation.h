//
//  joiLocation.h
//  joi
//
//  Created by Cem Gencer on 3.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"

@protocol joiLocation @end

@interface joiLocation : JSONModel

@property (strong, nonatomic) NSNumber *posX;
@property (strong, nonatomic) NSNumber *posY;

@end
