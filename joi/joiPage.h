//
//  joiPage.h
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "joiModel.h"
#import "joiBook.h"

@interface joiPage : SKSpriteNode {
	NSInteger midX;
	NSInteger midY;
	joiModel* theModel;
}

-(void)loadBundle;
-(id)initWithSpriteImageName:(NSString*)name;
-(void)setCoordX:(NSInteger)coordX andY:(NSInteger)coordX;

@property (nonatomic) joiBook* theBook;
//@property (nonatomic) CGPoint* midCoords;

@end
