//
//  EXPMatchers+beVisible.m
//  UISpecta
//
//  Created by Klaas Pieter Annema on 07-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "EXPMatchers+beVisible.h"

#import "UISpectaSupport.h"

EXPMatcherImplementationBegin(beVisible, (void)) {
  BOOL actualIsCompatible = [actual respondsToSelector:@selector(isHidden)] && [actual respondsToSelector:@selector(alpha)];

  prerequisite(^BOOL {
    return actualIsCompatible;
  });

  match(^BOOL {
    if (!actualIsCompatible) {
      return NO;
    } else {
      return ![actual isHidden] && [actual alpha] > 0.0 && [[actual window] screen];
    }
  });

  failureMessageForTo(^NSString * {
    if (!actualIsCompatible) {
      return [NSString stringWithFormat:@"expected: %@ to respond to isHidden and alpha, but it doesn't", UISDescribeObject(actual)];
    } else {
      return [NSString stringWithFormat:@"expected: %@ to be visible, but it's hidden", UISDescribeObject(actual)];
    }
  });

  failureMessageForNotTo(^NSString * {
    if (!actualIsCompatible) {
      return [NSString stringWithFormat:@"expected: %@ to respond to isHidden and alpha, but it doesn't", UISDescribeObject(actual)];
    } else {
      return [NSString stringWithFormat:@"expected: %@ to be hidden, but it's visible", UISDescribeObject(actual)];
    }
  });
}
EXPMatcherImplementationEnd