//
//  joiSocial.m
//  joi
//
//  Created by Cem Gencer on 5.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiSocial.h"
#import <FacebookSDK/FacebookSDK.h>

@interface joiSocial ()
//	@property (nonatomic, strong) STTwitterAPI *twitter;
@end

@implementation joiSocial

//	_consumerKeyTextField.text = @"PdLBPYUXlhQpt4AguShUIw";
//	_consumerSecretTextField.text = @"drdhGuKSingTbsDLtYpob4m5b5dn1abf9XXYyZKQzk";

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

@end
