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

#define defaultBookNum		0

@implementation joiModel {
	joiBook *theBook;
	joiCollection *_collection;
}

@synthesize totalBooks;
@synthesize activeBook;
@synthesize activePage;

#pragma mark Singleton Methods

+ (id)sharedManager {
	static joiModel *sharedModel = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedModel = [[self alloc] init];
	});
	return sharedModel;
}

-(id)init {
	if (self = [super init]) {
		activeBook = defaultBookNum;
		theBook = [self selectBook:defaultBookNum];
	}
	return self;
}

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
	
	NSArray *books = _collection.bookSet;
	totalBooks = [books count];
	joiBook *_theBook = [books objectAtIndex:0];
	NSLog(@"book initialized... %i", totalBooks);
	return _theBook;
}

-(id)bookProperty:(NSString *)selector withBookID:(NSInteger *)bookID
{
	NSInteger *bid = (bookID == nil) ? defaultBookNum : bookID;
	theBook = [self selectBook:bid];

	return [theBook valueForKey:selector];

//	NSString* path = [[NSString alloc] initWithFormat:@"%@", prop];
//	NSString* imgPath = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];

//	UIImage* image = [UIImage imageWithContentsOfFile:imgPath];
//	UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
}

- (void)dealloc {
  // Should never be called, but just here for clarity really.
}
@end
