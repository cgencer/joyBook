//
//  joiFirstPage.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiFirstPage.h"

@implementation joiFirstPage {
	SKSpriteNode *_dove;
	NSArray *_frames;
}

-(id)init {
    if(self = [super initWithSpriteImageName:@"aPage"]) {

		theModel = [[joiModel alloc] init];
		NSLog(@"...%@", [theModel bookProperty:@"title"]);
		
		SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];

		myLabel.text = @"Hello, World!";
		myLabel.fontSize = 30;
		myLabel.position = CGPointMake(midX, midY);

		[self addChild:myLabel];

		NSMutableArray *theFrames = [NSMutableArray array];
		SKTextureAtlas *cloudAtlas = [SKTextureAtlas atlasNamed:@"dove.atlas"];
		
		int numImages = cloudAtlas.textureNames.count;
		for (int i=1; i <= numImages; i++) {
			NSString *textureName = [NSString stringWithFormat:@"dove%d", i];
			SKTexture *temp = [cloudAtlas textureNamed:textureName];
			[theFrames addObject:temp];
		}
		_frames = theFrames;
		
		SKTexture *temp = _frames[0];
		_dove = [SKSpriteNode spriteNodeWithTexture:temp];
		_dove.position = CGPointMake(midX, midY);
		
		[self addChild:_dove];
		[self flyingDove];

	}
	return self;
}

-(void)flyingDove
{
	[_dove runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:_frames
																	timePerFrame:0.1f
																		  resize:NO
																		 restore:YES]] withKey:@"walkingInPlaceBear"];
	return;
}

-(void)doveMoveEnded
{
	[_dove removeAllActions];
}

@end
