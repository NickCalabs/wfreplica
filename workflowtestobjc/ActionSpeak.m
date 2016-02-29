//
//  ActionSpeak.m
//  workflowtestobjc
//
//  Created by Nick on 2/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

#import "ActionSpeak.h"

@implementation ActionSpeak

- (instancetype)init
{
    self = [super initWithName:@"Get text and Speak"];
    return self;
}

- (void)run {
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:(@"%@", self.input)];
    [utterance setRate:0.5f];
    [synthesizer speakUtterance:utterance];
    
    self.output = @"Speaking Completed";
    [self.workflow actionCompleted:self];
}

@end
