//
//  RESTClient.h
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTClient <NSObject>

/*!
 *  @brief  GETs flight routes
 *
 *  @param paramsDict   URL params, cannot be nil
 *  @param successHandler   success handler
 *  @param errorHandler error handler.
 */
- (void) get_routesWithParams:(NSDictionary *) paramsDict
                    onSuccess:(void (^)(NSArray *response)) successHandler onError:(void (^)(NSError *error)) errorHandler;

@end


@interface RESTClientImpl : NSObject <RESTClient>

/*!
 *  @brief  Method provides access to singleton instance
 *
 *  @return singleton instance
 */
+ (instancetype) sharedInstance;

@end
