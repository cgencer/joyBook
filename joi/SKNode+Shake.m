//
//  SKNode+Shake.m
//  Shining Iron
//
//  Created by Dmitry Volevodz on 14.06.14.
//  Copyright (c) 2014 Dmitry Volevodz. All rights reserved.
//

#import "SKNode+Shake.h"

@implementation SKNode (Shake)

-(void)shake:(NSInteger)times
{
    CGPoint initialPoint = self.position;
    NSInteger amplitudeX = 2;
    NSInteger amplitudeY = 16;
    NSMutableArray * randomActions = [NSMutableArray array];
    for (int i=0; i<times; i++) {
        NSInteger randX = self.position.x+arc4random() % amplitudeX - amplitudeX/2;
        NSInteger randY = self.position.y+arc4random() % amplitudeY - amplitudeY/2;
        SKAction *action = [SKAction moveTo:CGPointMake(randX, randY) duration:0.01];
        [randomActions addObject:action];
    }
    
    SKAction *rep = [SKAction sequence:randomActions];
    
    [self runAction:rep completion:^{
        self.position = initialPoint;
    }];
}

- (void)doubleScale
{
    self.xScale = 2.0;
    self.yScale = 2.0;
}

@end
