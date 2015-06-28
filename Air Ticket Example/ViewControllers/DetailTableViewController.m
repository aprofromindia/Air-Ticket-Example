//
//  DetailTableViewController.m
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "DetailTableViewController.h"
#import "AirlineTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FlightModel.h"
#import "FormatterUtil.h"

static NSString *const kCellIdentifier = @"Airline Cell";

@interface DetailTableViewController ()<UITableViewDataSource, UITabBarDelegate>{
    NSArray *_flightList;
}

@end

@implementation DetailTableViewController

#pragma mark - initialisers

- (instancetype)initWithList:(NSArray *)flightList
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _flightList = flightList;
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [self initWithList:nil];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"Flight List", nil);
    
    UINib *cell = [UINib nibWithNibName:@"AirlineTableViewCell" bundle:nil];
    [self.tableView registerNib:cell forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - TableView methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AirlineTableViewCell *airlineCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    FlightModel *flightModel = _flightList[indexPath.row];
    
    [airlineCell.logoImageView sd_setImageWithURL:[NSURL URLWithString:flightModel.logoURL]];
    airlineCell.nameLabel.text = flightModel.airlineName;
    airlineCell.inboundDurationLabel.text = [NSString stringWithFormat:@"%@ %@",
                                             flightModel.inboundFlightDuration, NSLocalizedString(@"hrs.", nil)];
    airlineCell.outboundDurationLabel.text = [NSString stringWithFormat:@"%@ %@",
                                              flightModel.outboundFlightDuration, NSLocalizedString(@"hrs.", nil)];
    
    // amount formatted and displayed.
    NSString * amount = [[FormatterUtil currencyFormatter] stringFromNumber:flightModel.totalAmount];
    airlineCell.priceLabel.text = [NSString stringWithFormat:@"%@", amount];
    
    return airlineCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AirlineCellHeight;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _flightList.count;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
