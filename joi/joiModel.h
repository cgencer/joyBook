//
//  joiModel.h
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "joiBook.h"
#import "joiCollection.h"

@interface joiModel : NSObject {
	NSArray *book;
	joiCollection *coll;
	joiBook *theBook;
}

@property (nonatomic, assign) NSUInteger totalBooks;
@property (nonatomic, assign) NSUInteger activeBook;
@property (nonatomic, assign) NSUInteger activePage;

+(id)sharedManager;
-(joiBook*)selectBook:(NSUInteger)bookid;
-(id)bookProperty:(NSString *)selector withBookID:(NSUInteger)bookID;

@end
