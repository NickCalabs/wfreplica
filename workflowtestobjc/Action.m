//
//  Action.m
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import "Action.h"

@implementation Action

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.title = name;
    }
    return self;
}



- (instancetype)initWithName:(NSString *)name andInput:(NSString *)inputString {
    self = [self initWithName:name];
    if (self) {
        self.input = inputString;
    }
    return self;
}

-(void)run {
    NSLog(@"input:%@ and output:%@",self.input, self.output);
    
}


@end
