//
//  joiHUD.h
//  joi
//
//  Created by Cem Gencer on 8.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiPage.h"
#import "SKBButtonNode.h"

@interface joiHUD : joiPage {
	CGSize theSize;
}

- (SKSpriteNode *)backButtonNode;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
