//
//  joiScene.h
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "joiCore.h"
#import <SpriteKit/SpriteKit.h>
#import "joiPage.h"
#import "joiHUD.h"
#import "joiFirstPage.h"
#import "joiLevels.h"

@interface joiScene : SKScene {
	SKNode *_layerEntrance;
	SKNode *_layerBackground;
	SKNode *_layerBackgroundAnimation;
	SKNode *_layerForeground;
	SKNode *_layerHUD;
}

-(id)initWithSize:(CGSize)size;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)update:(CFTimeInterval)currentTime;

@end
