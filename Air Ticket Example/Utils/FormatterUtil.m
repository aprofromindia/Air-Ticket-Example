//
//  FormatterUtil.m
//  Air Ticket Example
//
//  Created by Apro on 27/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "FormatterUtil.h"

static NSNumberFormatter *_currencyFormatter;

@implementation FormatterUtil

+ (NSNumberFormatter *)currencyFormatter{
    _currencyFormatter = [NSNumberFormatter new];
    _currencyFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    return _currencyFormatter;
}

@end
