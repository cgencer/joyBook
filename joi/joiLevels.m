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

//		[[SKMusicPlayer musicPlayer] playWithMusicName:@"bg" musicType:@"mp3"];

		theSize = size;
		theModel = [[joiModel alloc] init];

		NSLog(@">:>: %i", theModel.totalBooks);
		for (int i = 0; i < (int) theModel.totalBooks; i++) {

			joiAnimButton *aB = [[joiAnimButton alloc] initWithSize:theSize
															  named:@"levelButton1"
														  fromAtlas:@"button"];
			aB.position = CGPointMake((CGFloat)i * 200, 100);
			[self addChild:aB];
		}

//		[backButton.title setText:@"Button"];
//		[backButton.title setFontName:@"Chalkduster"];
//		[backButton.title setFontSize:20.0];
//		[backButton setTouchUpInsideTarget:self action:@selector(buttonAction)];
	}
	return self;
}

-(void)buttonAction {
}
@end
