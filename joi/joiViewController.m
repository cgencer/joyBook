//
//  joiViewController.m
//  joi
//
//  Created by Cem Gencer on 25.08.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiViewController.h"

#define ARC4RANDOM_MAX	0x100000000
static NSString * kViewTransformChanged = @"view transform changed";

@implementation joiViewController

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	return YES;
}

- (void)viewWillLayoutSubviews
{
	[super viewWillLayoutSubviews];

	SKView *skView = (SKView *)self.view;
	if (!self.theScene) {
		skView.showsFPS = YES;
		skView.showsNodeCount = YES;
		self.theScene = [[joiScene alloc] initWithSize:self.spriteKitView.frame.size];
		NSLog(@"JOIVC>Size: %@", NSStringFromCGSize(self.spriteKitView.frame.size));

		[self.theScene deviceConfig:[self checkRetina]];
		self.theScene.scaleMode = SKSceneScaleModeAspectFill;
		[skView presentScene:self.theScene];
	}
}

- (UIImage*)loadImage
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString* path = [documentsDirectory stringByAppendingPathComponent:@"test.png" ];
	UIImage* image = [UIImage imageWithContentsOfFile:path];
	return image;
}

// 0 for standard resolution iPhone/iPod touch
// 1 for retina iPhone
// 2 for standard resolution iPad
// 3 for retina iPad.
- (int)checkRetina
{
    int d = 0; // standard display
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2.0)
	{
		d = 1; // is retina display
	}
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		d += 2;
	}
	return d;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end