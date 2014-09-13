//
//  SKAdditions.h
//  Fastburn
//
//  Created by Dmitry Volevodz on 23.06.14.
//  Copyright (c) 2014 Dmitry Volevodz. All rights reserved.
//

#ifndef Fastburn_SKAdditions_h
#define Fastburn_SKAdditions_h

#import "DVScrollNode.h"
#import "SKBButtonNode.h"
#import "SKNode+Shake.h"
#import "SKTextureAtlas+NearestFiltering.h"
#import "SKUMultilineLabelNode.h"


#define IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define IS_IPAD ((__IPHONE_OS_VERSION_MAX_ALLOWED >= 30200) && (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))

#endif
