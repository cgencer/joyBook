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
	joiBook *theBook;
	joiCollection *_collection;
}

+ (id)sharedManager;
-(joiBook*)selectBook:(NSInteger *)bookid;
-(NSString*)bookProperty:(NSString *)selector;

@end
