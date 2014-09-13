//
//  joiAnimButton.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiAnimButton.h"

@implementation joiAnimButton {
	SKSpriteNode *theButton;
	NSString *theName;
	NSMutableArray *theFrames;
	CGSize theSize;
	int bookID;
}

@synthesize theName, theSize;
// to create buttons with animated frame

-(id)initWithSize:(CGSize)size 
            named:(NSString*)name
		 andStill:(NSString*)still
	    fromAtlas:(NSString*)atlas
{
	theSize = CGSizeMake(size.height, size.width);
	theName = name;

	[self addChild: [self doButton:still fromAtlas:atlas]];
	return self;
}

- (SKSpriteNode *)doButton:(NSString*)stillFrame
				 fromAtlas:(NSString*)buttonAtlas
{
	// store the animations in an atlas, where the framenames are frame1, frame2, ...
		SKTextureAtlas *cloudAtlas = [SKTextureAtlas atlasNamed:buttonAtlas];

		bookID = 0;
		theButton = [SKSpriteButtonNode
					 buttonNodeWithNormalTexture:[cloudAtlas textureNamed:@"still-normal"]
							  highlightedTexture:[cloudAtlas textureNamed:@"still-highlighted"]
										   block:^(id buttonNode, BOOL highlighted) {
														if (highlighted || !highlighted) {
															[self selectBook:bookID];
														}
										   }];
	    CGRect layerSize = [theButton calculateAccumulatedFrame];
    	theButton.position = CGPointMake(layerSize.size.width / 2, layerSize.size.height / 2);
	    theButton.name = theName;
	    theButton.zPosition = 1;

		theFrames = [NSMutableArray array];

		SKTexture *temp;
		int numImages = cloudAtlas.textureNames.count;
		for (int i=1; i <= numImages; i++) {
			NSString *textureName = [NSString stringWithFormat:@"frame%d", i];
			temp = [cloudAtlas textureNamed:textureName];
			[theFrames addObject:temp];
		}
		temp = theFrames[0];
		theButton = [SKSpriteNode spriteNodeWithTexture:temp];
//		_dove.position = CGPointMake(midX, midY);

		[self addChild:theButton];
		[self animatedButton];

	return theButton;
}

-(void)selectBook:(int)selectedBookID
{
	return;
}

-(void)animatedButton
{
	[theButton runAction:[SKAction repeatActionForever:
								[SKAction animateWithTextures:theFrames
												 timePerFrame:0.1f
													   resize:NO
													  restore:YES]] 
				 withKey:theName];
	return;
}
@end
