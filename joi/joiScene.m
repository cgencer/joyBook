//
//  joiScene.m
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "joiScene.h"
#import "joiPage.h"
#import "joiHUD.h"
#import "joiFirstPage.h"

@interface joiScene () {
	SKNode *_layerBackground;
	SKNode *_layerBackgroundAnimation;
	SKNode *_layerForeground;
	SKNode *_layerHUD;
}
@end

@implementation joiScene


-(id)initWithSize:(CGSize)size {
	if (self = [super initWithSize:size]) {

//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

		_layerBackground = [SKNode node];
		[self addChild:_layerBackground];
		_layerBackground.zPosition = 0;
		
		_layerBackgroundAnimation = [SKNode node];
		[self addChild:_layerBackgroundAnimation];
		_layerBackgroundAnimation.zPosition = 1;

		_layerForeground = [SKNode node];
		[self addChild:_layerForeground];
		_layerForeground.zPosition = 2;

		_layerHUD = [SKNode node];
		[self addChild:_layerHUD];
		_layerHUD.zPosition = 4;

		joiPage *aPage = [joiFirstPage new];
		[_layerForeground addChild:aPage];
		[aPage setCoordX:CGRectGetMidX(self.frame) andY:CGRectGetMidY(self.frame)];

		joiPage *hPage = [joiHUD new];
		[_layerHUD addChild:hPage];
		[hPage setCoordX:CGRectGetMidX(self.frame) andY:CGRectGetMidY(self.frame)];

	}
	return self;
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
