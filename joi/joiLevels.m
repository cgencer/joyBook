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

			[self addChild: [[joiAnimButton alloc]
									initWithSize:theSize
										   named:[NSString stringWithFormat:@"levelButton_%d", i]
										position:CGPointMake((CGFloat)
														(i*160) + (35*i) + 7 + 35, theSize.height/2)
									   fromAtlas:@"button"]];
		}
	}
	return self;
}

@end
