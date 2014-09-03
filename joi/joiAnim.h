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

@property (strong, nonatomic) NSArray<joiLocation, ConvertOnDemand>* startPos;
@property (strong, nonatomic) NSArray<joiLocation, Optional, ConvertOnDemand>* endPos;
@property (strong, nonatomic) NSNumber<Optional> *interval;
@property (strong, nonatomic) NSString *type;			// NONE, BACKGROUND, TOUCH, LOOP
@property (strong, nonatomic) NSString *tween;			// NONE, STILL, LINEAR, 
@property (strong, nonatomic) NSArray<joiFrame, ConvertOnDemand>* frames;
@property (strong, nonatomic) NSString<Optional> *audio;
@property (strong, nonatomic) NSNumber<Optional> *startTime;
@property (strong, nonatomic) NSString<Optional> *video;	// transparent background video
// http://emilytoop.com/2012/05/16/playing-movies-with-an-alpha-channel-on-the-ipad/

@end
