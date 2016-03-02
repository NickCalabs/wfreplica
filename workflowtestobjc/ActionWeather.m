//
//  ActionWeather.m
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import "ActionWeather.h"
#import <UIKit/UIKit.h>

@interface ActionWeather ()

@property (nonatomic, strong) NSData *data;

@end

@implementation ActionWeather

- (instancetype)initWithInput:(NSString *)inputString {
    self = [super initWithName:@"Get and Return Weather"];
    if (self) {
        self.input = inputString;
    }
    return self;
}

- (void)run {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString *urlString = [NSString stringWithFormat:@"https://api.wunderground.com/api/c3f8320b53d3c65b/conditions/q/CA/%@.json", self.input];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response{
    //data = [[NSMutableArray alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)theData{
    self.data = theData;
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:self.data options:nil error:nil];
    [self parseResponse:jsonDict];
}

- (void)parseResponse:(NSDictionary *)jsonDictionary {
    NSDictionary *observationDict = jsonDictionary[@"current_observation"];
    NSString *temp = observationDict[@"temp_f"];
    self.output = [NSString stringWithFormat:@"%@ Degrees", temp];
    [self.workflow actionCompleted:self];
}

@end
