//
//  DVScrollNode.h
//  Shining Iron
//
//  Created by Dmitry Volevodz on 21.06.14.
//  Copyright (c) 2014 Dmitry Volevodz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DVScrollNode : SKSpriteNode

@property (nonatomic) CGSize contentSize;
@property (nonatomic) SKSpriteNode *contentView;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)scrollToTop;

@end
