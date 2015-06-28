//
//  AirlineTableViewCell.h
//  Air Ticket Example
//
//  Created by Apro on 26/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const int AirlineCellHeight;

@interface AirlineTableViewCell : UITableViewCell

/// Airline logo Image view
@property(nonatomic, weak) IBOutlet UIImageView *logoImageView;

/// Airline name label
@property(nonatomic, weak) IBOutlet UILabel *nameLabel;

/// Outbound duration label
@property(nonatomic, weak) IBOutlet UILabel *outboundDurationLabel;

/// Inbound duration label
@property(nonatomic, weak) IBOutlet UILabel *inboundDurationLabel;

/// Total price label
@property(nonatomic, weak) IBOutlet UILabel *priceLabel;

@end
