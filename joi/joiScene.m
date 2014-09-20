//
//  joiScene.m
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiScene.h"


@implementation joiScene

@synthesize deviceType;

-(id)initWithSize:(CGSize)size {
	if (self = [super initWithSize:size]) {

//		self.rootNode.texture = [SKTexture textureWithImageNamed:@"sample_image.jpg"];
        self.rootNode.size    = self.rootNode.texture.size;
		
		self.gameState = kStateIntro;

		NSLog(@"SCENE>Size: %@", NSStringFromCGSize(size));

//		joiCore *jCore = [[joiCore alloc] init];
//		jCore.delegate = self;
//		[jCore helloDelegate:size];

//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
		_layerEntrance = [SKNode node];
		[self addChild:_layerEntrance];
		_layerEntrance.zPosition = 20;

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

		joiPage *introPage = [[joiIntro alloc] initWithSize:size];
		[_layerEntrance addChild:introPage];
		introPage.position = CGPointMake(0, 0);

		joiPage *levelSelectionPage = [[joiLevels alloc] initWithSize:size];
		[_layerEntrance addChild:levelSelectionPage];
//		levelSelectionPage.position = CGPointMake(0, size.height);

		joiPage *aPage = [[joiFirstPage alloc] initWithSize:size];
//		[_layerForeground addChild:aPage];

		joiPage *hudPage = [[joiHUD alloc] initWithSize:size];
//		[_layerHUD addChild:hudPage];

		[[NSNotificationCenter defaultCenter] addObserver:self
    		                                     selector:@selector(thingHappened:)
            		                                 name:@"levelSelected"
                    		                       object:nil];
	}
	return self;
}

-(void)thingHappened:(NSNotification*) notification {
	NSString *name = notification.name;
	NSDictionary *info = notification.userInfo;
	NSLog(@"button clicked!=================");
	NSLog(@"name: %@", name);
	NSLog(@"info: %@", info);
}

-(void)deviceConfig:(int)code {
	deviceType = code;
}

- (CGFloat)minimumZoomScale {
	
    return 0.5;
}

- (CGFloat)maximumZoomScale {
	
    return 1.0;
}

- (CGFloat)initialZoomScale {
	
    return 1.0;
}

-(void)update:(CFTimeInterval)currentTime {
	/* Called before each frame is rendered */
	if (self.gameState != kStateMenu) {
        return;
    }
}
@end
