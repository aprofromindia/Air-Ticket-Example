//
//  RESTClient.m
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "RESTClient.h"
#import "FlightModel.h"

static NSString *const kURL = @"http://nmflightservice.cloudapp.net/api/Flight";

// HTTP 200 status code.
static const int kHTTPOk = 200;

// JSON mime type value
static NSString *const kJSONMimeType = @"application/json";


@interface RESTClient (){
    NSURLSession *_urlSession;
}

@end

@implementation RESTClient

- (instancetype)initWithURLSession:(NSURLSession *) urlSession
{
    self = [super init];
    if (self) {
        _urlSession = urlSession;
    }
    return self;
}

+ (instancetype)sharedInstance{
    static RESTClient *sharedClient;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc] initWithURLSession:[NSURLSession sharedSession]];
    });
    return sharedClient;
}

- (void) get_routesWithParams:(NSDictionary *) paramsDict
                    onSuccess:(void (^)(NSArray *response)) successHandler onError:(void (^)(NSError *error)) errorHandler{

    NSParameterAssert(paramsDict != nil);
    
    [[_urlSession dataTaskWithURL:[NSURL URLWithString:kURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        if (httpResponse.statusCode == kHTTPOk && [response.MIMEType isEqualToString:kJSONMimeType]) {
            
            NSError *jsonError = nil;
            NSArray *flightsList = [FlightModel arrayOfModelsFromData:data error:&jsonError];
            
            if (!jsonError && successHandler) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    successHandler(flightsList);
                }];
                return;
            }
        }if (errorHandler) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                errorHandler(error);
            }];
        }
    }] resume];
}

@end
