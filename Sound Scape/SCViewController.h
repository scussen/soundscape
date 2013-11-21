//
//  SCViewController.h
//  Sound Scape
//
//  Created by Stephen Cussen on 11/17/13.
//  Copyright (c) 2013 Stephen Cussen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *row3note4;
@property (weak, nonatomic) IBOutlet UIButton *row3note5;
@property (weak, nonatomic) IBOutlet UIButton *row3note6;
@property (weak, nonatomic) IBOutlet UIButton *row3note7;
- (IBAction)startNotePlay:(id)sender;
- (IBAction)stopNotePlay:(id)sender;



@end
