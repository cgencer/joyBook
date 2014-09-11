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

@interface joiScene : SKScene <joiCoreDelegate> {
	SKNode *_layerEntrance;
	SKNode *_layerBackground;
	SKNode *_layerBackgroundAnimation;
	SKNode *_layerForeground;
	SKNode *_layerHUD;
}

@property (nonatomic) CGSize contentSize;
@property (nonatomic) CGPoint contentOffset;
@property (nonatomic) CGSize boundSize;

-(void)setContentScale:(CGFloat)scale;

@end
