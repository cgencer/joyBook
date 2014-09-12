//
//  joiDelegate.h
//  joi
//
//  Created by Cem Gencer on 11.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <BlaClass/BlaClass.h>

@class joiCore;

@protocol joiCoreDelegate

-(void)sayHello:(joiCore *) jc;

@end

@interface joiCore : NSObject {
}

@property (nonatomic, assign) id delegate;

-(void)helloDelegate;

@end
