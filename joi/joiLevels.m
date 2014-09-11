//
//  joiLevels.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiLevels.h"
#import "joiButton.h"
#import "joiBook.h"
#import "joiMenuItem.h"

@implementation joiLevels
-(id)init {
    if(self = [super initWithSpriteImageName:@"levels"]) {
		theModel = [[joiModel alloc] init];

		for (NSInteger *i = 0; i < (NSInteger*) theModel.totalBooks; i++) {

//			joiMenuItem *_menuItem = [theModel bookProperty:@"menuitem" withBookID:i];
//			NSLog(@"the item %i: %@", i, [_menuItem class]);
//			(id) *_prop = [theModel bookProperty:@"title" withBookID:i];
		}

		NSLog(@"joiLevels::> %f x %f",
			  self.screenDimensions.width, self.screenDimensions.height);

		joiButton *backButton = [[joiButton alloc] initWithImageNamedNormal:@"buttonNormal" selected:@"buttonSelected"];
		[backButton setPosition:CGPointMake(100, 100)];
		[backButton.title setText:@"Button"];
		[backButton.title setFontName:@"Chalkduster"];
		[backButton.title setFontSize:20.0];
		[backButton setTouchUpInsideTarget:self action:@selector(buttonAction)];
		[self addChild:backButton];
	}
	return self;
}

-(void)buttonAction {
}
@end
