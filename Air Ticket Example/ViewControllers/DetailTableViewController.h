//
//  DetailTableViewController.h
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewController : UITableViewController

/// Flight list
@property(nonatomic) NSArray *flightList;

/*!
 *  @brief  Default initialiser
 *
 *  @param flightList Flight List
 *
 *  @return instance value
 */
- (instancetype)initWithList:(NSArray *) flightList NS_DESIGNATED_INITIALIZER;

@end
