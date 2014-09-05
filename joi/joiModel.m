//
//  joiModel.m
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiModel.h"
#import "JSONModelLib.h"
#import "joiCollection.h"

@implementation joiModel

-(joiBook*)selectBook:(NSInteger *)bookid
{
	if (bookid == nil) {
		bookid = 0;
	}
	
	NSString* setPath = [[NSBundle mainBundle] pathForResource:@"set" ofType:@"json"];
	NSError* err = nil;
	
	NSString *jsonString = [NSString stringWithContentsOfFile:setPath
													 encoding:NSUTF8StringEncoding
														error:&err];
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
	
	NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData
															 options:NSJSONReadingMutableContainers
															   error:&err];
	
	_collection = [[joiCollection alloc] initWithDictionary:jsonDict error:&err];
	if(err) {
		NSLog(@"ERROR while initialising the bookset: %@", _collection);
	}
	
	NSArray* book = _collection.bookSet;
	theBook = [book objectAtIndex:0];
	return theBook;
}

@end
