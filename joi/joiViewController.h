//
//  joiViewController.h
//  joi
//
//  Created by Cem Gencer on 25.08.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface joiViewController : UIViewController

- (IBAction)loginWithiOSAction:(id)sender;
- (IBAction)loginInSafariAction:(id)sender;
- (IBAction)getTimelineAction:(id)sender;

- (void)setOAuthToken:(NSString *)token oauthVerifier:(NSString *)verfier;

@end
