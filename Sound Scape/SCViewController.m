//
//  SCViewController.m
//  Sound Scape
//
//  Created by Stephen Cussen on 11/17/13.
//  Copyright (c) 2013 Stephen Cussen. All rights reserved.
//

#import "SCViewController.h"
#import "SCAudioController.h"

// some MIDI constants:
enum {
	kMIDIMessage_NoteOn    = 0x9,
	kMIDIMessage_NoteOff   = 0x8,
};

#define kC4         48
#define kC5         60
#define kC6         72

#define kFsharp5    66
#define kG5         67
#define kA5         69
#define kB5         71


@interface SCViewController ()
@property SCAudioController *ssAudio;
@end

@implementation SCViewController
@synthesize ssAudio;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// setup the Sound Scape Audio Control
    ssAudio = [[SCAudioController alloc] init];
    [ssAudio setupAudio];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startNotePlay:(id)sender {
    UInt32 noteNum = kC5;
    if (sender == _row3note4) noteNum = kFsharp5;
    else if (sender == _row3note5) noteNum = kG5;
    else if (sender == _row3note6) noteNum = kA5;
    else if (sender == _row3note7) noteNum = kB5;

	UInt32 onVelocity = 127;
	UInt32 noteCommand = kMIDIMessage_NoteOn << 4 | 0;
	
    OSStatus result = noErr;
	if(ssAudio.bus1IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit, noteCommand, noteNum, onVelocity, 0);
        if (result != noErr) NSLog (@"Unable to start playing the note on samplerUnit. Error code: %d\n", (int) result);
    if(ssAudio.bus2IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit2, noteCommand, noteNum, onVelocity, 0);
        if (result != noErr) NSLog (@"Unable to start playing the note on samplerUnit2. Error code: %d\n", (int) result);
}

- (IBAction)stopNotePlay:(id)sender {
    UInt32 noteNum = kC5;
    if (sender == _row3note4) noteNum = kFsharp5;
    else if (sender == _row3note5) noteNum = kG5;
    else if (sender == _row3note6) noteNum = kA5;
    else if (sender == _row3note7) noteNum = kB5;
    
	UInt32 noteCommand = kMIDIMessage_NoteOff << 4 | 0;
	
    OSStatus result = noErr;
	if(ssAudio.bus1IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit, noteCommand, noteNum, 0, 0);
        if (result != noErr) NSLog (@"Unable to stop playing the note on samplerUnit. Error code: %d\n", (int) result);
	if(ssAudio.bus2IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit2, noteCommand, noteNum, 0, 0);
        if (result != noErr) NSLog (@"Unable to stop playing the note on samplerUnit2. Error code: %d\n", (int) result);
    
}
@end
