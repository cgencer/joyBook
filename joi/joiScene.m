//
//  joiScene.m
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiScene.h"
#import "joiCore.h"

@implementation joiScene

-(id)initWithSize:(CGSize)size {
	if (self = [super initWithSize:size]) {
		self.gameState = kGameStateRunning;

		NSLog(@"SCENE>Size: %@", NSStringFromCGSize(size));

//		joiCore *jCore = [[joiCore alloc] init];
//		jCore.delegate = self;
//		[jCore helloDelegate:size];

//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
		_layerEntrance = [SKNode node];
		[self addChild:_layerEntrance];
		_layerEntrance.zPosition = 0;

		_layerBackground = [SKNode node];
		[self addChild:_layerBackground];
		_layerBackground.zPosition = 1;
		
		_layerBackgroundAnimation = [SKNode node];
		[self addChild:_layerBackgroundAnimation];
		_layerBackgroundAnimation.zPosition = 2;

		_layerForeground = [SKNode node];
		[self addChild:_layerForeground];
		_layerForeground.zPosition = 3;

		_layerHUD = [SKNode node];
		[self addChild:_layerHUD];
		_layerHUD.zPosition = 4;

		joiPage *levelSelectionPage = [[joiLevels alloc] initWithSize:size];
		[_layerEntrance addChild:levelSelectionPage];

		joiPage *aPage = [[joiFirstPage alloc] initWithSize:size];
		[_layerForeground addChild:aPage];

		joiPage *hudPage = [[joiHUD alloc] initWithSize:size];
		[_layerHUD addChild:hudPage];
	}
	return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

-(void)update:(CFTimeInterval)currentTime {
	/* Called before each frame is rendered */
	if (self.gameState != kGameStateRunning) {
        return;
    }
}
@end
