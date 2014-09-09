//
//  joiLevels.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiLevels.h"
#import "joiButton.h"

@implementation joiLevels {

}

-(id)init {
    if(self = [super initWithSpriteImageName:@"levels"]) {
		theModel = [[joiModel alloc] init];
		NSLog(@"::: %i", theModel.totalBooks);
//		[theModel bookProperty:@"title"]

		

		joiButton *backButton = [[joiButton alloc] initWithImageNamedNormal:@"buttonNormal" selected:@"buttonSelected"];
		[backButton setPosition:CGPointMake(100, 100)];
		[backButton.title setText:@"Button"];
		[backButton.title setFontName:@"Chalkduster"];
		[backButton.title setFontSize:20.0];
		[backButton setTouchUpInsideTarget:self action:@selector(buttonAction)];
		[self addChild:backButton];	}
	return self;
}
@end
