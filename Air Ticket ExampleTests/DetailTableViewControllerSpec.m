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
        _detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                     instantiateViewControllerWithIdentifier:@"DetailTableViewController"];
        _detailVC.view;
    });
    
    it(@"Should not be nil", ^{
        expect(_detailVC).notTo.equal(nil);

    });
    
    it(@"Shoould be an instance of a DetailTableViewController", ^{
        expect(_detailVC).to.beInstanceOf([DetailTableViewController class]);
    });
    
    afterEach(^{
        _detailVC = nil;
    });
});

SpecEnd
