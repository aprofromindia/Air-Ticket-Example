//
//  ViewControllerSpec.m
//  Air Ticket Example
//
//  Created by Apro on 28/06/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "ViewController.h"


SpecBegin(ViewController)

describe(@"ViewController", ^{
    
    __block ViewController *_viewC;
    
    beforeEach(^{
        _viewC = [[ViewController alloc] init];
        [_viewC loadView];
    });
    
    it(@"should not be nil and should be an instance of ViewController", ^{
        expect(_viewC).notTo.equal(nil);
        expect(_viewC).to.beInstanceOf([ViewController class]);
    });
    
    it(@"departure field should be yellow", ^{
        expect(((UITextField *)[_viewC valueForKey:@"_departureField"]).backgroundColor).to.equal([UIColor yellowColor]);
    });
    
    it(@"arrival field should be yellow", ^{
//        expect(_viewC->_arrivalField.backgroundColor).to.equal([UIColor yellowColor]);
    });
    
    it(@"departure field should be white when input is LHR", ^{
        
    });
    
    afterEach(^{
        _viewC = nil;
    });
});

SpecEnd
