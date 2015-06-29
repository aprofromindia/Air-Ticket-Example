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
        _viewC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                  instantiateViewControllerWithIdentifier:@"ViewController"];
        _viewC.view;
    });
    
    it(@"should not be nil and should be an instance of ViewController", ^{
        expect(_viewC).notTo.equal(nil);
        expect(_viewC).to.beInstanceOf([ViewController class]);
    });
    
    it(@"departure field should be yellow", ^{
        expect(((UITextField *)[_viewC valueForKey:@"_departureField"]).backgroundColor).to.equal([UIColor yellowColor]);
    });
    
    it(@"arrival field should be yellow", ^{
        expect(((UITextField *)[_viewC valueForKey:@"_arrivalField"]).backgroundColor).to.equal([UIColor yellowColor]);
    });
    
    it(@"departure field should be white when input is LHR", ^{
        UITextField *departureField = (UITextField *) [_viewC valueForKey:@"_departureField"];
        departureField.text = @"LHR";
        expect(departureField.backgroundColor).to.equal([UIColor whiteColor]);
    });
    
    it(@"arrival field should be white when input is LHR", ^{
        UITextField *arrivalField = (UITextField *) [_viewC valueForKey:@"_arrivalField"];
        arrivalField.text = @"LHR";
        expect(arrivalField.backgroundColor).to.equal([UIColor whiteColor]);
    });
    
    afterEach(^{
        _viewC = nil;
    });
});

SpecEnd
