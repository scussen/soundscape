//
//  SCNoteGridDef.h
//  Sound Scape
//
//  Created by Stephen Cussen on 12/16/13.
//  Copyright (c) 2013 Stephen Cussen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCNoteMapDef : NSObject
//@property (nonatomic, strong) UInt32 *campaignNames;
@property  (nonatomic, readwrite) NSUInteger NumberOfNoteMaps;

- (NSArray *) loadGrid: (NSInteger) noteMapIndex;
@end
