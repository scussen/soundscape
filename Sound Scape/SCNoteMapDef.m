//
//  SCNoteGridDef.m
//  Sound Scape
//
//  Created by Stephen Cussen on 12/16/13.
//  Copyright (c) 2013 Stephen Cussen. All rights reserved.
//

#import "SCNoteMapDef.h"
@interface SCNoteMapDef ()
@property (nonatomic, strong) NSArray *keyOfG;
@end

@implementation SCNoteMapDef
@synthesize NumberOfNoteMaps;

- (void)loadNoteMap {
    self.keyOfG = @[@43,@45,@47,@48,@50,@52,@54,@55,
                    @52,@54,@55,@57,@59,@60,@62,@64,
                    @60,@62,@64,@66,@67,@69,@71,@72,
                    @69,@71,@72,@74,@76,@78,@79,@81,
                    @78,@79,@81,@83,@84,@86,@88,@90,
                    ];
}


- (id)init {
    self = [super init];
    if (self) {
        NumberOfNoteMaps = 1;
        [self loadNoteMap];
    }
    return  self;
}

- (NSArray *)loadGrid:(NSInteger)noteMapIndex {
    if(noteMapIndex <= NumberOfNoteMaps){
        return self.keyOfG;
    }
    else {
        NSLog(@"No note Map matched noteMapIndex %d", (int)noteMapIndex);
        return NULL;
    }
}
@end
