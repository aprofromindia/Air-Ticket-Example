//
//  ViewController.h
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTClientImpl.h"

@interface ViewController : UIViewController

/*!
 *  @brief  Default initialiser
 *
 *  @param restClient REST Client
 *
 *  @return Instance value
 */
- (instancetype)initWithRESTClient:(id<RESTClient>) restClient NS_DESIGNATED_INITIALIZER;

@end

