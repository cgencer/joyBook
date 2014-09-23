//
//  joiAnimButton.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiAnimButton.h"

static NSString * const kAnimalNodeName = @"movable";

@implementation joiAnimButton {
	SKSpriteButtonNode *storyButton;
	SKSpriteButtonNode *gameButton;
	SKSpriteNode *theAnim;
	NSString *theName;
	NSArray *theFrames;
	CGSize theSize;
	NSString *_atlas;
}

@synthesize theName, theSize, theID, myFrame;
// to create buttons with animated frame

-(id)initWithSize:(CGSize)size 
            named:(NSString*)name
		 position:(CGPoint)pos
	    fromAtlas:(NSString*)atlas
 withFramePattern:(NSString*)pattern
		andFrames:(NSUInteger)frameNo
			andID:(NSUInteger)bid
{
	if(self = [super init]) {
		theSize = size;
		theName = name;
		NSLog(@">>>>> %@", theName);
		theID = bid;
		_atlas = atlas;

		SKTextureAtlas *bAtlas = [SKTextureAtlas atlasNamed:_atlas];
		
		storyButton = [SKSpriteButtonNode
					 buttonNodeWithNormalTexture:[bAtlas textureNamed:@"button-off"]
					 selectedTexture:[bAtlas textureNamed:@"button-on"]
					 block:^(id buttonNode) {
						 NSLog(@"clicked! %@", buttonNode);
//						 [self selectBook:bookID];
					 }];
		storyButton.userInteractionEnabled = YES;
		storyButton.name = theName;
		storyButton.position = pos;
		storyButton.anchorPoint = CGPointMake(0, 0);
		[self addChild:storyButton];

		myFrame = [storyButton calculateAccumulatedFrame];

		NSMutableArray *_theFrames = [NSMutableArray array];

		for (NSUInteger i = 1; i <= frameNo; i++) {
			NSString *namedText = [NSString stringWithFormat:pattern, i];
			[_theFrames addObject:[bAtlas textureNamed:namedText]];
		}
		SKTexture *temp = _theFrames[0];
		theFrames = _theFrames;
		theAnim = [SKSpriteNode spriteNodeWithTexture:temp];
		theAnim.name = [NSString stringWithFormat:@"%@_anim", theName];
		theAnim.position = pos;
		theAnim.anchorPoint = CGPointMake(0, 0);
		[self addChild:theAnim];
//		[self playAnim];

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

-(void)touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event
{
	self.draggedNode = [self nodeAtPoint:[[touches anyObject] locationInNode:self]];
	NSLog(@"touch began... %@", self.draggedNode);
}

-(void)touchesMoved:(NSSet*) touches withEvent:(UIEvent*) event
{
	self.draggedNode.position = [[touches anyObject] locationInNode:self];
}

-(void)touchesEnded:(NSSet*) touches withEvent:(UIEvent*) event
{
	self.draggedNode = nil;
}

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	NSLog(@"touch began... %@", touch);
	CGPoint location = [touch locationInNode:self];
//    [self selectNodeForTouch:location];
	SKNode *node = [self nodeAtPoint:location];
	if ([node.name hasPrefix:[NSString stringWithFormat:@"story"]]) {
//		SKScene *sampleScene = [[SampleScene alloc] initWithSize:self.size];
		NSLog(@"nextButton pressed");
//		SKTransition *transition = [SKTransition flipVerticalWithDuration:0.5];
//		[self.view presentScene:sampleScene transition:transition];
	}
}
*/
/*
- (void)selectNodeForTouch:(CGPoint)touchLocation {
	//1
	SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
	
	NSLog(@"touched: %@", [touchedNode name]);
	//2
	if(![_selectedNode isEqual:touchedNode]) {
		[_selectedNode removeAllActions];
		[_selectedNode runAction:[SKAction rotateToAngle:0.0f duration:0.1]];
		
		_selectedNode = touchedNode;
		//3
		if([[touchedNode name] isEqualToString:kAnimalNodeName]) {
			SKAction *sequence = [SKAction sequence:@[
							[SKAction rotateByAngle:[self degToRad:(-4.0f)] duration:0.1],
							[SKAction rotateByAngle:0.0 duration:0.1],
							[SKAction rotateByAngle:[self degToRad:(4.0f)] duration:0.1]]];
			[_selectedNode runAction:[SKAction repeatActionForever:sequence]];
		}
	}
	
}

- (float)degToRad:(float)degree {
	return degree / 180.0f * M_PI;
}
*/
@end
