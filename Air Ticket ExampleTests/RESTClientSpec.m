//
//  RESTClientSpec.m
//  Air Ticket Example
//
//  Created by Apro on 28/06/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "RESTClientImpl.h"

@interface RESTClientImpl (Test)

- (instancetype)initWithURLSession:(NSURLSession *) urlSession;

@end

@implementation RESTClientImpl(Test)

+ (RESTClientImpl *) uniqueInstance{
    RESTClientImpl *client = [[RESTClientImpl alloc] initWithURLSession:[NSURLSession sharedSession]];
    return client;
}

@end


SpecBegin(RESTClient)

describe(@"RESTClient", ^{
    
    __block RESTClientImpl *_restClient;
    
    beforeEach(^{
        _restClient = [RESTClientImpl uniqueInstance];
    });
    
    it(@"should not be nil", ^{
        expect(_restClient).notTo.equal(nil);
    });
    
    it(@"response should not be nil", ^{
        
        waitUntil(^(DoneCallback done) {
            [_restClient get_routesWithParams:@{} onSuccess:^(NSArray *response) {
                expect(response).notTo.equal(nil);
                done();
            } onError:^(NSError *error) {
            }];
        });
    });
    
    it(@"response is an NSArray", ^{
        
        waitUntil(^(DoneCallback done) {
            [_restClient get_routesWithParams:@{} onSuccess:^(NSArray *response) {
                expect(response).to.beKindOf([NSArray class]);
                done();
            } onError:^(NSError *error) {
            }];
        });
    });
    
    it(@"response's count is 370", ^{
        
        waitUntil(^(DoneCallback done) {
            [_restClient get_routesWithParams:@{} onSuccess:^(NSArray *response) {
                expect(response).to.haveACountOf(370);
                done();
            } onError:^(NSError *error) {
            }];
        });
    });
    
    afterEach(^{
        _restClient = nil;
    });
});

SpecEnd
