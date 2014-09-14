//
//  joiViewController.m
//  joi
//
//  Created by Cem Gencer on 25.08.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiViewController.h"
#import "JSONModelLib.h"
#import "joiScene.h"

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
	if (!skView.scene) {
		skView.showsFPS = YES;
		skView.showsNodeCount = YES;

		SKScene *scene = [joiScene sceneWithSize:skView.bounds.size];
		NSLog(@"JOIVC>Size: %@", NSStringFromCGSize(skView.bounds.size));

		scene.scaleMode = SKSceneScaleModeAspectFill; //	SKSceneScaleModeResizeFill

		//        scene.position = CGPointMake(-CGRectGetMidX(skView.bounds), -CGRectGetMidY(skView.bounds));

		[skView presentScene:scene];
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