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
		for (int i = 0; i < (int) 5; i++) {

			joiAnimButton *aB = [[joiAnimButton alloc] initWithSize:theSize
															  named:@"levelButton1"
														  fromAtlas:@"button"];
			
			aB.position = CGPointMake((CGFloat) (i*200) + (20*i) + 20, theSize.height/2);
			[self addChild:aB];
		}
	}
	return self;
}

-(void)buttonAction {
}
@end
