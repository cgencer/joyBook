//
//  joiBookset.h
//  joi
//
//  Created by Cem Gencer on 2.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"
#import "joiBook.h"

@interface joiCollection : JSONModel

@property (strong, nonatomic) NSArray<joiBook, ConvertOnDemand>* book;

@end
