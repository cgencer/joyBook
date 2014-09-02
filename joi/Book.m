//
//  Location.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "Book.h"

@implementation Book

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _title = [jsonDictionary objectForKey:@"title"];
        _stage = [jsonDictionary objectForKey:@"stage"];
        _audio = [jsonDictionary objectForKey:@"audio"];
        _action = [jsonDictionary objectForKey:@"action"];
    }
    
    return self;
}

@end
