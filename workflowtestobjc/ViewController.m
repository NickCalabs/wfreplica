//
//  ViewController.m
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import "ViewController.h"
#import "Workflow.h"
#import "ActionSpeak.h"
#import "ActionWeather.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    ActionWeather *weatherAction = [[ActionWeather alloc] initWithInput:@"San_Francisco"];
    
    ActionSpeak *speakAction = [[ActionSpeak alloc] init];
    
    self.workflow = [[Workflow alloc] initWithTitle:@"Speak the Weather" andActions:@[weatherAction, speakAction]];
    [self.workflow run];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
