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

//@property (weak, nonatomic) UILabel *actionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHue:0.6 saturation:0.07 brightness:0.91 alpha:1];
    
    ActionWeather *weatherAction = [[ActionWeather alloc] initWithInput:@"San_Francisco"];
    
    ActionSpeak *speakAction = [[ActionSpeak alloc] init];
    
    self.workflow = [[Workflow alloc] initWithTitle:@"Speak the Weather" andActions:@[weatherAction, speakAction]];
    
    UILabel *workFlowTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 350, 20)];
    workFlowTitleLabel.textColor = [UIColor colorWithHue:0.61 saturation:0.77 brightness:0.88 alpha:1];
    workFlowTitleLabel.text = [NSString stringWithFormat:@"%@", self.workflow.title];
    
    
    //first action
    UIView *workflowView = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 350, 100)];
    [workflowView setBackgroundColor:[UIColor colorWithHue:0.6 saturation:0.03 brightness:0.97 alpha:1]];
    
    UILabel *actionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 50)];
    actionLabel.text = [NSString stringWithFormat:@"%@ from %@", weatherAction.title, weatherAction.input];
    actionLabel.numberOfLines = 2;
    
    //second action
    UIView *workflowView2 = [[UIView alloc] initWithFrame:CGRectMake(10, 250, 350, 100)];
    [workflowView2 setBackgroundColor:[UIColor colorWithHue:0.6 saturation:0.03 brightness:0.97 alpha:1]];
    
    UILabel *actionLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 50)];
    actionLabel2.text = [NSString stringWithFormat:@"%@", speakAction.title];
    
    
    UIButton *playButtonTapped = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButtonTapped addTarget:self action:@selector(runWorkflow) forControlEvents:UIControlEventTouchUpInside];
    [playButtonTapped setTitle:@"▶︎" forState:UIControlStateNormal];
    [playButtonTapped setTitleColor:[UIColor colorWithHue:0.61 saturation:0.77 brightness:0.88 alpha:1] forState:UIControlStateNormal];
    playButtonTapped.frame = CGRectMake(0, 5, 20, 20);
    
    [self.view addSubview:workFlowTitleLabel];
    [workflowView addSubview:actionLabel];
    [workflowView addSubview:playButtonTapped];
    [workflowView2 addSubview:actionLabel2];
    [self.view addSubview:workflowView];
    [self.view addSubview:workflowView2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)runWorkflow{
    
    [self.workflow run];
    
}

@end
