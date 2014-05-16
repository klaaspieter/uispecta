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
  UIWindow *window;
  UIView *visibleView;
  UIView *hiddenView;
  UIView *transparentView;
  UIView *orphanView;
  NSObject *object;
}

@end

@implementation EXPMatchers_beVisibleTest

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

- (void)test_beVisible {
  assertPass(test_expect(visibleView).to.beVisible());
  assertFail(test_expect(hiddenView).to.beVisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", hiddenView]));
  assertFail(test_expect(transparentView).to.beVisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", transparentView]));
  assertFail(test_expect(orphanView).to.beVisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be visible, but it's hidden", orphanView]));
  assertFail(test_expect(object).to.beVisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
}

- (void)test_not_beVisible {
  assertPass(test_expect(hiddenView).toNot.beVisible());
  assertPass(test_expect(transparentView).notTo.beVisible());
  assertPass(test_expect(orphanView).notTo.beVisible());
  assertFail(test_expect(visibleView).notTo.beVisible(), ([NSString stringWithFormat:@"expected: <UIView %p> to be hidden, but it's visible", visibleView]));
  assertFail(test_expect(object).notTo.beVisible(), ([NSString stringWithFormat:@"expected: <NSObject %p> to respond to isHidden and alpha, but it doesn't", object]));
}

@end
