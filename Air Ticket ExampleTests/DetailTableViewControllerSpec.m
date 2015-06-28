//
//  DetailTableViewControllerSpec.m
//  Air Ticket Example
//
//  Created by Apro on 28/06/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "DetailTableViewController.h"


SpecBegin(DetailTableViewController)

describe(@"DetailTableViewController", ^{
    
    __block DetailTableViewController *_detailVC;
    
    beforeEach(^{
        _detailVC = [[DetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [_detailVC loadView];
    });
    
    it(@"Should not be nil", ^{
        expect(_detailVC).notTo.equal(nil);
    });
    
    it(@"should be a DetailTableViewController", ^{
        expect(_detailVC).to.beInstanceOf([DetailTableViewController class]);
    });
    
    afterEach(^{
        _detailVC = nil;
    });
});

SpecEnd