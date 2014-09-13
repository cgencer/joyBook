//
//  SKTextureAtlas+NearestFiltering.m
//  Shining Iron
//
//  Created by Dmitry Volevodz on 07.06.14.
//  Copyright (c) 2014 Dmitry Volevodz. All rights reserved.
//

#import "SKTextureAtlas+NearestFiltering.h"

@implementation SKTextureAtlas (NearestFiltering)

- (SKTexture *)nearestTextureNamed:(NSString *)name
{
    SKTexture *temp = [self textureNamed:name];
    temp.filteringMode = SKTextureFilteringNearest;
    return temp;
}

@end
