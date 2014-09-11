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

@interface joiModel : NSObject

@property (nonatomic) NSInteger totalBooks;
@property (nonatomic) NSInteger activeBook;
@property (nonatomic) NSInteger activePage;

+(id)sharedManager;
-(joiBook*)selectBook:(NSInteger *)bookid;
-(id)bookProperty:(NSString *)selector withBookID:(NSInteger *)bookID;

@end
