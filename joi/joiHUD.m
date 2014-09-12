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
    if(self = [super initWithSpriteImageName:@"backButton"]) {
		theSize = size;
		NSLog(@"joiHUD::::> %i x %i",
			  (int)theSize.width, (int)theSize.height);
        [self addChild: [self backButtonNode]];
	}
	return self;
}

- (SKSpriteNode *)backButtonNode
{
    SKSpriteNode *buttonBack = [SKSpriteNode spriteNodeWithImageNamed:@"backbutton.png"];
    CGRect layerSize = [buttonBack calculateAccumulatedFrame];
    NSLog(@"#### %i x %i", (int)theSize.width, (int)theSize.height);
    buttonBack.position = CGPointMake(layerSize.size.width / 2, layerSize.size.height / 2);
    //CGPointMake(theSize.width/2, theSize.height/2);
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
