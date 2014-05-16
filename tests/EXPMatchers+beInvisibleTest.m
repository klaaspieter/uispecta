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
  UIWindow *window;
  UIView *visibleView;
  UIView *hiddenView;
  UIView *transparentView;
  UIView *orphanView;
  NSObject *object;
}

@end

@implementation EXPMatchers_beInvisibleTest

- (void)setUp {
  window = ({
    UIWindow *w = [[UIWindow alloc] init];
    w.screen = [UIScreen mainScreen];
    w.hidden = NO;
    w;
  });
  
  visibleView = ({
    UIView *view = [[UIView alloc] init];
    [window addSubview:view];
    view;
  });
  
  hiddenView = ({
    UIView *view = [[UIView alloc] init];
    view.hidden = YES;
    [window addSubview:view];
    view;
  });
  
  transparentView = ({
    UIView *view = [[UIView alloc] init];
    view.alpha = 0.0;
    [window addSubview:view];
    view;
  });
  
  orphanView = [[UIView alloc] init];
  object = [[NSObject alloc] init];
}

- (void)test_visible {
  assertPass(test_expect(hiddenView).to.beInvisible());
  assertPass(test_expect(transparentView).to.beInvisible());
  assertPass(test_expect(orphanView).to.beInvisible());
  assertFail(test_expect(visibleView).to.beInvisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be hidden, but it's visible", visibleView]));
  assertFail(test_expect(object).to.beInvisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
  
}

- (void)test_not_invisible {
  assertPass(test_expect(visibleView).notTo.beInvisible());
  assertFail(test_expect(hiddenView).notTo.beInvisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", hiddenView]));
  assertFail(test_expect(transparentView).notTo.beInvisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", transparentView]));
  assertFail(test_expect(orphanView).notTo.beInvisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", orphanView]));
  assertFail(test_expect(object).notTo.beInvisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
}

@end
