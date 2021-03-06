//
//  joiFrame.h
//  joi
//
//  Created by Cem Gencer on 3.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"

@protocol joiFrame @end

@interface joiFrame : JSONModel

@property (strong, nonatomic) NSString *imageName;
@property (assign, nonatomic) NSNumber<Optional> *pause;
@property (assign, nonatomic) NSNumber<Optional> *number;

@end
