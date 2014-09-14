//
//  joiAnimButton.h
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Spritekit-Helper.h"

@interface joiAnimButton : SKSpriteNode

@property (strong, nonatomic) NSString *theName;
@property (assign, nonatomic) CGSize theSize;

-(id)initWithSize:(CGSize)size
			named:(NSString*)name
		fromAtlas:(NSString*)atlas;

-(SKSpriteNode *)doButton:(NSString*)stillFrame
			withFrameName:(NSString*)frameName;

+(NSUInteger) getBookID;
-(void)selectBook:(int)selectedBookID;
-(void)animateButton;

@end