//
//  joiLevels.h
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKBButtonNode.h"
#import "joiPage.h"
#import "joiBook.h"
#import "joiMenuItem.h"

@interface joiLevels : joiPage {
	CGSize theSize;
}

-(id)initWithSize:(CGSize)size;

@end
