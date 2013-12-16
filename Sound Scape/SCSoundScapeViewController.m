//
//  SCSoundScapeViewController.m
//  Sound Scape
//
//  Created by Stephen Cussen on 11/25/13.
//  Copyright (c) 2013 Stephen Cussen. All rights reserved.
//

#import "SCSoundScapeViewController.h"
#import "SCAudioController.h"
#import "SCNoteMapDef.h"

// some MIDI constants:
enum {
	kMIDIMessage_NoteOn    = 0x9,
	kMIDIMessage_NoteOff   = 0x8,
};

@interface SCSoundScapeViewController ()
@property SCAudioController *ssAudio;
@property SCNoteMapDef *noteMaps;
@property (strong, nonatomic) NSArray *noteGrid;
@end

@implementation SCSoundScapeViewController
@synthesize ssAudio;
@synthesize noteMaps;
@synthesize noteGrid;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// setup the Sound Scape Audio Control
    ssAudio = [[SCAudioController alloc] init];
    [ssAudio setupAudio];
    // load a note grid
    noteMaps = [[SCNoteMapDef alloc] init];
    if (noteMaps.NumberOfNoteMaps < 1) NSLog(@"No Note Maps to load");
    else {
        noteGrid = [noteMaps loadGrid:1];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) startNotePlay:(id)sender {
    UIButton *button = (UIButton*) sender;
    UInt32 noteNum;
    int noteIndex = button.tag;
    if (noteIndex > 39) noteIndex = 39;
//    NSString *noteValueString;
 //   noteValueString = [noteGrid objectAtIndex: button.tag];
    noteNum = [[noteGrid objectAtIndex: noteIndex] intValue];
    
	UInt32 onVelocity = 127;
	UInt32 noteCommand = kMIDIMessage_NoteOn << 4 | 0;
    OSStatus result = noErr;
	if(ssAudio.bus1IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit, noteCommand, noteNum, onVelocity, 0);
    if (result != noErr) NSLog (@"Unable to start playing the note on samplerUnit. Error code: %d\n", (int) result);
    if(ssAudio.bus2IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit2, noteCommand, noteNum, onVelocity, 0);
    if (result != noErr) NSLog (@"Unable to start playing the note on samplerUnit2. Error code: %d\n", (int) result);
}

- (IBAction) stopNotePlay:(id)sender {
    UIButton *button = (UIButton*) sender;
    UInt32 noteNum;
    
    int noteIndex = button.tag;
    if (noteIndex > 39) noteIndex = 39;
    noteNum = [[noteGrid objectAtIndex: noteIndex] intValue];
    
	UInt32 noteCommand = 	kMIDIMessage_NoteOff << 4 | 0;
    OSStatus result = noErr;
	if(ssAudio.bus1IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit, noteCommand, noteNum, 0, 0);
    if (result != noErr) NSLog (@"Unable to stop playing the note on samplerUnit. Error code: %d\n", (int) result);
	if(ssAudio.bus2IsOn) result = MusicDeviceMIDIEvent(ssAudio.samplerUnit2, noteCommand, noteNum, 0, 0);
    if (result != noErr) NSLog (@"Unable to stop playing the note on samplerUnit2. Error code: %d\n", (int) result);
}

@end
