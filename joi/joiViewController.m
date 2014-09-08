//
//  joiViewController.m
//  joi
//
//  Created by Cem Gencer on 25.08.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiViewController.h"
#import "DMLazyScrollView.h"
#import "JSONModelLib.h"
#import "joiCollection.h"
#import "joiScene.h"
#import "joiModel.h"

#define ARC4RANDOM_MAX	0x100000000
static NSString * kViewTransformChanged = @"view transform changed";

@interface joiViewController () <DMLazyScrollViewDelegate> {
	DMLazyScrollView* bookPagesScrollView;
	NSMutableArray* viewControllerArray;
	NSArray *_locations;
	NSData *data;
//	BOOL *didPresentScene;
	joiCollection* _bookSet;
	joiModel* theModel;
}
@property(nonatomic, weak)joiScene *scene;
@property(nonatomic, weak)UIView *clearContentView;
@end

@implementation joiViewController

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	 // Override point for customization after application launch.
	return YES;
}

- (void)viewWillLayoutSubviews
{
	[super viewWillLayoutSubviews];
// Configure the view.
	SKView * skView = (SKView *)self.view;
	if (!skView.scene) {
		skView.showsFPS = YES;
		skView.showsNodeCount = YES;
// Create and configure the scene.
		SKScene *scene = [joiScene sceneWithSize:skView.bounds.size];
		scene.scaleMode = SKSceneScaleModeAspectFill;
// Present the scene.
		[skView presentScene:scene];
		NSLog(@"scene built up...");

	    CGSize contentSize = skView.frame.size;
//		[scene setContentSize:contentSize];

// PREPARE PAGES
/*		
			NSUInteger numberOfPages = 10;
			viewControllerArray = [[NSMutableArray alloc] initWithCapacity:numberOfPages];
	
			for (NSUInteger k = 0; k < numberOfPages; ++k) {
				[viewControllerArray addObject:[NSNull null]];
			}

			bookPagesScrollView = [[DMLazyScrollView alloc] initWithFrame:skView.frame];
	    	[bookPagesScrollView setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
	    	[bookPagesScrollView setContentSize:contentSize];
			[bookPagesScrollView setEnableCircularScroll:NO];
			[bookPagesScrollView setAutoPlay:NO];
	
			__weak __typeof(&*self)weakSelf = self;
			bookPagesScrollView.dataSource = ^(NSUInteger index) {
				return [weakSelf controllerAtIndex:index];
			};
			bookPagesScrollView.numberOfPages = numberOfPages;
			bookPagesScrollView.controlDelegate = self;

			[skView addSubview:bookPagesScrollView];
*/
	}

}

- (void)viewDidLoad {
	[super viewDidLoad];

	theModel = [[joiModel alloc] init];
	NSLog(@"...%@", [theModel bookProperty:@"stage"]);


	






/*	
	// MOVE NEXT
	UIButton*btn_moveForward = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn_moveForward setTitle:@"MOVE BY +" forState:UIControlStateNormal];
	[btn_moveForward addTarget:self action:@selector(btn_moveForward:) forControlEvents:UIControlEventTouchUpInside];
	[btn_moveForward setFrame:CGRectMake(self.view.frame.size.width - (self.view.frame.size.width / 16 * 2),
										(self.view.frame.size.height / 4) * 2 - (self.view.frame.size.height / 8),
										self.view.frame.size.width / 16, 
										self.view.frame.size.height / 4)];
	[self.view addSubview:btn_moveForward];
	
	// MOVE PREV
	UIButton*btn_moveBackward = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn_moveBackward setTitle:@"MOVE BY -" forState:UIControlStateNormal];
	[btn_moveBackward addTarget:self action:@selector(btn_moveBack:) forControlEvents:UIControlEventTouchUpInside];
	[btn_moveBackward setFrame:CGRectMake((self.view.frame.size.width / 16 * 2),
										(self.view.frame.size.height / 4) * 2 - (self.view.frame.size.height / 8),
										self.view.frame.size.width / 16, 
										self.view.frame.size.height / 4)];
	[btn_moveBackward setFrame:CGRectMake(0,
										  bookPagesScrollView.frame.origin.y + bookPagesScrollView.frame.size.height + 5,
										  320/2.0f, 40)];
	[self.view addSubview:btn_moveBackward];
*/
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) btn_moveBack:(id) sender {
	[bookPagesScrollView moveByPages:-1 animated:YES];
}

- (void) btn_moveForward:(id) sender {
	[bookPagesScrollView moveByPages:1 animated:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (UIImage*)loadImage
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString* path = [documentsDirectory stringByAppendingPathComponent:@"test.png" ];
	UIImage* image = [UIImage imageWithContentsOfFile:path];
	return image;
}


- (UIViewController *) controllerAtIndex:(NSInteger) index {
	if (index > viewControllerArray.count || index < 0) return nil;
	id res = [viewControllerArray objectAtIndex:index];
	if (res == [NSNull null]) {
		UIViewController *contr = [[UIViewController alloc] init];
		contr.view.backgroundColor = [UIColor colorWithRed: (CGFloat)arc4random()/ARC4RANDOM_MAX
													 green: (CGFloat)arc4random()/ARC4RANDOM_MAX
													  blue: (CGFloat)arc4random()/ARC4RANDOM_MAX
													 alpha: 0.4f];
		
		UILabel* label = [[UILabel alloc] initWithFrame:contr.view.bounds];
		label.backgroundColor = [UIColor clearColor];
		label.text = [NSString stringWithFormat:@"%d",index];
		label.textAlignment = NSTextAlignmentCenter;
		label.font = [UIFont boldSystemFontOfSize:50];
		[contr.view addSubview:label];
		
		[viewControllerArray replaceObjectAtIndex:index withObject:contr];
		return contr;
	}
	return res;
}

- (void)bookPagesScrollViewDidEndDragging:(DMLazyScrollView *)pagingView {
	NSLog(@"Now visible: %@",bookPagesScrollView.visibleViewController);
}

- (BOOL)shouldAutorotate
{
	return FALSE;
}

- (NSUInteger)supportedInterfaceOrientations
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		return UIInterfaceOrientationMaskAllButUpsideDown;
	} else {
		return UIInterfaceOrientationMaskAll;
	}
}

#pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
    if (context == &kViewTransformChanged)
    {
//        [self scrollViewDidTransform:(id)[(UIView *)object superview]];
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)dealloc
{
    @try {
 //       [self.clearContentView removeObserver:self forKeyPath:@"transform"];
    }
    @catch (NSException *exception) {    }
    @finally {    }
}

@end