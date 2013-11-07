//
//  EXPMatchers+isVisibleTest.m
//  UISpecta
//
//  Created by Klaas Pieter Annema on 07-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "TestHelper.h"

#import "EXPMatchers+beVisible.h"

@interface EXPMatchers_beVisibleTest : XCTestCase {
  UIView *visibleView;
  UIView *hiddenView;
  UIView *transparentView;
  NSObject *object;
}

@end

@implementation EXPMatchers_beVisibleTest

- (void)setUp {
  visibleView = [[UIView alloc] init];

  hiddenView = [[UIView alloc] init];
  hiddenView.hidden = YES;

  transparentView = [[UIView alloc] init];
  transparentView.alpha = 0.0;

  object = [[NSObject alloc] init];
}

- (void)test_beVisible {
  assertPass(test_expect(visibleView).to.beVisible());
  assertFail(test_expect(hiddenView).to.beVisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", hiddenView]));
  assertFail(test_expect(transparentView).to.beVisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", transparentView]));
  assertFail(test_expect(object).to.beVisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
}

- (void)test_not_beVisible {
  assertPass(test_expect(hiddenView).toNot.beVisible());
  assertPass(test_expect(transparentView).notTo.beVisible());
  assertFail(test_expect(visibleView).notTo.beVisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be hidden, but it's visible", visibleView]));
  assertFail(test_expect(object).notTo.beVisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
}

@end
