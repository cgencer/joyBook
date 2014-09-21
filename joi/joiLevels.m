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
		
		for (NSUInteger i = 0; i < 5; i++) {

			NSString *atlasName;
			NSUInteger frameNum;
			BOOL reality;

			if (i+1 > self.totalBooks) {
				atlasName = @"blankLevels";
				frameNum = 1;
			}else{
				atlasName = [[self.theModel bookProperty:@"menuItem" withBookID:i] valueForKey:@"atlasName"];
				frameNum = 7;
			}
			NSLog(@"%@", atlasName);
			CGFloat xx = (CGFloat) (i*160) + (35*i) + 7 + 35;
			CGFloat yy = (CGFloat) theSize.height/2;

			[self addChild: [[joiAnimButton alloc]
									initWithSize:theSize
										   named:[NSString stringWithFormat:@"levelButton_%i", i]
										position:CGPointMake(xx, yy)
									   fromAtlas:atlasName
								withFramePattern:@"frame%i"
									   andFrames:frameNum
							 ]];
		}


	}
	return self;
}

@end
