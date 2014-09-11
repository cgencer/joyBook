//
//  joiDelegate.h
//  joi
//
//  Created by Cem Gencer on 11.09.2014.
//  Copyright (c) 2014 Cem Gencer. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <BlaClass/BlaClass.h>

@class joiCore;             //define class, so protocol can see MyClass

// define the protocol for the delegate
@protocol joiCoreDelegate

// define protocol functions that can be used in any class using this delegate
-(void)sayHello:(joiCore *) jc;

@end

@interface joiCore : NSObject {
}
@property (nonatomic, assign) id delegate; //define MyClassDelegate as delegate

// define public functions
-(void)helloDelegate;

@end
