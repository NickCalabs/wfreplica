//
//  Action.h
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workflow.h"

@interface Action : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *input;
@property (nonatomic, strong) NSString *output; //filled upon completion
@property (nonatomic, weak) Workflow *workflow;

-(id)initWithName:(NSString *)name;
-(id)initWithName:(NSString *)name andInput:(NSString *)input;
-(void)run;

@end
