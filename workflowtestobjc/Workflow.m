//
//  Workflow.m
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import "Workflow.h"
#import "Action.h"

@implementation Workflow

- (id)initWithTitle:(NSString *)name andActions:(NSMutableArray *)actions{
    self.title = name;
    self.actions = actions;
    
    for (Action *a in self.actions) {
        a.workflow = self;
    }
    
    return self;
}

- (void)run {
    [self.actions.firstObject run];
}

- (void)actionCompleted:(Action *)action {
    //get the index of the action that just finished
    NSUInteger index = [self.actions indexOfObject:action];
    if (index == self.actions.count-1) {
        //completed
        NSLog(@"Finished Action: %@", action.output);
    } else {
        Action *next = self.actions[index+1];
        NSLog(@"Finished Running %@ with output: %@, Starting %@.", action.title, action.output, next.title);
        next.input = action.output;
        [next run];
    }
}

@end
