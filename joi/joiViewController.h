//
//  joiViewController.h
//  joi
//
//  Created by Cem Gencer on 25.08.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "DMLazyScrollView.h"
#import "JSONModelLib.h"
#import "joiCollection.h"
#import "joiScene.h"

@interface joiViewController : UIViewController<UIScrollViewDelegate, DMLazyScrollViewDelegate> {
	DMLazyScrollView* bookPagesScrollView;
	NSMutableArray* viewControllerArray;
	NSArray *_locations;
	NSData *data;
//	BOOL *didPresentScene;
	joiCollection* _bookSet;
}

@property(nonatomic, weak)joiScene *scene;
@property(nonatomic, weak)UIView *clearContentView;
@property(nonatomic)CGSize screenDimensions;
@end
