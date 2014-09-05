//
//  joiScene.h
//  joi
//
//  Created by Cem Gencer on 4.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface joiScene : SKScene

@property (nonatomic) CGSize contentSize;
@property(nonatomic) CGPoint contentOffset;

-(void)setContentScale:(CGFloat)scale;

@end
