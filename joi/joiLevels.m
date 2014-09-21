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

//		joiMenuItem *mIs = [mC objectAtIndex:0];
//		NSLog(@"ATLAS: %@", mIs);

//		NSLog(@"...> %@", [super.theModel bookProperty:@"miAtlasName" withBookID:0]);

		for (NSUInteger i = 0; i < self.totalBooks; i++) {

			joiMenuItem *mC = [self.theModel bookProperty:@"menuItem" withBookID:i];

			[self addChild: [[joiAnimButton alloc]
									initWithSize:theSize
										   named:[NSString stringWithFormat:@"levelButton_%d", i]
										position:CGPointMake((CGFloat)
														(i*160) + (35*i) + 7 + 35, theSize.height/2)
									   fromAtlas:[mC valueForKey:@"atlasName"]
							 ]];
		}
	}
	return self;
}

@end
