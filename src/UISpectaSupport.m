//
//  UISpectaSupport.m
//  UISpecta
//
//  Created by Klaas Pieter Annema on 07-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "UISpectaSupport.h"

NSString *UISDescribeObject(id obj) {
  return [NSString stringWithFormat:@"<%@ %p>", [obj class], obj];
}
