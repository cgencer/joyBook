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
		
		for (NSUInteger i = 0; i < self.totalBooks; i++) {

			joiMenuItem *mItem = [self.theModel bookProperty:@"menuItem" withBookID:i];
//			joiFrame *frm = [mItem valueForKey:@"frameSeq"];
//			NSLog(@">>>>>>>> %@", frm);
			CGFloat xx = (CGFloat) (i*160) + (35*i) + 7 + 35;
			CGFloat yy = (CGFloat) theSize.height/2;
			NSLog(@"%@: atlas: %@",[self class], [mItem valueForKey:@"atlasName"]);
			[self addChild: [[joiAnimButton alloc]
									initWithSize:theSize
										   named:[NSString stringWithFormat:@"levelButton_%d", i]
										position:CGPointMake(xx, yy)
									   fromAtlas:[mItem valueForKey:@"atlasName"]
								withFramePattern:@"dove%i"
									   andFrames:7
							 ]];
		}
	}
	return self;
}

@end
