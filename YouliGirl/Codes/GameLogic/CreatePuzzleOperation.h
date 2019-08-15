//
//  CreatePuzzleOperation.h
//  Puzzle
//
//  Created by Andrea Barbon on 03/05/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CreatePuzzleOperation, PuzzleController;

// Protocol for the importer to communicate with its delegate.
@protocol CreatePuzzleDelegate <NSObject>
@optional
// Called by the importer in the case of an error.
- (void)puzzle:(CreatePuzzleOperation *)importer didFailWithError:(NSError *)error;

@end


@interface CreatePuzzleOperation : NSOperation {
    UIImage *image;
}
@property (nonatomic, assign) PuzzleController *delegate;

@property (nonatomic) BOOL loadingGame;


@end
