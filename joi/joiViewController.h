//
//  joiViewController.h
//  joi
//
//  Created by Cem Gencer on 25.08.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "PIOScrollSceneViewController.h"
#import "JSONModelLib.h"
#import "joiCollection.h"
#import "joiScene.h"

@interface joiViewController : PIOScrollSceneViewController {
	NSMutableArray* viewControllerArray;
	NSArray *_locations;
	NSData *data;
	joiCollection* _bookSet;
}

@property (nonatomic, strong) joiScene *theScene;

- (int)checkRetina;

@end
