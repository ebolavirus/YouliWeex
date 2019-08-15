//
//  PuzzleCompletedController.h
//  Puzzle
//
//  Created by Andrea Barbon on 13/05/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PuzzleController;

@interface PuzzleCompletedController : UIViewController

-(instancetype)initWithDelegate:(PuzzleController*)delegate;

- (void)updateValues;

@end
