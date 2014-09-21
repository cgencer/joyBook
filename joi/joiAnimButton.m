//
//  joiAnimButton.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiAnimButton.h"

static NSUInteger bookID = 0;

@implementation joiAnimButton {
	SKSpriteButtonNode *storyButton;
	SKSpriteButtonNode *gameButton;
	SKSpriteNode *theAnim;
	NSString *theName;
	NSArray *theFrames;
	CGSize theSize;
	NSString *_atlas;
}

@synthesize theName, theSize;
// to create buttons with animated frame

-(id)initWithSize:(CGSize)size 
            named:(NSString*)name
		 position:(CGPoint)pos
	    fromAtlas:(NSString*)atlas
 withFramePattern:(NSString*)pattern
		andFrames:(NSUInteger)frameNo
{
	if(self = [super init]) {
		theSize = size;
		theName = name;
		_atlas = atlas;
		bookID++;

		SKTextureAtlas *bAtlas = [SKTextureAtlas atlasNamed:_atlas];
		
		storyButton = [SKSpriteButtonNode
					 buttonNodeWithNormalTexture:[bAtlas textureNamed:@"button-off"]
					 highlightedTexture:[bAtlas textureNamed:@"button-on"]
					 block:^(id buttonNode, BOOL highlighted) {
						 if (!highlighted) {
							 NSLog(@"clicked!");
							 [self selectBook:bookID];
						 }
					 }];
		storyButton.name = theName;
		storyButton.zPosition = 10;
		storyButton.position = pos;
		storyButton.anchorPoint = CGPointMake(0, 0);
		[self addChild:storyButton];
		CGRect layerSize = [storyButton calculateAccumulatedFrame];

		gameButton = [SKSpriteButtonNode
					   buttonNodeWithNormalTexture:[bAtlas textureNamed:@"button-off"]
					   highlightedTexture:[bAtlas textureNamed:@"button-on"]
					   block:^(id buttonNode, BOOL highlighted) {
						   if (!highlighted) {
							   NSLog(@"clicked!");
							   [self selectBook:bookID];
						   }
					   }];
		gameButton.name = theName;
		gameButton.zPosition = 10;
		gameButton.position = CGPointMake(pos.x, pos.y - layerSize.size.height - 35);
		gameButton.anchorPoint = CGPointMake(0, 0);
		[self addChild:gameButton];

		NSMutableArray *_theFrames = [NSMutableArray array];

		for (NSUInteger i = 1; i <= frameNo; i++) {
			NSString *namedText = [NSString stringWithFormat:pattern, i];
			NSLog(@"texture name: %@", namedText);
			[_theFrames addObject:[bAtlas textureNamed:namedText]];
		}
		SKTexture *temp = _theFrames[0];
		theFrames = _theFrames;
		theAnim = [SKSpriteNode spriteNodeWithTexture:temp];
		theAnim.zPosition = 12;
		theAnim.position = pos;
		theAnim.anchorPoint = CGPointMake(0, 0);
		[self addChild:theAnim];
		[self playAnim];

	}
	return self;
}

-(void)selectBook:(NSUInteger)selectedBookID
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"levelSelected"
														object:nil
													  userInfo:nil];
	NSLog(@"clicked (inside)...");
	return;
}

-(void)playAnim
{
	[theAnim runAction:[SKAction repeatActionForever:
								[SKAction animateWithTextures:theFrames
												 timePerFrame:0.1f
													   resize:NO
													  restore:YES]] 
				 withKey:theName];
	return;
}
+ (NSUInteger) getBookID {
    return bookID;
}
@end
