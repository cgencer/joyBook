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
    if(self = [super init]) {
        [self addChild: [self backButtonNode]];
	}
	return self;
}

- (SKSpriteNode *)backButtonNode
{
    SKBButtonNode *buttonBack = [SKBButtonNode spriteNodeWithImageNamed:@"backbutton.png"];
    CGRect layerSize = [buttonBack calculateAccumulatedFrame];
    buttonBack.position = CGPointMake(layerSize.size.width/2, layerSize.size.height/2);
    buttonBack.name = @"backButton";
    buttonBack.zPosition = 1.0;
	return buttonBack;
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
