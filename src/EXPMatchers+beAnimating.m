//
//  EXPMatchers+isAnimating.m
//  UISpecta
//
//  Created by Klaas Pieter Annema on 07-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "EXPMatchers+beAnimating.h"

#import "UISpectaSupport.h"

EXPMatcherImplementationBegin(beAnimating, (void)) {
  BOOL actualIsCompatible = [actual respondsToSelector:@selector(isAnimating)];

  prerequisite(^BOOL {
    return actualIsCompatible;
  });

  match(^BOOL {
    if (!actualIsCompatible) {
      return NO;
    } else {
      return [actual isAnimating];
    }
  });

  failureMessageForTo(^NSString * {
    if (!actualIsCompatible) {
      return [NSString stringWithFormat:@"expected: %@ to respond to isAnimating, but it doesn't", UISDescribeObject(actual)];
    } else {
      return [NSString stringWithFormat:@"expected: %@ to be animating, but it isn't", UISDescribeObject(actual)];
    }
  });

  failureMessageForNotTo(^NSString * {
    if (!actualIsCompatible) {
      return [NSString stringWithFormat:@"expected: %@ to respond to isAnimating, but it doesn't", UISDescribeObject(actual)];
    } else {
      return [NSString stringWithFormat:@"expected: %@ not to be animating, but it is", UISDescribeObject(actual)];
    }
  });
}
EXPMatcherImplementationEnd