//
//  FlightItemModel.m
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "FlightModel.h"

@implementation FlightModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"AirlineLogoAddress" : @"logoURL",
                                                       @"AirlineName" : @"airlineName",
                                                       @"OutboundFlightsDuration" : @"outboundFlightDuration",
                                                       @"InboundFlightsDuration" : @"inboundFlightDuration",
                                                       @"TotalAmount" : @"totalAmount"
                                                       }];
}

@end
