//
//  joiIntro.m
//  joi
//
//  Created by Cem Gencer on 17.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiIntro.h"

@implementation joiIntro

-(id)initWithSize:(CGSize)size {
    if(self = [super init]) {
		theSize = size;
        [self addChild: [self backButtonNode]];
	}
	return self;
}

- (SKSpriteButtonNode *)backButtonNode
{
	SKSpriteButtonNode *backButton = [SKSpriteButtonNode
									  buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"backbutton.png"]
									  highlightedTexture:[SKTexture textureWithImageNamed:@"backbutton.png"]
									  block:^(id buttonNode, BOOL highlighted) {
										  NSLog(@"clicked");
									  }];
    CGRect layerSize = [backButton calculateAccumulatedFrame];
    backButton.position = CGPointMake(layerSize.size.width/2, theSize.height - layerSize.size.height/2);
    backButton.name = @"backButton";
    backButton.zPosition = 1.0;
	
	return backButton;
}
@end
