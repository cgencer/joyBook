//
//  joiHUD.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiHUD.h"

@implementation joiHUD

-(id)init {
    if(self = [super initWithSpriteImageName:@"backButton"]) {
		[self addChild: [self fireButtonNode]];
		CGSize sized = [super getBoundaries];
		NSLog(@"joiHUD::::> %i x %i",
			  (int)sized.width, (int)sized.height);
	}
	return self;
}

- (SKSpriteNode *)fireButtonNode
{
    SKSpriteNode *fireNode = [SKSpriteNode spriteNodeWithImageNamed:@"backbutton.png"];
    fireNode.position = CGPointMake(100,200);
    fireNode.name = @"backButton";			//how the node is identified later
    fireNode.zPosition = 1.0;
	return fireNode;
}

//handle touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
	
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"backButton"]) {
		//do whatever...
    }
}
@end
