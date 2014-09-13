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
	joiModel* theModel;
}

@property (nonatomic) joiBook* theBook;

-(id)initWithSpriteImageName:(NSString*)name;

@end
