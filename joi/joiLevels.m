//
//  joiLevels.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiLevels.h"

@implementation joiLevels
-(id)initWithSize:(CGSize)size {
    if(self = [super initWithSpriteImageName:@"levels"]) {
		// flipping width <-> height due orientation
		theSize = CGSizeMake(size.height, size.width);
		theModel = [[joiModel alloc] init];

		for (NSInteger *i = 0; i < (NSInteger*) theModel.totalBooks; i++) {

//			joiMenuItem *_menuItem = [theModel bookProperty:@"menuitem" withBookID:i];
//			NSLog(@"the item %i: %@", i, [_menuItem class]);
//			(id) *_prop = [theModel bookProperty:@"title" withBookID:i];
		}

		SKBButtonNode *backButton = [[SKBButtonNode alloc] initWithImageNamedNormal:@"buttonNormal" selected:@"buttonSelected"];
	    CGRect layerSize = [backButton calculateAccumulatedFrame];
	    NSLog(@"#### %i x %i", (int)theSize.width, (int)theSize.height);

		backButton.position = CGPointMake(layerSize.size.width/3, layerSize.size.height/3);
//		[backButton.title setText:@"Button"];
//		[backButton.title setFontName:@"Chalkduster"];
//		[backButton.title setFontSize:20.0];
//		[backButton setTouchUpInsideTarget:self action:@selector(buttonAction)];
		[self addChild:backButton];
	}
	return self;
}

-(void)buttonAction {
}
@end
