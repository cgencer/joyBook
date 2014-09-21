//
//  joiMenuCollection.h
//  joi
//
//  Created by Cem Gencer on 20.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"
#import "joiMenuItem.h"

@protocol joiMenuCollection @end

@interface joiMenuCollection : JSONModel

@property (strong, nonatomic) joiMenuItem *menuI;

@end
