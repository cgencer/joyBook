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
	SKSpriteButtonNode *theButton;
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

		NSLog(@"PATTERN: %@", pattern);
		
//		[self addChild: [self doButton:@"button" withFrameName:@"frame"]];

		SKTextureAtlas *bAtlas = [SKTextureAtlas atlasNamed:_atlas];
		
		theButton = [SKSpriteButtonNode
					 buttonNodeWithNormalTexture:[bAtlas textureNamed:@"button-off"]
					 highlightedTexture:[bAtlas textureNamed:@"button-on"]
					 block:^(id buttonNode, BOOL highlighted) {
						[self selectBook:bookID];
					 }];
		theButton.name = theName;
		theButton.zPosition = 10;
		theButton.position = pos;
		theButton.anchorPoint = CGPointMake(0, 0);
		[self addChild:theButton];

		NSMutableArray *_theFrames = [NSMutableArray array];

		for (NSUInteger i = 0; i < frameNo-1; i++) {
			[_theFrames addObject:
							[bAtlas textureNamed:
										[NSString stringWithFormat:pattern, i]]];
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
