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
#import "joiBookset.h"
#import <FacebookSDK/FacebookSDK.h>

#define ARC4RANDOM_MAX	0x100000000


@interface joiViewController () <DMLazyScrollViewDelegate> {
	DMLazyScrollView* lazyScrollView;
	NSMutableArray* viewControllerArray;
    NSArray *_locations;
	NSData *data;
//	@property (nonatomic, strong) STTwitterAPI *twitter;
}
@end

@implementation joiViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	NSString* setPath = [[NSBundle mainBundle] pathForResource:@"set" ofType:@"json"];
	NSError* err = nil;
	NSString* json = [NSString stringWithContentsOfFile:setPath
									 		   encoding:NSUTF8StringEncoding
                                                  error:&err];
	if(err) {
		NSLog(@"ERROR while loading from file: %@", err);
	}

	err = nil;
	joiBookset* theBook = [[joiBookset alloc] initWithString:json error:&err];
	if(err) {
		NSLog(@"ERROR while initialising the bookset: %@", err);
	}

	NSLog(@"testing: %@", json);


//	_consumerKeyTextField.text = @"PdLBPYUXlhQpt4AguShUIw";
//	_consumerSecretTextField.text = @"drdhGuKSingTbsDLtYpob4m5b5dn1abf9XXYyZKQzk";

	// PREPARE PAGES
	NSUInteger numberOfPages = 10;
	viewControllerArray = [[NSMutableArray alloc] initWithCapacity:numberOfPages];

	for (NSUInteger k = 0; k < numberOfPages; ++k) {
		[viewControllerArray addObject:[NSNull null]];
	}
	
	// PREPARE LAZY VIEW
	CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	lazyScrollView = [[DMLazyScrollView alloc] initWithFrame:rect];
	[lazyScrollView setEnableCircularScroll:NO];
	[lazyScrollView setAutoPlay:NO];
	
	__weak __typeof(&*self)weakSelf = self;
	lazyScrollView.dataSource = ^(NSUInteger index) {
		return [weakSelf controllerAtIndex:index];
	};
	lazyScrollView.numberOfPages = numberOfPages;
	// lazyScrollView.controlDelegate = self;
	[self.view addSubview:lazyScrollView];

/*
	UIImage *background = [UIImage imageNamed: @"back.png"];
	UIImageView *imageView = [[UIImageView alloc] initWithImage: background];
	
	[self.view addSubview: imageView];
*/	
	// MOVE NEXT
	UIButton*btn_moveForward = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn_moveForward setTitle:@"MOVE BY +" forState:UIControlStateNormal];
	[btn_moveForward addTarget:self action:@selector(btn_moveForward:) forControlEvents:UIControlEventTouchUpInside];
/*    [btn_moveForward setFrame:CGRectMake(self.view.frame.size.width / 2.0f,
										 lazyScrollView.frame.origin.y + lazyScrollView.frame.size.height + 5,
										 320 / 2.0f, 40)];
*/
	[btn_moveForward setFrame:CGRectMake(self.view.frame.size.width - (self.view.frame.size.width / 16 * 2),
										(self.view.frame.size.height / 4) * 2 - (self.view.frame.size.height / 8),
										self.view.frame.size.width / 16, 
										self.view.frame.size.height / 4)];
	[self.view addSubview:btn_moveForward];
	
	// MOVE PREV
	UIButton*btn_moveBackward = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn_moveBackward setTitle:@"MOVE BY -" forState:UIControlStateNormal];
	[btn_moveBackward addTarget:self action:@selector(btn_moveBack:) forControlEvents:UIControlEventTouchUpInside];
/*    [btn_moveBackward setFrame:CGRectMake(0,
										  lazyScrollView.frame.origin.y + lazyScrollView.frame.size.height + 5,
										  320/2.0f, 40)];
*/
	[btn_moveBackward setFrame:CGRectMake((self.view.frame.size.width / 16 * 2),
										(self.view.frame.size.height / 4) * 2 - (self.view.frame.size.height / 8),
										self.view.frame.size.width / 16, 
										self.view.frame.size.height / 4)];
	[btn_moveBackward setFrame:CGRectMake(0,
										  lazyScrollView.frame.origin.y + lazyScrollView.frame.size.height + 5,
										  320/2.0f, 40)];
	[self.view addSubview:btn_moveBackward];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) btn_moveBack:(id) sender {
	[lazyScrollView moveByPages:-1 animated:YES];
}

- (void) btn_moveForward:(id) sender {
	[lazyScrollView moveByPages:1 animated:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)shareOnFacebook {
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
		@"Sharing Tutorial", @"name",
		@"Build great social apps and get more installs.", @"caption",
		@"Allow your users to share stories on Facebook from your app using the iOS SDK.", @"description",
		@"https://developers.facebook.com/docs/ios/share/", @"link",
		@"http://i.imgur.com/g3Qc1HN.png", @"picture",
		nil];

	[FBRequestConnection startWithGraphPath:@"/me/feed"
						parameters:params
						HTTPMethod:@"POST"
						completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
							if (!error) {
								// Link posted successfully to Facebook
								NSLog(@"result: %@", result);
							} else {
								// An error occurred, we need to handle the error
								// See: https://developers.facebook.com/docs/ios/errors
								NSLog(@"%@", error.description);
							}
	}];
}

- (IBAction)loginWithiOSAction:(id)sender {
/*
	self.twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
	
	_loginStatusLabel.text = @"Trying to login with iOS...";
	_loginStatusLabel.text = @"";

	[_twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
		_loginStatusLabel.text = username;
	} errorBlock:^(NSError *error) {
		_loginStatusLabel.text = [error localizedDescription];
	}];
*/
}

- (IBAction)loginInSafariAction:(id)sender {
	
/*	self.twitter = [STTwitterAPI twitterAPIWithOAuthConsumerKey:_consumerKeyTextField.text
												 consumerSecret:_consumerSecretTextField.text];
	
	_loginStatusLabel.text = @"Trying to login with Safari...";
	_loginStatusLabel.text = @"";
	
	[_twitter postTokenRequest:^(NSURL *url, NSString *oauthToken) {
		NSLog(@"-- url: %@", url);
		NSLog(@"-- oauthToken: %@", oauthToken);
		
		[[UIApplication sharedApplication] openURL:url];
	} authenticateInsteadOfAuthorize:NO
					forceLogin:@(YES)
					screenName:nil
				 oauthCallback:@"myapp://twitter_access_tokens/"
					errorBlock:^(NSError *error) {
						NSLog(@"-- error: %@", error);
						_loginStatusLabel.text = [error localizedDescription];
					}];
*/
}

- (void)setOAuthToken:(NSString *)token oauthVerifier:(NSString *)verifier {
	
/*	[_twitter postAccessTokenRequestWithPIN:verifier successBlock:^(NSString *oauthToken, NSString *oauthTokenSecret, NSString *userID, NSString *screenName) {
		NSLog(@"-- screenName: %@", screenName);
		
		_loginStatusLabel.text = screenName;
*/		
		/*
		 At this point, the user can use the API and you can read his access tokens with:
		 
		 _twitter.oauthAccessToken;
		 _twitter.oauthAccessTokenSecret;
		 
		 You can store these tokens (in user default, or in keychain) so that the user doesn't need to authenticate again on next launches.
		 
		 Next time, just instanciate STTwitter with the class method:
		 
		 +[STTwitterAPI twitterAPIWithOAuthConsumerKey:consumerSecret:oauthToken:oauthTokenSecret:]
		 
		 Don't forget to call the -[STTwitter verifyCredentialsWithSuccessBlock:errorBlock:] after that.
		 */
		
/*	} errorBlock:^(NSError *error) {
		_loginStatusLabel.text = [error localizedDescription];
		NSLog(@"-- %@", [error localizedDescription]);
	}];
*/
}

- (IBAction)getTimelineAction:(id)sender {
	
/*	self.getTimelineStatusLabel.text = @"";
	
	[_twitter getHomeTimelineSinceID:nil
							   count:20
						successBlock:^(NSArray *statuses) {
							
							NSLog(@"-- statuses: %@", statuses);
							
							self.getTimelineStatusLabel.text = [NSString stringWithFormat:@"%lu statuses", (unsigned long)[statuses count]];
							
							self.statuses = statuses;
							
							[self.tableView reloadData];
							
						} errorBlock:^(NSError *error) {
							self.getTimelineStatusLabel.text = [error localizedDescription];
						}];
*/
}

//- (NSArray *)parseJSONFile:(NSString *) path
//{
//	return json;
//}

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
													 alpha: 1.0f];
		
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

- (void)lazyScrollViewDidEndDragging:(DMLazyScrollView *)pagingView {
	NSLog(@"Now visible: %@",lazyScrollView.visibleViewController);
}
 
@end