//
//  joiBook.h
//  joi
//
//  Created by Cem Gencer on 2.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "JSONModel.h"
#import "joiAnim.h"
#import "joiMenuItem.h"

@protocol joiBook @end

@interface joiBook : JSONModel

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString<Optional> *orientation;	// PORTRAIT, def: LANDSCAPE
@property (strong, nonatomic) joiMenuItem *menuItem;
@property (strong, nonatomic) NSString *stage;
@property (strong, nonatomic) NSString<Optional>* audio;
@property (strong, nonatomic) NSString<Optional>* backPic;
@property (strong, nonatomic) joiAnim *backAnim;
@property (strong, nonatomic) NSArray<joiAnim, ConvertOnDemand>* actions;

@end
