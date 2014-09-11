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

@synthesize boundSize = _boundSize;

-(id)initWithSize:(CGSize)size {
	if (self = [super initWithSize:size]) {
		joiCore *jCore = [[joiCore alloc] init];
		jCore.delegate = self;
		[jCore helloDelegate];

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

		joiPage *levelSelectionPage = [joiLevels new];
		[_layerEntrance addChild:levelSelectionPage];
		levelSelectionPage.screenDimensions = size;
		NSLog(@"joiScene:::> %f x %f", size.width, size.height);

//		[levelSelectionPage setBoundaries:size];

		joiPage *aPage = [joiFirstPage new];
		aPage.screenDimensions = size;
		[_layerForeground addChild:aPage];
		[aPage setBoundaries:size];

		joiPage *hudPage = [joiHUD new];
		hudPage.screenDimensions = size;
		[_layerHUD addChild:hudPage];
		[hudPage setBoundaries:size];
	}
	return self;
}

-(void)sayHello:(joiCore *)jc{
    NSLog(@"Hiya!");
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

-(void)setContentScale:(CGFloat)scale;
{
}

-(void)update:(CFTimeInterval)currentTime {
	/* Called before each frame is rendered */
}
@end
