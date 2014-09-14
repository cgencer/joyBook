//
//  joiHUD.m
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiHUD.h"

@implementation joiHUD

-(id)initWithSize:(CGSize)size {
    if(self = [super init]) {
		theSize = size;
        [self addChild: [self backButtonNode]];
	}
	return self;
}

- (SKSpriteButtonNode *)backButtonNode
{
/*
    SKBButtonNode *buttonBack = [SKBButtonNode spriteNodeWithImageNamed:@"backbutton.png"];
    CGRect layerSize = [buttonBack calculateAccumulatedFrame];
    buttonBack.position = CGPointMake(layerSize.size.width/2, theSize.height - layerSize.size.height/2);
    buttonBack.name = @"backButton";
    buttonBack.zPosition = 1.0;
*/
	SKSpriteButtonNode *backButton = [SKSpriteButtonNode
				 buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"backbutton.png"]
				 highlightedTexture:[SKTexture textureWithImageNamed:@"backbutton.png"]
				 block:^(id buttonNode, BOOL highlighted) {

				 }];
    CGRect layerSize = [backButton calculateAccumulatedFrame];
    backButton.position = CGPointMake(layerSize.size.width/2, theSize.height - layerSize.size.height/2);
    backButton.name = @"backButton";
    backButton.zPosition = 1.0;
	
	return backButton;
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
