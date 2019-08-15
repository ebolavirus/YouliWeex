//
//  PuzzleController.h
//  Puzzle
//
//  Created by Andrea Barbon on 19/04/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//


#define IF_IPAD if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IF_IPHONE if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>
#import "UIImage+CWAdditions.h"

#import "PieceView.h"
#import "PuzzleCompletedController.h"
#import "Lattice.h"
#import "CreatePuzzleOperation.h"

#define QUALITY 1.5

#define PIECE_SIZE_IPAD 180
#define PIECE_SIZE_IPHONE 75



@interface PuzzleController : UIViewController <UIGestureRecognizerDelegate, PieceViewProtocol, CreatePuzzleDelegate, UIAlertViewDelegate> {
    BOOL swiping;
    BOOL didRotate;
    BOOL loadingGame;
    BOOL panningDrawerUP;
    
    CGPoint drawerFirstPoint;
    
    NSArray *directions_positions;
    NSArray *directions_numbers;
    
    int numberOfPiecesInDrawer;
    
    int DrawerPosition;
    int firstPiecePlace;
    
    float drawerSize;
    float drawerMargin;
    
    float screenWidth;
    float screenHeight;
    
    NSTimer *timer;
    
    PieceView *movingPiece;
}


@property(nonatomic) float piceSize;
@property(nonatomic) float elapsedTime;
@property(nonatomic) int NumberSquare;
@property(nonatomic) float padding;

@property(nonatomic) int pieceNumber;
@property(nonatomic) int loadedPieces;
@property(nonatomic) int missedPieces;
@property(nonatomic) int imageSize;
@property(nonatomic) int moves;
@property(nonatomic) int rotations;
@property(nonatomic) int score;

@property(nonatomic) BOOL loadingGame;
@property(nonatomic) BOOL creatingGame;
@property(nonatomic) BOOL puzzleCompete;
@property(nonatomic) BOOL drawerStopped;
@property(nonatomic) BOOL duringGame;

@property (nonatomic, retain, readonly) NSOperationQueue *operationQueue;

@property (nonatomic,retain) CreatePuzzleOperation *puzzleOperation;

@property (nonatomic, retain) UIView *drawerView;
@property (nonatomic, retain) UILabel *elapsedTimeLabel;

@property (nonatomic, retain) NSMutableArray *pieces;
@property (nonatomic, retain) NSMutableArray *groups;
@property (nonatomic, retain) Lattice *lattice;
@property (nonatomic, retain) UIPanGestureRecognizer *pan;
@property (nonatomic, retain) UIPanGestureRecognizer *panDrawer;
@property (nonatomic, retain) UIPinchGestureRecognizer *pinch;

@property (nonatomic, retain) PuzzleCompletedController *completedController;

@property (nonatomic, retain) UIImage *image;

+ (float)computeFloat:(float)f modulo:(float)m;
- (NSMutableArray*)shuffleArray:(NSMutableArray*)array;

- (BOOL)pieceIsOut:(PieceView *)piece;
- (PieceView*)pieceWithNumber:(int)j;
- (PieceView*)pieceWithPosition:(int)j;
- (int)positionOfPiece:(PieceView*)piece;

- (void)movePiece:(PieceView*)piece toLatticePoint:(int)i animated:(BOOL)animated;
- (void)groupMoved:(GroupView*)group;

- (void)puzzleCompleted;
- (void)toggleMenu:(id)sender;

- (void)loadPuzzle;
- (BOOL)drawerStoppedShouldBeStopped;
- (void)prepareForNewPuzzle;

- (CGRect)frameOfLatticePiece:(int)i;

- (UIView*)upperPositionedThing;

- (void)panDrawer:(UIPanGestureRecognizer*)gesture;
- (void)pan:(UIPanGestureRecognizer*)gesture;

- (void)startNewGame;
- (void)print_free_memory;
- (void)removeOldPieces;

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view;

- (void)allPiecesLoaded;

- (void)startTimer;
- (void)stopTimer;

- (void)addPiecesToView;
- (void)resetSizeOfAllThePieces;
- (BOOL)isPositioned:(PieceView*)piece;

- (UIView*)upperGroupBut:(GroupView*)group;
- (void)moveBar;
- (void)addAnothePieceToView;

@end

