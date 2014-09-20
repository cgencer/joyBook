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

@implementation joiModel

@synthesize totalBooks;
@synthesize activeBook;
@synthesize activePage;
@synthesize theBook;

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
		activeBook = 0;
		theBook = [self selectBook:0];
	}
	return self;
}

-(joiBook*)selectBook:(NSUInteger)bookID
{
	NSError *err = nil;
	NSString* setPath = [[NSBundle mainBundle]
								pathForResource:@"set"
										 ofType:@"json"];
	NSString *jsonString = [NSString stringWithContentsOfFile:setPath
													 encoding:NSUTF8StringEncoding
														error:&err];
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
	
	NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData
															 options:NSJSONReadingMutableContainers
															   error:&err];
	joiCollection *coll = [[joiCollection alloc]
						   initWithDictionary:jsonDict
						   error:nil];

	if(err) {
		NSLog(@"ERROR while initialising the bookset from collection: %@", coll);
	}else{
		NSArray *books = coll.bookSet;

		totalBooks = [books count];
		bookID = (bookID < totalBooks) ? bookID : defaultBookNum;
		NSLog(@"book initialized... %tu", bookID);
		
		self.theBook = [books objectAtIndex:bookID];
		NSLog(@"book initialized... %i", totalBooks);
	}
	return self.theBook;
}

-(id)bookProperty:(NSString *)selector withBookID:(NSUInteger)bookID
{
NSLog(@"BID: %i", bookID);
	theBook = [self selectBook:bookID];

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
