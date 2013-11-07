//
//  EXPMatchers+beAnimating.m
//  UISpecta
//
//  Created by Klaas Pieter Annema on 07-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "TestHelper.h"

#import "EXPMatchers+beAnimating.h"
#import "UISpectaSupport.h"

@interface AnimatableObject : NSObject
@property (nonatomic, readwrite, assign) BOOL isAnimating;
@end

@implementation AnimatableObject
@end

@interface EXPMatchers_beAnimating : TEST_SUPERCLASS {
  NSObject *object;
  UIActivityIndicatorView *animatingActivityIndicator;
  UIActivityIndicatorView *activityIndicator;

  AnimatableObject *animatingObject;
  AnimatableObject *animatableObject;
}
@end

@implementation EXPMatchers_beAnimating

- (void)setUp;
{
  object = [[NSObject alloc] init];

  activityIndicator = [[UIActivityIndicatorView alloc] init];
  animatingActivityIndicator = [[UIActivityIndicatorView alloc] init];
  [animatingActivityIndicator startAnimating];

  animatableObject = [[AnimatableObject alloc] init];
  animatingObject = [[AnimatableObject alloc] init];
  animatingObject.isAnimating = YES;
}

- (void)test_beAnimating {
  assertPass(test_expect(animatingActivityIndicator).to.beAnimating());
  assertPass(test_expect(animatingObject).to.beAnimating());
  assertFail(test_expect(activityIndicator).to.beAnimating(), ([NSString stringWithFormat:@"expected: <UIActivityIndicatorView %p> to be animating, but it isn't", activityIndicator]));
  assertFail(test_expect(animatableObject).to.beAnimating(), ([NSString stringWithFormat:@"expected: <AnimatableObject %p> to be animating, but it isn't", animatableObject]));
  assertFail(test_expect(object).to.beAnimating(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isAnimating, but it doesn't", object]));
}

- (void)test_not_beAnimating {
  assertPass(test_expect(activityIndicator).notTo.beAnimating());
  assertPass(test_expect(animatableObject).notTo.beAnimating());
  assertFail(test_expect(animatingActivityIndicator).notTo.beAnimating(), ([NSString stringWithFormat:@"expected: <UIActivityIndicatorView %p> not to be animating, but it is", animatingActivityIndicator]));
  assertFail(test_expect(animatingObject).notTo.beAnimating(), ([NSString stringWithFormat:@"expected: <AnimatableObject %p> not to be animating, but it is", animatingObject]));
  assertFail(test_expect(object).notTo.beAnimating(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isAnimating, but it doesn't", object]));
}

@end
