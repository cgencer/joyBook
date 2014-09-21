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
	SKSpriteNode *theButton;
	NSString *theName;
	NSMutableArray *theFrames;
	CGSize theSize;
	NSString *_atlas;
}

@synthesize theName, theSize;
// to create buttons with animated frame

-(id)initWithSize:(CGSize)size 
            named:(NSString*)name
		 position:(CGPoint)pos
	    fromAtlas:(NSString*)atlas
{
	if(self = [super init]) {
		theSize = size;
		theName = name;
		_atlas = atlas;
		bookID++;

//		[self addChild: [self doButton:@"button" withFrameName:@"frame"]];

		SKTextureAtlas *bAtlas = [SKTextureAtlas atlasNamed:_atlas];
		
		theButton = [SKSpriteButtonNode
					 buttonNodeWithNormalTexture:[bAtlas textureNamed:@"button-off"]
					 highlightedTexture:[bAtlas textureNamed:@"button-on"]
					 block:^(id buttonNode, BOOL highlighted) {
							 [self selectBook:bookID];
							 NSDictionary *dict = [NSDictionary dictionaryWithObject:@"Ravi" 
							 												 forKey:@"name"];
							 [[NSNotificationCenter defaultCenter] postNotificationName:@"levelSelected"
                    							                                 object:nil
                                        					          		   userInfo:dict];
					 }];
		theButton.name = theName;
		theButton.zPosition = 10;
		theButton.position = pos;
		theButton.anchorPoint = CGPointMake(0, 0);
		[self addChild:theButton];
/*
		SKTexture *temp;
		int numImages = bAtlas.textureNames.count / 5;	// because there are x5 of each image in the atlas
		for (int i = 0; i <= numImages-2; i++) {			// -2: to exclude the still frames -on and -off
			NSString *textureName = [NSString stringWithFormat:@"frame%d", i];
			SKTexture *temp = [bAtlas textureNamed:textureName];
			NSLog(@"> %@ : %@", theName, temp);
			[theFrames addObject:temp];
		}
		temp = theFrames[0];
		theButton = [SKSpriteNode spriteNodeWithTexture:temp];
		theButton.zPosition = 9;
		theButton.position = pos;
		theButton.anchorPoint = CGPointMake(0, 0);
		[self addChild:theButton];
//		[self animateButton];
*/
	}
	return self;
}

-(void)selectBook:(NSUInteger)selectedBookID
{
	NSLog(@"clicked (inside)...");
	return;
}

-(void)animateButton
{
	[theButton runAction:[SKAction repeatActionForever:
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
