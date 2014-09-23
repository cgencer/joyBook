//
//  joiAnimButton.h
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Spritekit-Helper.h"
#import "joiFrame.h"
#import "joiMenuItem.h"

@interface joiAnimButton : SKSpriteNode

@property (strong, nonatomic) NSString *theName;
@property (assign, nonatomic) CGSize theSize;
@property (assign, nonatomic) NSUInteger theID;
@property (nonatomic, strong) SKSpriteNode *selectedNode;
@property (assign, nonatomic) CGRect myFrame;
@property (nonatomic, weak) SKNode *draggedNode;

-(id)initWithSize:(CGSize)size
			named:(NSString*)name
		 position:(CGPoint)pos
		fromAtlas:(NSString*)atlas
 withFramePattern:(NSString*)pattern
		andFrames:(NSUInteger)frameNo
			andID:(NSUInteger)bid;

-(void)selectBook:(NSUInteger)selectedBookID;
-(void)playAnim;
//-(float)degToRad:(float)degree;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end