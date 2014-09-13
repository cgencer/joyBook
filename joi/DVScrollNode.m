//
//  DVScrollNode.m
//  Shining Iron
//
//  Created by Dmitry Volevodz on 21.06.14.
//  Copyright (c) 2014 Dmitry Volevodz. All rights reserved.
//

#import "DVScrollNode.h"

@interface DVScrollNode ()

@property (strong, nonatomic) UITouch *scrollTouch;
@property (nonatomic) NSTimeInterval timestamp;
@property (nonatomic) double touchStartY;

@end

@implementation DVScrollNode

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithColor:[UIColor clearColor] size:frame.size];
    
    self.userInteractionEnabled = YES;
    self.anchorPoint = CGPointZero;
    self.position = CGPointMake(frame.origin.x, frame.origin.y);
    
    self.contentView = [[SKSpriteNode alloc] initWithColor:[UIColor clearColor] size:frame.size];
    self.contentView.anchorPoint = CGPointMake(0, 1);
    self.contentView.position = CGPointZero;
    
    SKSpriteNode *mask = [SKSpriteNode spriteNodeWithColor:[SKColor blackColor] size: CGSizeMake(frame.size.width, frame.size.height)]; //100 by 100 is the size of the mask
    mask.anchorPoint = CGPointZero;
    SKCropNode *cropNode = [SKCropNode node];
    
    [cropNode addChild: self.contentView];
    [cropNode setMaskNode: mask];
    
    [self addChild:cropNode];
    
    return self;
}

- (void)scrollToTop
{
    self.contentView.position = CGPointMake(0, self.size.height);
}


-(void)setContentSize:(CGSize)contentSize
{
    _contentSize = contentSize;
    self.contentView.size = contentSize;
    self.contentView.position = CGPointMake(0, self.size.height);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.scrollTouch) {
        UITouch* touch = [touches anyObject];
        if ([self shouldRespondToTouchAtLocation:[touch locationInNode:self]])
        {
            self.scrollTouch = touch;
            self.timestamp = touch.timestamp;
            self.touchStartY = [touch locationInNode:self].y;
            
        } else {
            //Foreward the message to next responder
            [super touchesBegan:touches withEvent:event];
        }
    }
}

-(BOOL)shouldRespondToTouchAtLocation:(CGPoint)location
{
    return YES;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([touches containsObject:self.scrollTouch]) {
        
        CGPoint currentLocation = [self.scrollTouch locationInNode:self];
        CGPoint previousLocation = [self.scrollTouch previousLocationInNode:self];
        double delta = currentLocation.y - previousLocation.y;
        
        double proposedPositionY = self.contentView.position.y + delta * 1.5;
        
        if (proposedPositionY > self.contentView.size.height) {
            proposedPositionY = self.contentView.size.height;
        }
        
        if (proposedPositionY < 0 + self.size.height) {
            proposedPositionY = self.size.height;
        }

        self.contentView.position = CGPointMake(self.contentView.position.x, proposedPositionY);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.scrollTouch = nil;
}


@end
