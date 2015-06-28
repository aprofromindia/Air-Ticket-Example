//
//  FlightItemModel.h
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "JSONModel.h"

@protocol FlightModel <NSObject>

@end


/*!
 *  @brief  Flight Model class
 */

@interface FlightModel : JSONModel

/// Flight company logo url
@property(nonatomic) NSString *logoURL;

/// Airline name.
@property(nonatomic) NSString *airlineName;

/// Outbound flight duration.
@property(nonatomic) NSString *outboundFlightDuration;

/// Optional inbound flight duration.
@property(nonatomic) NSString *inboundFlightDuration;

/// total fare amount.
@property(nonatomic) NSNumber *totalAmount;

@end
