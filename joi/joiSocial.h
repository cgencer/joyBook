//
//  joiSocial.h
//  joi
//
//  Created by Cem Gencer on 5.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface joiSocial : NSObject

@property (nonatomic, strong) NSArray *statuses;

@property (nonatomic, weak) IBOutlet UITextField *consumerKeyTextField;
@property (nonatomic, weak) IBOutlet UITextField *consumerSecretTextField;

- (IBAction)loginWithiOSAction:(id)sender;
- (IBAction)loginInSafariAction:(id)sender;
- (IBAction)getTimelineAction:(id)sender;

- (void)setOAuthToken:(NSString *)token oauthVerifier:(NSString *)verfier;

@end
