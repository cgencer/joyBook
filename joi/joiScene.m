//
//  joiScene.m
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "joiScene.h"

typedef NS_ENUM(NSInteger, IIMySceneZPosition)
{
    kIIMySceneZPositionScrolling = 0,
    kIIMySceneZPositionVerticalAndHorizontalScrolling,
    kIIMySceneZPositionStatic,
};

@interface joiScene () {
	SKSpriteNode *_dove;
	NSArray *_frames;
}
//kIIMySceneZPositionScrolling
@property (nonatomic, weak) SKSpriteNode *spriteToScroll;
@property (nonatomic, weak) SKSpriteNode *spriteForScrollingGeometry;

//kIIMySceneZPositionStatic
@property (nonatomic, weak) SKSpriteNode *spriteForStaticGeometry;

//kIIMySceneZPositionVerticalAndHorizontalScrolling
@property (nonatomic, weak) SKSpriteNode *spriteToHostHorizontalAndVerticalScrolling;
@property (nonatomic, weak) SKSpriteNode *spriteForHorizontalScrolling;
@property (nonatomic, weak) SKSpriteNode *spriteForVerticalScrolling;
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
    [self.spriteToScroll setScale:scale];
    [self updateConstrainedScrollerSize];
}

-(void)updateConstrainedScrollerSize
{

    CGSize contentSize = [self contentSize];
    CGSize verticalSpriteSize = [self.spriteForVerticalScrolling size];
    verticalSpriteSize.height = contentSize.height;
    [self.spriteForVerticalScrolling setSize:verticalSpriteSize];

    CGSize horizontalSpriteSize = [self.spriteForHorizontalScrolling size];
    horizontalSpriteSize.width = contentSize.width;
    [self.spriteForHorizontalScrolling setSize:horizontalSpriteSize];

    CGFloat xScale = [self.spriteToScroll xScale];
    CGFloat yScale = [self.spriteToScroll yScale];
    [self.spriteForVerticalScrolling setYScale:yScale];
    [self.spriteForVerticalScrolling setXScale:xScale];
    [self.spriteForHorizontalScrolling setXScale:xScale];
    [self.spriteForHorizontalScrolling setYScale:yScale];
    CGFloat xScaleReciprocal = 1.0/xScale;
    CGFloat yScaleReciprocal = 1/yScale;
    for (SKNode *node in [self.spriteForVerticalScrolling children])
    {
        [node setXScale:xScaleReciprocal];
        [node setYScale:yScaleReciprocal];
    }
    for (SKNode *node in [self.spriteForHorizontalScrolling children])
    {
        [node setXScale:xScaleReciprocal];
        [node setYScale:yScaleReciprocal];
    }

    [self setContentOffset:self.contentOffset];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}
@end
