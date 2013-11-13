//
//  EXPMatchers+isVisibleTest.m
//  UISpecta
//
//  Created by Klaas Pieter Annema on 07-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "TestHelper.h"

#import "EXPMatchers+beInvisible.h"

@interface EXPMatchers_beInvisibleTest : XCTestCase {
  UIView *visibleView;
  UIView *hiddenView;
  UIView *transparentView;
  NSObject *object;
}

@end

@implementation EXPMatchers_beInvisibleTest

- (void)setUp {
  visibleView = [[UIView alloc] init];

  hiddenView = [[UIView alloc] init];
  hiddenView.hidden = YES;

  transparentView = [[UIView alloc] init];
  transparentView.alpha = 0.0;

  object = [[NSObject alloc] init];
}

- (void)test_hidden {
  assertPass(test_expect(hiddenView).to.beInvisible());
  assertPass(test_expect(transparentView).to.beInvisible());
  assertFail(test_expect(visibleView).to.beInvisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be hidden, but it's visible", visibleView]));
  assertFail(test_expect(object).to.beInvisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
}

- (void)test_not_beHidden {
  assertPass(test_expect(visibleView).notTo.beInvisible());
  assertFail(test_expect(hiddenView).notTo.beInvisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", hiddenView]));
  assertFail(test_expect(transparentView).notTo.beInvisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", transparentView]));
  assertFail(test_expect(object).notTo.beInvisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
}

@end
