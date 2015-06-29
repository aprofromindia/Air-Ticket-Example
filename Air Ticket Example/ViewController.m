//
//  ViewController.m
//  Air Ticket Example
//
//  Created by Apro on 25/06/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ViewController.h"
#import "DetailTableViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

// URL Request param keys.
static NSString *const kDepartureAirportKey = @"DepartureAirportCode";
static NSString *const kArrivalAirportKey = @"ArrivalAirportCode";
static NSString *const kDepartureDateKey = @"DepartureDate";
static NSString *const kReturnDateKey = @"ReturnDate";

@interface ViewController (){
    id<RESTClient> _restClient;
    
    IBOutlet UITextField __weak *_departureField;
    IBOutlet UITextField __weak *_arrivalField;
    IBOutlet UIDatePicker __weak *_depatureDatePicker;
    IBOutlet UIDatePicker __weak *_returnDatePicker;
    IBOutlet UIButton __weak *_submitBtn;
}

@end

@implementation ViewController

#pragma mark - initialisers

- (instancetype)init{
    return [self initWithRESTClient:[RESTClientImpl sharedInstance]];
}

- (instancetype)initWithRESTClient:(id<RESTClient>) restClient
{
    self = [super init];
    if (self) {
        _restClient = restClient;
    }
    return self;
}

#pragma mark - View methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _restClient = [RESTClientImpl sharedInstance];
    _depatureDatePicker.minimumDate = [NSDate date];
    _returnDatePicker.minimumDate = [NSDate date];
    
    
    [_departureField.rac_textSignal subscribeNext:^(NSString *x) {
        
    }];
    
    RACSignal *validArrivalSignal = [_arrivalField.rac_textSignal
                                     map:^id(NSString *value) {
                                         return @([self p_isStringValid:value]);
                                     }];
    
    RACSignal *validDepartureSignal = [_departureField.rac_textSignal
                                       map:^id(NSString *value) {
                                           return @([self p_isStringValid:value]);
                                       }];
    
    // Text fields are set to yellow unless they include 3 character length strings.
    RAC(_arrivalField, backgroundColor) = [validArrivalSignal map:^id(NSNumber *value) {
        return [value boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    
    RAC(_departureField, backgroundColor) = [validDepartureSignal map:^id(NSNumber *value) {
        return [value boolValue] ? [UIColor clearColor]: [UIColor yellowColor];
    }];
    
    //enables the submit button only when arrival and departure field have valid values.
    RAC(_submitBtn, enabled) = [RACSignal combineLatest:@[validArrivalSignal, validDepartureSignal]
                                                 reduce:^id(NSNumber *arrivalValid, NSNumber *departureValid){
                                                     return @([arrivalValid boolValue] && [departureValid boolValue]);
                                                 }];
}

#pragma mark - IBAction methods

- (IBAction) p_searchBtnClicked {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary *params = @{
                           kDepartureAirportKey : _departureField.text,
                           kArrivalAirportKey : _arrivalField.text,
                           kDepartureDateKey : [_depatureDatePicker.date description],
                           kReturnDateKey : [_returnDatePicker.date description]
                           };
    
    @weakify(self);
    
    [_restClient get_routesWithParams:params onSuccess:^(NSArray *response) {
        
        @strongify(self);
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        DetailTableViewController *detailVC = [[DetailTableViewController alloc] initWithList:response];
        [self.navigationController pushViewController:detailVC animated:YES];
        
    } onError:^(NSError *error) {
        
        @strongify(self);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Network error!", nil) message:NSLocalizedString(@"Please try again.", nil)
                                   delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    }];
}

- (IBAction) p_arrivalDatePickerChanged:(UIDatePicker *) departureDatePicker {
    _returnDatePicker.minimumDate = departureDatePicker.date;
}

- (BOOL) p_isStringValid:(NSString *) string{
    return (string.length == 3);
}

@end
