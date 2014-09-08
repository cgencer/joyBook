//
//  joiScene.m
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "joiScene.h"

@interface joiScene () {
	SKSpriteNode *_dove;
	NSArray *_frames;
}
@end

@implementation joiScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {

//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];

		NSMutableArray *theFrames = [NSMutableArray array];
        SKTextureAtlas *cloudAtlas = [SKTextureAtlas atlasNamed:@"dove.atlas"];

        int numImages = cloudAtlas.textureNames.count;
        for (int i=1; i <= numImages; i++) {
            NSString *textureName = [NSString stringWithFormat:@"dove%d", i];
            SKTexture *temp = [cloudAtlas textureNamed:textureName];
            [theFrames addObject:temp];
        }
        _frames = theFrames;

        SKTexture *temp = _frames[0];
        _dove = [SKSpriteNode spriteNodeWithTexture:temp];
        _dove.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

        [self addChild:_dove];
        [self flyingDove];
        
    }
    return self;
}

-(void)flyingDove
{
    [_dove runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:_frames
                                                                    timePerFrame:0.1f
                                                                          resize:NO
                                                                         restore:YES]] withKey:@"walkingInPlaceBear"];
    return;
}

-(void)doveMoveEnded
{
    [_dove removeAllActions];
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
