//
//  Workflow.h
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Action;

@interface Workflow : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *actions;

-(id)initWithTitle:(NSString *)name andActions:(NSArray *)action;
-(void)run;

- (void)actionCompleted:(Action *)action;


@end
