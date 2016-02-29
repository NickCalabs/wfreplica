//
//  ActionWeather.h
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import "Action.h"

@interface ActionWeather : Action

- (instancetype)initWithInput:(NSString *)inputString;

-(void)run;

@end
