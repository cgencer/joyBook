//
//  joiPage.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "joiPage.h"
#import "joiModel.h"

@implementation joiPage

-(id)initWithSpriteImageName:(NSString*)name {

    if(self = [super init]) {
		self.theModel = [[joiModel alloc] init];
		self.totalBooks = self.theModel.totalBooks;
		NSLog(@"total: %tu", self.totalBooks);
    }
    return self;
}

-(void)removeFromParent {
    [super removeFromParent];
}

@end
