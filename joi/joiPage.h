//
//  joiPage.h
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "joiModel.h"
#import "joiBook.h"

@interface joiPage : SKSpriteNode {
}

@property (nonatomic) joiBook* theBook;
@property (nonatomic) joiModel* theModel;
@property (nonatomic, assign) NSUInteger totalBooks;
@property (nonatomic, assign) NSUInteger activeBook;
@property (nonatomic, assign) NSUInteger activePage;

-(id)initWithSpriteImageName:(NSString*)name;

@end
