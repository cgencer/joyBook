//
//  joiScene.h
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "PIOScrollScene.h"
#import "joiCore.h"
#import <SpriteKit/SpriteKit.h>
#import "joiPage.h"
#import "joiHUD.h"
#import "joiFirstPage.h"
#import "joiLevels.h"
#import "joiCore.h"
#import "joiIntro.h"
#import "DVScrollNode.h"

typedef enum {
	kStateIntro = -1,
    kStateMenu = 0,
	kStateRunningBook,
	kStateRunningGame,
    kStateGameOver,
    kStatePause
} GameState;

@interface joiScene : PIOScrollScene {
	SKNode *_layerEntrance;
	SKNode *_layerBackground;
	SKNode *_layerBackgroundAnimation;
	SKNode *_layerForeground;
	SKNode *_layerHUD;
}

@property (nonatomic) GameState gameState;
@property (nonatomic, assign) int deviceType;

-(id)initWithSize:(CGSize)size;
-(void)update:(CFTimeInterval)currentTime;
-(void)deviceConfig:(int)deviceCode;
-(void)thingHappened:(NSNotification*) notification;

@end
