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
		NSString *prefix;
		
		for (NSUInteger iy = 0; iy < 2; iy++) {
		prefix = (iy == 0) ? @"story" : @"game";
		for (NSUInteger ix = 0; ix < 5; ix++) {

			NSString *atlasName;
			NSUInteger frameNum;

			if (ix+1 > self.totalBooks) {
				atlasName = @"blankLevels";
				frameNum = 1;
			}else{
				atlasName = [[self.theModel bookProperty:@"menuItem" withBookID:ix] valueForKey:@"atlasName"];
				frameNum = 7;
			}
			CGFloat xx = (CGFloat) (ix*160) + (35*ix) + 7 + 35;
			CGFloat yy = (CGFloat) theSize.height/2 - iy*195;

			joiAnimButton *aButton = [[joiAnimButton alloc]
			 initWithSize:theSize
			 named:[NSString stringWithFormat: @"%@Button_%i", prefix, ix]
			 position:CGPointMake(xx, yy)
			 fromAtlas:atlasName
			 withFramePattern:@"frame%i"
			 andFrames:frameNum
			 andID:ix
			 ];
			[self addChild:aButton];
			
		}
		}
		self.zPosition = 1;

	}
	return self;
}

@end
