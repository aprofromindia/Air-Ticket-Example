//
//  FlightModelSpec.m
//  Air Ticket Example
//
//  Created by Apro on 02/07/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "FlightModel.h"


SpecBegin(FlightModel)

describe(@"FlightModel", ^{
    
    __block FlightModel *_flightModel;
    
    beforeEach(^{
        _flightModel = [[FlightModel alloc] initWithDictionary:@{} error:nil];
    });
    
    it(@"should have name Jimmy", ^{
//        expect(_flightModel.name).it.eq
    });
    
    afterEach(^{

    });
    
});

SpecEnd
