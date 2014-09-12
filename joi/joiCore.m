//
//  joiDelegate.m
//  joi
//
//  Created by Cem Gencer on 11.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import "joiCore.h"

@implementation joiCore

@synthesize delegate;

-(id)init {
    self = [super init];
    return self;
}

-(void)helloDelegate {
    [delegate sayHello:self];
}

-(void)dealloc {
//    [super dealloc];
}

@end