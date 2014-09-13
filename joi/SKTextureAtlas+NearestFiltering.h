//
//  SKTextureAtlas+NearestFiltering.h
//  Shining Iron
//
//  Created by Dmitry Volevodz on 07.06.14.
//  Copyright (c) 2014 Dmitry Volevodz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKTextureAtlas (NearestFiltering)

- (SKTexture *)nearestTextureNamed:(NSString *)name;

@end
