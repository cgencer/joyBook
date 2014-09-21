//
//  joiAnim.h
//  joi
//
//  Created by Cem Gencer on 2.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"
#import "joiLocation.h"
#import "joiFrame.h"

@protocol joiAnim @end

@interface joiAnim : JSONModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;			// NONE, BACKGROUND, TOUCH, LOOP
@property (strong, nonatomic) NSString *tween;			// NONE, STILL, LINEAR, 
@property (assign, nonatomic) BOOL chained;
@property (strong, nonatomic) NSString<Optional> *next;			// NONE or named anim
@property (assign, nonatomic) NSNumber<Optional, ConvertOnDemand>* pauseBegin;
@property (assign, nonatomic) NSNumber<Optional, ConvertOnDemand>* pauseEnd;
@property (strong, nonatomic) joiLocation *posStart;
@property (strong, nonatomic) joiLocation<Optional> *posEnd;
@property (strong, nonatomic) joiFrame *frameSeq;
@property (assign, nonatomic) NSNumber<Optional, ConvertOnDemand>* interval;
@property (strong, nonatomic) NSString<Optional> *audio;
@property (strong, nonatomic) NSString<Optional> *video;	// transparent background video
// http://emilytoop.com/2012/05/16/playing-movies-with-an-alpha-channel-on-the-ipad/

@end
