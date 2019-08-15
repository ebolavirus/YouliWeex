//
//  PuzzleController.m
//  Puzzle
//
//  Created by Andrea Barbon on 19/04/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#define ORG_TIME 0.5


#define IMAGE_SIZE_BOUND_IPAD 2*PIECE_SIZE_IPAD
#define IMAGE_SIZE_BOUND_IPHONE 3*PIECE_SIZE_IPHONE

#define JPG_QUALITY 1
#define SHAPE_QUALITY_IPAD 1
#define SHAPE_QUALITY_IPHONE 3
#define PANNING_SPEED 0.07
#define VELOCITY_LIMIT 1000.0
#define PAN_DRAWER_ACCURACY 0.01


#import "PuzzleController.h"
#import "AppDelegate.h"
#import "GroupView.h"
#import <mach/mach.h>
#import <mach/mach_host.h>


@interface PuzzleController ()

@end

@implementation PuzzleController

@synthesize pieces, image, lattice, drawerView, groups, elapsedTimeLabel;
@synthesize puzzleOperation, operationQueue;
@synthesize padding, pieceNumber, piceSize, elapsedTime, imageSize;
@synthesize loadedPieces, NumberSquare, missedPieces, moves, rotations, score;
@synthesize pan, panDrawer, pinch;
@synthesize drawerStopped;
@synthesize puzzleCompete, loadingGame, duringGame, creatingGame;
@synthesize completedController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Wood.jpg"]];
		
		[self.navigationItem setHidesBackButton:YES];
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"0%" style:UIBarButtonItemStyleDone target:nil action:nil];
		
		UIBarButtonItem *shopButton = [[UIBarButtonItem alloc] initWithTitle:mmsloc("configbar") style:UIBarButtonItemStylePlain target:self action:@selector(toggleMenu:)];
		self.navigationItem.rightBarButtonItem = shopButton;
		
		self.elapsedTimeLabel = [[UILabel alloc] init];
		elapsedTimeLabel.font = [UIFont flatFontOfSize:20.0f];
		elapsedTimeLabel.textAlignment = NSTextAlignmentCenter;
		elapsedTimeLabel.textColor = MMColorWhite;
		[self.view addSubview:self.elapsedTimeLabel];
		
		self.drawerView = [[UIView alloc] init];
		drawerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Wood.jpg"]];
		[self.view addSubview:self.drawerView];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	screenWidth = [[UIScreen mainScreen] bounds].size.width;
	screenHeight = [[UIScreen mainScreen] bounds].size.height - 64;
	if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad){
		imageSize = QUALITY;
	} else {
		imageSize *= 0.5;
	}
	
	directions_numbers = [[NSArray alloc] init];
	directions_positions = [[NSArray alloc] init];
	
	[self computePieceSize];
	
	//Add the puzzleCompletedController
	completedController = [[PuzzleCompletedController alloc] initWithDelegate:self];
	[self.view addSubview:completedController.view];
	completedController.view.alpha = 0;
	
	//gesture recognizers
	[self addGestures];
	
	[self startNewGame];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	WS(ws);
	NSLog(@"%@",NSStringFromCGRect(self.view.frame));
	[self.elapsedTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.and.top.mas_equalTo(ws.view);
		make.height.mas_equalTo(20);
	}];
	
	[self.drawerView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.and.right.and.left.mas_equalTo(ws.view);
		make.height.mas_equalTo(self->drawerSize);
	}];
	
	[self.completedController.view mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.and.right.and.left.mas_equalTo(ws.view);
		make.height.mas_equalTo(kDeviceWidth/2);
	}];
}

-(void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[APPALL.mySoundManager stopMusic];
}

- (NSArray*)directionsUpdated_numbers {
	return [NSArray arrayWithObjects:
					[NSNumber numberWithInt:-1],              //up = 0
					[NSNumber numberWithInt:+pieceNumber],    //right = 1
					[NSNumber numberWithInt:1],               //down = 2
					[NSNumber numberWithInt:-pieceNumber],    //left = 3
					nil];
}

- (NSArray*)directionsUpdated_positions {
	
	return [NSArray arrayWithObjects:
					[NSNumber numberWithInt:-1],              //up = 0
					[NSNumber numberWithInt:+3*pieceNumber],    //right = 1
					[NSNumber numberWithInt:1],               //down = 2
					[NSNumber numberWithInt:-3*pieceNumber],    //left = 3
					nil];
	
}


#pragma mark -
#pragma mark Score

- (void)addPoints:(int)add {
	score += add;
	self.title = [NSString stringWithFormat:@"%d ", score];
}

- (int)pointsForPiece:(PieceView*)piece {
	int points = 1000 + 1000/piece.moves + 1000/(piece.rotations+1) + NumberSquare*1000/(int)(elapsedTime+10);
	NSLog(@"Points:%d", points);
	return points;
}



#pragma mark -
#pragma mark Puzzle

- (void)showCompleteImage {
	IF_IPHONE [self resetLatticePositionAndSizeWithDuration:1.75];
	float f = (screenWidth)/(pieceNumber+1)/(piceSize-2*padding);
	
	//save
//	if (APPALL.mySaveItem.myLevel > APPALL.myCacheItem.myLevel) {
//
//	} else if (APPALL.mySaveItem.myLevel < APPALL.myCacheItem.myLevel) {
//		APPALL.mySaveItem.myLevel = MAX(APPALL.mySaveItem.myLevel, APPALL.myCacheItem.myLevel);
//		APPALL.mySaveItem.myState = APPALL.myCacheItem.myState;
//		[APPALL.mySaveItem saveToDB];
//	} else if (APPALL.mySaveItem.myLevel == APPALL.myCacheItem.myLevel) {
//		APPALL.mySaveItem.myLevel = APPALL.mySaveItem.myLevel;
//		APPALL.mySaveItem.myState = MAX(APPALL.mySaveItem.myState, APPALL.myCacheItem.myState);
//		[APPALL.mySaveItem saveToDB];
//	}
	
	[UIView animateWithDuration:1.5 animations:^{
		self->completedController.view.alpha = 1;
	}completion:^(BOOL finished) {
		[self resizeLatticeToScale:f];
		IF_IPAD [self moveLatticeToLeftWithDuration:0.5];
		[self preNextState];
	}];
}

- (void)loadPuzzle {
	[self prepareForNewPuzzle];
	[self computePieceSize];
	//    [menu startNewGame:nil];
}

- (void)toggleMenu:(id)sender {
	NSLog(@"menu pressed");
	if (sender!=nil){
		[APPALL.mySoundManager playSound:@"enter.caf"];
	}
	[self stopTimer];
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:mmsloc("configbar") message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
	
	UIAlertAction *musicButton = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@:%@",mmsloc("menumusic"),APPALL.myCacheItem.myMusic? mmsloc("configon"):mmsloc("configoff")] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		APPALL.myCacheItem.myMusic = !APPALL.myCacheItem.myMusic;
		[APPALL.mySaveItem saveToDB];
		[APPALL.mySoundManager setSoundVolume:APPALL.myCacheItem.myMusic?1.0f:0.0f];
		[APPALL.mySoundManager setMusicVolume:APPALL.myCacheItem.myMusic?1.0f:0.0f];
		[self startTimer];
	}];
	
	UIAlertAction *bgButton = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@:%@",mmsloc("menubg"),APPALL.myCacheItem.isTip? mmsloc("configon"):mmsloc("configoff")] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		APPALL.myCacheItem.isTip = !APPALL.myCacheItem.isTip;
		// [APPALL.mySaveItem saveToDB];
		[self->lattice switchTip];
		[self startTimer];
	}];
	UIAlertAction *resAction = [UIAlertAction actionWithTitle:mmsloc("menurestart") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[self menuRestartPressed:nil];
	}];
	UIAlertAction *quitAction = [UIAlertAction actionWithTitle:mmsloc("menuquit") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[self menuQuitPressed:nil];
	}];
	
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("menuback") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
		[self menuBackPressed:nil];
	}];
	[vc addAction:musicButton];
	[vc addAction:bgButton];
	[vc addAction:resAction];
	[vc addAction:quitAction];
	[vc addAction:cancelAction];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:vc animated:YES completion:nil];
	});
}

- (void)addPiecesToView {
	if ([NSThread isMainThread]) {
		for (PieceView *p in pieces) {
			[self.view addSubview:p];
		}
	} else {
		[self performSelectorOnMainThread:@selector(addPiecesToView) withObject:nil waitUntilDone:NO];
	}
}

- (void)allPiecesLoaded {
	
	NSLog(@"%s", __PRETTY_FUNCTION__);
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
		[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
	}
	duringGame = YES;
	
	for (PieceView *p in pieces) {
		if (!p.isFree) {
			p.frame = CGRectMake(0, 0, piceSize, piceSize);
		}
	}
	
	drawerFirstPoint = CGPointMake(-4, 5);
	[self resetSizeOfAllThePieces];
	[self shuffle];
	[self updatePercentage];
	[self organizeDrawerWithOrientation:self.interfaceOrientation];
	creatingGame = NO;
	NSLog(@"-----------> All pieces created");
	[self bringDrawerToTop];
	
	NSLog(@"Game is started");
	self.loadedPieces = 0;
	
	NSLog(@"Memory after creating:");
	[self print_free_memory];
	
	
	self.view.userInteractionEnabled = YES;
	
	[self resetLatticePositionAndSizeWithDuration:0.0];
}

- (void)prepareForNewPuzzle {
	
	NSLog(@"Preparing for new puzzle");
	
	[self.view bringSubviewToFront:lattice];
	[self.view bringSubviewToFront:drawerView];
	[self.view bringSubviewToFront:elapsedTimeLabel];
	
	missedPieces = 0;
	loadedPieces = 0;
	
	drawerView.alpha = 1;
	elapsedTimeLabel.alpha = 1;
	
	drawerStopped = NO;
	duringGame = NO;
	completedController.view.alpha = 0;
	
	if (!loadingGame) {
		
		elapsedTime = 0.0;
		score = 0;
		self.title = @"0 ";
	}
	
	directions_numbers = [NSArray arrayWithArray:[self directionsUpdated_numbers]];
	directions_positions = [NSArray arrayWithArray:[self directionsUpdated_positions]];
	[self computePieceSize];
	[self createLattice];
	drawerFirstPoint = CGPointMake(-4, 5);
	
	// add the importer to an operation queue for background processing (works on a separate thread)
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myNotificationResponse:) name:@"GTCNotification" object:nil];
	puzzleOperation = [[CreatePuzzleOperation alloc] init];
	puzzleOperation.delegate = self;
	puzzleOperation.loadingGame = loadingGame;
	puzzleOperation.queuePriority = NSOperationQueuePriorityVeryHigh;
}

- (void)myNotificationResponse:(NSNotification*)note {
	NSNumber *count = [note object];
	[self.view addSubview:[pieces objectAtIndex:count.intValue]];
	//[self performSelectorOnMainThread:@selector(updateView:) withObject:count waitUntilDone:YES];
}

- (void)updateView:(NSNumber*)count {
	
	[self.view addSubview:[pieces objectAtIndex:count.intValue]];
	
}

- (void)createPuzzleFromImage:(UIImage*)image_ {
	
	loadingGame = NO;
	creatingGame = YES;
	moves = 0;
	rotations = 0;
	[self prepareForNewPuzzle];
	dispatch_queue_t main_queue = dispatch_get_main_queue();
	dispatch_async(main_queue, ^{
		[self createPieces];
		dispatch_async(main_queue, ^{
			[self addAnothePieceToView];
			[self startTimer];
		});
	});
}

- (void)createPieces {
	
	NSLog(@"Creating pieces");
	float IMAGE_SIZE_BOUND = 0;
	float SHAPE_QUALITY = 0;
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
		
		IMAGE_SIZE_BOUND = IMAGE_SIZE_BOUND_IPAD;
		SHAPE_QUALITY = SHAPE_QUALITY_IPAD;
		
	} else {
		
		IMAGE_SIZE_BOUND = IMAGE_SIZE_BOUND_IPHONE;
		SHAPE_QUALITY = SHAPE_QUALITY_IPHONE;
		
	}
	
	NSMutableArray *arrayPieces = [[NSMutableArray alloc] initWithCapacity:NumberSquare];
	NSMutableArray *array;
	
	if (loadingGame) {
		
		if (self.image==nil) {
			return;
		}
		
	} else {
		//Compute the optimal part size
		float partSize = image.size.width/(pieceNumber*0.7);
		if (partSize > IMAGE_SIZE_BOUND) {
			partSize = IMAGE_SIZE_BOUND;
		}
		//and split the big image using computed size
		
		float f = (float)(pieceNumber*partSize*0.7);
		image = [image imageCroppedToSquareWithSide:f];
		array = [[NSMutableArray alloc] initWithArray:[self splitImage:image partSize:partSize]];
	}
	
	for (int i=0;i<pieceNumber;i++){
		
		for (int j=0;j<pieceNumber;j++){
			
			CGRect rect = CGRectMake( 0, 0, SHAPE_QUALITY*piceSize, SHAPE_QUALITY*piceSize);
			
			PieceView *piece = [[PieceView alloc] initWithFrame:rect];
			piece.delegate = self;
			piece.image = [array objectAtIndex:j+pieceNumber*i];
			piece.number = j+pieceNumber*i;
			piece.size = piceSize;
			piece.position = -1;
			NSNumber *n = [NSNumber numberWithInt:NumberSquare];
			piece.neighbors = [[NSArray alloc] initWithObjects:n, n, n, n, nil];
			//piece.frame = rect;
			if (APPALL.myCacheItem.isEdge) {
				NSMutableArray *a = [[NSMutableArray alloc] initWithCapacity:4];
				for (int k=0; k<4; k++) {
					int e = arc4random_uniform(3)+1;
					if (arc4random_uniform(2)>0) {
						e *= -1;
					}
					[a addObject:[NSNumber numberWithInt:e]];
				}
				if (i == 0) {
					[a replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:0]];
				} else {
					if (i == pieceNumber - 1) {
						[a replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:0]];
					}
					PieceView *cachepiece = [arrayPieces objectAtIndex:((i - 1) * pieceNumber + j)];
					int e = [[[cachepiece edges] objectAtIndex:1] intValue];
					//                int e = 0;
					[a replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:-e]];
				}
				
				if (j==0) {
					[a replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:0]];
				} else {
					if (j == pieceNumber-1) {
						[a replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:0]];
					}
					PieceView *cachepiece = [arrayPieces objectAtIndex:(i * pieceNumber + j - 1)];
					int e = [[[cachepiece edges] objectAtIndex:2] intValue];
					// NSLog(@"cacheedges: %@", cachepiece.edges);
					//                int e = 0;
					[a replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:-e]];
				}
				piece.edges = [NSArray arrayWithArray:a];
			} else {
				piece.edges = @[@0,@0,@0,@0];
			}
			// NSLog(@"i: %d, j: %d, edges: %@", i,j,piece.edges);
			[arrayPieces addObject:piece];
		}
	}
	
	pieces = [[NSMutableArray alloc] initWithArray:arrayPieces];
	
	loadedPieces = 0;
	
	[self.operationQueue addOperations:[NSArray arrayWithObject:puzzleOperation] waitUntilFinished:NO];
	
	
}

- (void)addAnothePieceToView {
	[self.view addSubview:[pieces objectAtIndex:loadedPieces]];
}

- (void)moveBar {
	float a = (float)loadedPieces;
	float b = (float)NumberSquare;
	if (loadingGame) {
		b = NumberSquare;
	}
}

- (NSArray *)splitImage:(UIImage *)im partSize:(float)partSize {
	
	float x = pieceNumber;
	float y = pieceNumber;
	
	float padding_temp = partSize*0.15;
	
	NSLog(@"Splitting image w=%.1f, ww=%.1f, imageSize=%.1f", partSize, padding_temp, im.size.width);
	
	NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:NumberSquare];
	for (int i=0;i<x;i++){
		for (int j=0;j<y;j++){
			CGRect rect = CGRectMake(i * (partSize-2*padding_temp)-padding_temp,
															 j * (partSize-2*padding_temp)-padding_temp,
															 partSize,
															 partSize);
			[arr addObject:[im subimageWithRect:rect]];
		}
	}
	
	NSLog(@"Image splitted");
	
	return arr;
	
}

- (BOOL)isPuzzleComplete {
	if (puzzleCompete) {
		return YES;
	} else {
		for (PieceView *p in pieces) {
			if (!p.isPositioned && !p.group.isPositioned) {
				return NO;
			}
		}
		[self puzzleCompleted];
	}
	return puzzleCompete;
}

- (void)puzzleCompleted {
	puzzleCompete = YES;
	[self stopTimer];
	[completedController updateValues];
	
	[UIView animateWithDuration:2 animations:^{
		self->drawerView.alpha = 0;
		self->elapsedTimeLabel.alpha = 0;
		self.title = mmsloc("completed");
		for (UIView *v in self->lattice.pieces) {
			v.alpha = 0;
		}
	}completion:^(BOOL finished) {
		//puzzleDB.percentage = [NSNumber numberWithInt:100];
		[self.view bringSubviewToFront:self->lattice];
		[self.view bringSubviewToFront:self->completedController.view];
		[self.view bringSubviewToFront:self->elapsedTimeLabel];
	}];
	[APPALL.mySoundManager playSound:@"GameWin.caf" looping:NO];
	[self showCompleteImage];
}
#pragma mark -
#pragma mark Gesture handling

- (void)addGestures {
	pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
	pinch.delegate = self;
	[self.view addGestureRecognizer:pinch];
	
	pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
	pan.delegate = self;
	[pan setMinimumNumberOfTouches:1];
	[pan setMaximumNumberOfTouches:2];
	[self.view addGestureRecognizer:pan];
	
	panDrawer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDrawer:)];
	[panDrawer setMinimumNumberOfTouches:1];
	[panDrawer setMaximumNumberOfTouches:1];
	[drawerView addGestureRecognizer:panDrawer];
	
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
	tap.numberOfTapsRequired = 2;
	[self.view addGestureRecognizer:tap];
}

- (void)doubleTap:(UITapGestureRecognizer*)gesture {
	if (!APPALL.myCacheItem.isRotate)
		return;
	CGPoint point = [gesture locationInView:lattice];
	movingPiece = nil;
	for (int i= 0; i<9*NumberSquare; i++) {
		CGRect rect = [[[lattice pieces] objectAtIndex:i] frame];
		if ([self point:point isInFrame:rect]) {
			movingPiece = [self pieceWithPosition:i];
		}
	}
	if (movingPiece!=nil) {
		[movingPiece rotateTap:gesture];
	} else {
		[self resetLatticePositionAndSizeWithDuration:0.5];
	}
}

- (void)pan:(UIPanGestureRecognizer*)gesture {
	
	CGPoint point = [gesture locationInView:lattice];
	
	if (gesture.state==UIGestureRecognizerStateBegan) {
		
		movingPiece = nil;
		
		for (int i= 0; i<9*NumberSquare; i++) {
			
			CGRect rect = [[[lattice pieces] objectAtIndex:i] frame];
			
			if ([self point:point isInFrame:rect]) {
				NSLog(@"Position %d ", i);
				movingPiece = [self pieceWithPosition:i];
				
			}
			
		}
	}
	
	if (movingPiece!=nil) {
		[movingPiece move:gesture];
		return;
	}
	CGPoint traslation = [gesture translationInView:lattice.superview];
	if (YES) {
		lattice.transform = CGAffineTransformTranslate(lattice.transform, traslation.x/lattice.scale, traslation.y/lattice.scale);
		[self refreshPositions];
		[gesture setTranslation:CGPointZero inView:lattice.superview];
	}
}

- (void)pinch:(UIPinchGestureRecognizer*)gesture {
	if (CGRectContainsPoint(drawerView.frame, [gesture locationInView:self.view])) return;
	float z = [gesture scale];
	
	if (YES) {
		CGPoint point = CGPointMake([gesture locationInView:lattice].x, [gesture locationInView:lattice].y);
		[self setAnchorPoint:point forView:lattice];
		
		[self resizeLatticeToScale:lattice.scale*z];
		
		[gesture setScale:1];
	}
}

- (void)resizeLatticeToScale:(float)newScale {
	
	float z = newScale/lattice.scale;
	
	if (lattice.scale*z*3*pieceNumber*(piceSize-2*padding)>screenWidth && lattice.scale*z*piceSize<screenWidth) {
		
		lattice.scale = newScale;
		
		lattice.transform = CGAffineTransformScale(lattice.transform, z, z);
		
		for (GroupView *g in groups) {
			
			g.transform = CGAffineTransformScale(g.transform, z, z);
		}
		
		[self refreshPositions];
	}
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return (    (gestureRecognizer==pan && otherGestureRecognizer==pinch)   ||
					(gestureRecognizer==pinch && otherGestureRecognizer==pan)   );
}
#pragma mark -
#pragma mark Groups

- (void)groupMoved:(GroupView*)group {
	CGRect frame;
	for (int i=9*NumberSquare-1; i>-1; i--) {
		frame = [self frameOfLatticePiece:i];
		if ([self group:group isInFrame:frame]) {
			[self moveGroup:group toLatticePoint:i animated:YES];
			return;
		}
	}
	[self moveGroup:group toLatticePoint:group.boss.position animated:YES];
}

- (UIView*)upperGroupBut:(GroupView*)group {
	for (int i = (int)[self.view.subviews count] -1; i>-1; i--) {
		GroupView *g = [self.view.subviews objectAtIndex:i];
		if ([g isKindOfClass:[GroupView class]] && g!=group) {
			return g;
		}
	}
	return lattice;
}

- (void)createNewGroupForPiece:(PieceView*)piece {
	
	if ([self isTheFuckingPiecePositioned:piece] && !loadingGame) {
		return;
	}
	
	GroupView *newGroup = nil;
	
	//Checks if a group already exists in the neighborhood
	for (PieceView *p in [piece allTheNeighborsBut:nil]) {
		if (p.group!=nil && p!=piece) {
			newGroup = p.group;
			break;
		}
	}
	
	if (newGroup==nil) {
		
		float w = 0.5*[[UIScreen mainScreen] bounds].size.height;
		
		newGroup = [[GroupView alloc] initWithFrame:CGRectMake(0, 0, w, w)];
		newGroup.boss = piece;
		newGroup.transform = lattice.transform;
		newGroup.delegate = self;
		newGroup.isPositioned = (piece.isPositioned && loadingGame);
		
		piece.isBoss = YES;
		piece.transform = CGAffineTransformScale(piece.transform, 1/lattice.scale, 1/lattice.scale);
		[self addPiece:piece toGroup:newGroup];
		
		for (PieceView *p in [piece allTheNeighborsBut:nil]) {
			p.isBoss = NO;
			[self addPiece:p toGroup:newGroup];
		}
		
		[groups addObject:newGroup];
		[self.view insertSubview:newGroup aboveSubview:[self upperGroupBut:newGroup]];
		
		if ([self isTheFuckingPiecePositioned:piece]) {
			newGroup.isPositioned = YES;
		}
		
		NSLog(@"New group created, isPositioned = %d. Groups count %d", newGroup.isPositioned, [groups count]);
		
	} else {
		
		piece.isBoss = NO;
		
		if (piece.group!=newGroup) {
			
			[self addPiece:piece toGroup:newGroup];
			NSLog(@"Piece #%d added to existing group", piece.number);
			
		}
	}
	
	[self moveGroup:newGroup toLatticePoint:newGroup.boss.position animated:NO];
	
}

- (void)addPiece:(PieceView*)piece toGroup:(GroupView*)group {
	
	if ([self isTheFuckingPiecePositioned:piece] && !loadingGame) {
		return;
	}
	
	if (piece.group==group) {
		
		return;
		
	} else {
		
		piece.group = group;
	}
	
	NSLog(@"%s", __PRETTY_FUNCTION__);
	
	piece.isBoss = NO;
	[piece removeFromSuperview];
	[group.pieces addObject:piece];
	
	
	[group addSubview:piece];
	
	//Reset piece size
	piece.transform = group.boss.transform;
	
	CGPoint relative = [self coordinatesOfPiece:piece relativeToPiece:group.boss];
	
	CGAffineTransform matrix = CGAffineTransformMakeRotation(group.boss.angle-group.angle);
	relative = [self applyMatrix:matrix toVector:relative];
	
	float w = [[lattice objectAtIndex:0] bounds].size.width+4;
	
	CGPoint trans = CGPointMake(relative.y*w, relative.x*w);
	
	piece.center = CGPointMake(group.boss.center.x+trans.x, group.boss.center.y+trans.y);
	
	//[self refreshPositions];
}

- (void)moveGroup:(GroupView*)group toLatticePoint:(int)i animated:(BOOL)animated {
	
	PieceView *piece = group.boss;
	piece.position = i;
	
	CGPoint centerLattice = [self centerOfLatticePiece:i];
	CGPoint centerGroup = group.center;
	CGPoint centerPiece = piece.center;
	centerPiece = [self.view convertPoint:centerPiece fromView:group];
	CGPoint difference = CGPointMake(-centerPiece.x+centerGroup.x, -centerPiece.y+centerGroup.y);
	
	
	CGPoint newCenter = CGPointMake((centerLattice.x+difference.x), (centerLattice.y+difference.y));
	
	if (animated) {
		
		[UIView animateWithDuration:0.5 animations:^{
			
			group.center = newCenter;
			
		}completion:^(BOOL finished) {
			
			[self updatePositionsInGroup:group withReferencePiece:group.boss];
			[self checkNeighborsForGroup:group];
			[self updatePercentage];
			
		}];
		
	} else {
		
		group.center = newCenter;
		
	}
	
}

- (BOOL)group:(GroupView*)group isInFrame:(CGRect)frame {
	
	PieceView *piece = group.boss;
	CGPoint center = [group.superview convertPoint:piece.center fromView:group];
	return frame.origin.x<center.x && frame.origin.y<center.y;
	
}

- (void)updatePositionsInGroup:(GroupView*)group withReferencePiece:(PieceView*)boss {
	
	
	for (PieceView *p in group.pieces) {
		
		if (p!=boss) {
			
			CGPoint relativePosition = [self coordinatesOfPiece:p relativeToPiece:boss];
			
			//NSLog(@"Relative Position = %.1f, %.1f, p.number-boss.number = %d", relativePosition.x, relativePosition.y, p.number-boss.number);
			
			CGAffineTransform matrix = CGAffineTransformMakeRotation(boss.angle);
			relativePosition = [self applyMatrix:matrix toVector:relativePosition];
			
			//NSLog(@"Relative Position after matrix = %.1f, %.1f, p.number-boss.number = %d", relativePosition.x, relativePosition.y, p.number-boss.number);
			
			p.position = boss.position + relativePosition.x + 3*pieceNumber*relativePosition.y;
			
			//NSLog(@"NewPosition = %d. %.1f, boss position = %d, %.1f", p.position, p.angle, boss.position, boss.angle);
			
		}
	}
	
	
	if ([self isPositioned:group.boss]) {
		
		for (PieceView *p in pieces) {
			
			if (p.group==group) {
				
				[self isPositioned:p];
			}
		}
		group.userInteractionEnabled = NO;
	}
}

- (void)checkNeighborsForAllThePieces {
	
	for (PieceView *p in pieces) {
		if (p.isFree) {
			[self checkNeighborsOfPiece:p];
			if (p.hasNeighbors) {
				
				[self createNewGroupForPiece:p];
			}
		}
	}
	
	
}

- (void)checkNeighborsForGroup:(GroupView*)group {
	
	NSLog(@"Starting %s", __FUNCTION__);
	
	for (int i=0; i<[group.pieces count]; i++) {
		
		PieceView *p = [group.pieces objectAtIndex:i];
		
		if (!p.isCompleted) {
			[self checkNeighborsOfPiece:p];
			
		}
	}
	
	//NSLog(@"Finished %s", __FUNCTION__);
}



#pragma mark -
#pragma mark Pieces

- (void)pieceMoved:(PieceView *)piece {
	
	//NSLog(@"%s", __FUNCTION__);
	
	CGPoint point = piece.center;
	
	if (!piece.hasNeighbors) {
		
		BOOL outOfDrawer;
		if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
			outOfDrawer = point.y<screenHeight-drawerSize;
		} else {
			outOfDrawer = point.x>drawerSize-self.padding;
		}
		
		point = [drawerView convertPoint:point fromView:self.view];
		
		
		if (![drawerView pointInside:point withEvent:nil]) {
			
			
			if (!piece.isFree && ![self pieceIsOut:piece]) {
				
				piece.isFree = YES;
				
			}
			
		} else {
			piece.isFree = NO;
			piece.position = -1;
			[UIView animateWithDuration:0.5 animations:^{
				
				float scale = self->piceSize/piece.frame.size.width;
				piece.transform = CGAffineTransformScale(piece.transform, scale, scale);
				
			}];
		}
		
	} else {
		piece.isFree = YES;
	}
	
	
	
	
	if (piece.isFree) {
		piece.moves++;
		moves++;
	}
	
	
	
	if (piece.isFree) {
		
		if ( [self pieceIsOut:piece] )
		{
			
			[UIView animateWithDuration:0.5 animations:^{
				
				for (PieceView *p in [piece allTheNeighborsBut:nil]) {
					CGRect rect = p.frame;
					rect.origin.x = p.oldPosition.x-p.frame.size.width/2;
					rect.origin.y = p.oldPosition.y-p.frame.size.height/2;
					p.frame = rect;
					//NSLog(@"Reset the old position (%.1f, %.1f) for piece #%d", p.oldPosition.x, p.oldPosition.y, p.number);
					p.position = [self positionOfPiece:p];
				}
				CGRect rect = piece.frame;
				rect.origin.x = piece.oldPosition.x-piece.frame.size.width/2;
				rect.origin.y = piece.oldPosition.y-piece.frame.size.height/2;
				piece.frame = rect;
				//NSLog(@"BOSS - Reset the old position (%.1f, %.1f) for piece #%d", piece.oldPosition.x, piece.oldPosition.y, piece.number);
				piece.position = [self positionOfPiece:piece];
			}];
			
		} else {
			
			for (int i=9*NumberSquare-1; i>-1; i--) {
				CGRect frame = [self frameOfLatticePiece:i];
				if ([self piece:piece isInFrame:frame]) {
					
					[self movePiece:piece toLatticePoint:i animated:YES];
					
					break;
				}
			}
		}
	}
	
	piece.isLifted = NO;
	
	[UIView animateWithDuration:0.5 animations:^{
		[self organizeDrawerWithOrientation:self.interfaceOrientation];
	}];
	
	piece.oldPosition = [piece realCenter];
}

- (int)positionOfPiece:(PieceView*)piece {
	for (int i=9*NumberSquare-1; i>-1; i--) {
		
		CGRect frame = [self frameOfLatticePiece:i];
		
		if ([self piece:piece isInFrame:frame]) {
			
			//NSLog(@"-> Returning position %d",i);
			return i;
		}
	}
	
	//NSLog(@"-> \nReturning position -1");
	return -1;
}

- (void)pieceRotated:(PieceView *)piece {
	piece.rotations++;
	rotations++;
	
	//NSLog(@"Piece rotated! Angle = %.1f", piece.angle);
	
	if (piece.group==nil) {
		
		for (PieceView *p in [piece allTheNeighborsBut:nil]) {
			p.oldPosition = [p realCenter];
			p.position = [self positionOfPiece:p];
		}
		piece.oldPosition = [piece realCenter];
		piece.position = [self positionOfPiece:piece];
		
		[self isPositioned:piece];
		
	} else { //In a group
		
		for (PieceView *p in piece.group.pieces) {
			
			p.angle = piece.angle;
		}
		
		[self updatePositionsInGroup:piece.group withReferencePiece:piece];
	}
	
	
	//NSLog(@"Position for piece #%d is %d", piece.number, piece.position);
	//NSLog(@"OldPosition (%.1f, %.1f) set for piece #%d", [piece realCenter].x, [piece realCenter].y, piece.number);
	
	if (piece.group!=nil) {
		
		[self checkNeighborsForGroup:piece.group];
		
	} else {
		
		[self checkNeighborsOfPiece:piece];
		if (piece.hasNeighbors) {
			[self createNewGroupForPiece:piece];
		}
	}
	[self updatePercentage];
	
	
}

- (PieceView*)pieceAtPosition:(int)j {
	
	for (PieceView *p in pieces) {
		
		if (p.position == j) {
			
			//NSLog(@"Piece at position %d is #%d", j, p.number);
			return p;
		}
	}
	
	return nil;
}

- (BOOL)shouldCheckNeighborsOfPiece:(PieceView*)piece inDirection:(int)r {
	if (piece.position!=0) {
		return YES;
	} else {
		return (r==1 || r==2);
	}
}

- (int)rotationFormAngle:(float)angle {
	
	int rotation = 3;
	
	if (angle<1) rotation = 0;
	else if (angle<3) rotation = 1;
	else if (angle<4) rotation = 2;
	
	return rotation;
}

- (void)checkNeighborsOfPiece:(PieceView*)piece {
	
	int rotation = [self rotationFormAngle:piece.angle];
	
	PieceView *otherPiece;
	int j = piece.position;
	
	if (j==-1) {
		return;
	}
	
	
	for (int direction=0; direction<4; direction++) {
		
		int r = (direction+rotation)%4;
		
		int i = [[directions_positions objectAtIndex:r] intValue];
		int l = [[directions_numbers objectAtIndex:direction] intValue];
		
		
		//Looks for neighbors
		
		if (j+i>=0 && j+i<9*NumberSquare && [self shouldCheckNeighborsOfPiece:piece inDirection:r] )
		{
			
			otherPiece = [self pieceAtPosition:j+i];
			
			NSLog(@"j+i = %d ; numbers are %d and %d for pieces #%d, and #%d. Direction = %d, rotation = %d, r = %d",j+i, piece.number+l, otherPiece.number,  piece.number, otherPiece.number, direction, rotation, r);
			
			NSLog(@"Checking position %d, number+l = %d, otherPiece.number = %d", piece.number+i, piece.number+l, otherPiece.number);
			
			if (otherPiece != nil) {
				
				if (otherPiece.isFree) {
					
					NSLog(@"Angles are %.1f (piece) and %.1f (other)\n\n", piece.angle, otherPiece.angle);
					
					
					if (piece.number+l==otherPiece.number) {
						
						
						if ((ABS(piece.angle-otherPiece.angle)<M_PI/4)) {
							
							if ([[piece.neighbors objectAtIndex:direction%4] intValue]!=otherPiece.number) {
								
								[otherPiece setNeighborNumber:piece.number forEdge:(direction+2)%4];
								[piece setNeighborNumber:otherPiece.number forEdge:direction%4];
								
								piece.hasNeighbors = YES;
								otherPiece.hasNeighbors = YES;
								
								if (
										!loadingGame &&
										!([self isTheFuckingPiecePositioned:piece])
										) {
									[APPALL.mySoundManager playSound:@"splash.mp3"];
								}
								
								//NSLog(@"piece.isPositioned = %d, otherpiece.isPositioned = %d", piece.isPositioned, otherPiece.isPositioned);
								
								if ((![self isTheFuckingPiecePositioned:piece] || ![self isTheFuckingPiecePositioned:otherPiece]) && !loadingGame) {
									
									if (otherPiece.group!=nil && !otherPiece.group.isPositioned) {
										
										if (piece.group!=nil) {
											for (PieceView *p in piece.group.pieces) {
												[self addPiece:p toGroup:otherPiece.group];
											}
										} else {
											[self addPiece:piece toGroup:otherPiece.group];
										}
										
									} else if (piece.group!=nil && !piece.group.isPositioned) {
										
										if (otherPiece.group!=nil) {
											for (PieceView *p in otherPiece.group.pieces) {
												[self addPiece:p toGroup:piece.group];
											}
										} else {
											[self addPiece:otherPiece toGroup:piece.group];
										}
										
									}
								}
							}
							
						}
					}
				}
				
			}else {
				
				//NSLog(@"NIL");
				
			}
			
		} else {
			//NSLog(@"Shouldn't check");
		}
		
	}
	
	//NSLog(@"\n");
	
}

- (BOOL)isTheFuckingPiecePositioned:(PieceView*)piece {
	
	return (firstPiecePlace + 3*pieceNumber*(piece.number/pieceNumber) + (piece.number%pieceNumber) == piece.position);
}

- (BOOL)isPositioned:(PieceView*)piece  {
	if (piece.isFree && ([self isTheFuckingPiecePositioned:piece]) && ABS(piece.angle) < 1) {
		//Flashes and block the piece
		if (!piece.isPositioned) {
			if (!loadingGame) {
				[self addPoints:[self pointsForPiece:piece]];
			}
			piece.isPositioned = YES;
			piece.userInteractionEnabled = NO;
			if (!piece.group) {
				[piece removeFromSuperview];
				[self.view insertSubview:piece aboveSubview:lattice];
			}
			[piece pulse];
			if (![self isPuzzleComplete] && !loadingGame) {
				[APPALL.mySoundManager playSound:@"shake.wav"];
			}
		}
		return YES;
	}
	return NO;
}

- (void)movePiece:(PieceView*)piece toLatticePoint:(int)i animated:(BOOL)animated {
	
	//NSLog(@"Moving piece #%d to position %d", piece.number, i);
	
	piece.position = i;
	
	if (animated) {
		
		[UIView animateWithDuration:0.3 animations:^{
			
			piece.center = [self centerOfLatticePiece:i];
			CGAffineTransform trans = CGAffineTransformMakeScale(self->lattice.scale, self->lattice.scale);
			piece.transform = CGAffineTransformRotate(trans, piece.angle);
			
		}completion:^(BOOL finished) {
			
			[self checkNeighborsOfPiece:piece];
			
			if (piece.hasNeighbors) {
				[self createNewGroupForPiece:piece];
			}
			
			if (!piece.isPositioned) {
				[self isPositioned:piece];
			}
			
			[self updatePercentage];
		}];
		
	} else {
		
		piece.center = [self centerOfLatticePiece:i];
		CGAffineTransform trans = CGAffineTransformMakeScale(lattice.scale, lattice.scale);
		piece.transform = CGAffineTransformRotate(trans, piece.angle);
		
	}
	
	piece.oldPosition = [piece realCenter];
	
}

- (BOOL)piece:(PieceView*)piece isInFrame:(CGRect)frame {
	
	return frame.origin.x<[piece realCenter].x && frame.origin.y<[piece realCenter].y;
}

- (BOOL)point:(CGPoint)point isInFrame:(CGRect)frame {
	
	//NSLog(@"Point = %.1f, %.1f", point.x, point.y);
	
	return (frame.origin.x<point.x &&
					frame.origin.y<point.y &&
					frame.origin.x+frame.size.width>point.x &&
					frame.origin.y+frame.size.height>point.y
					);
}

- (CGPoint)coordinatesOfPiece:(PieceView*)piece relativeToPiece:(PieceView*)boss {
	return CGPointMake(
										 (float)((piece.number%pieceNumber-boss.number%pieceNumber)%pieceNumber),
										 (float)(piece.number/pieceNumber-boss.number/pieceNumber)
										 );
	
}

- (void)resetSizeOfAllThePieces {
	
	CGRect rect;
	
	for (PieceView *p in pieces) {
		
		rect = p.frame;
		rect.size.width = piceSize;
		rect.size.height = piceSize;
		p.frame = rect;
	}
}

- (void)setPieceNumber:(int)pieceNumber_ {
	
	pieceNumber = pieceNumber_;
	NumberSquare = pieceNumber*pieceNumber;
	
}

- (PieceView*)pieceWithNumber:(int)j {
	
	for (PieceView *p in pieces) {
		if (p.number==j) {
			return p;
		}
	}
	
	return nil;
}

- (PieceView*)pieceWithPosition:(int)j {
	
	for (PieceView *p in pieces) {
		
		if (p.position==j && p.userInteractionEnabled) {
			return p;
		}
	}
	
	NSLog(@"None of the pieces is in position %d", j);
	
	return nil;
}

- (BOOL)pieceIsOut:(PieceView *)piece {
	
	CGRect frame1 = [self frameOfLatticePiece:0];
	CGRect frame2 = [self frameOfLatticePiece:9*NumberSquare-1];
	
	if ([piece realCenter].x > frame2.origin.x+frame2.size.width ||
			[piece realCenter].y > frame2.origin.y+frame2.size.width ||
			[piece realCenter].x < frame1.origin.x ||
			[piece realCenter].y < frame1.origin.y
			)
	{
		NSLog(@"Piece #%d is out, N= %.1d", piece.number, NumberSquare);
		return YES;
	}
	
	for (PieceView *p in [piece allTheNeighborsBut:nil]) {
		
		if ([p realCenter].x > frame2.origin.x+frame2.size.width ||
				[p realCenter].y > frame2.origin.y+frame2.size.width ||
				[p realCenter].x < frame1.origin.x ||
				[p realCenter].y < frame1.origin.y
				)        {
			NSLog(@"Piece is #%d out, N= %.1d (neighbor)", piece.number, NumberSquare);
			return YES;
		}
	}
	
	//NSLog(@"IN");
	
	return NO;
}

- (UIView*)upperPositionedThing {
	
	int N = self.view.subviews.count;
	
	for (int i=0; i<self.view.subviews.count; i++) {
		
		UIView *v = [self.view.subviews objectAtIndex:N-i-1];
		
		if ([v isKindOfClass:[GroupView class]]) {
			
			return v;
		}
		if ([v isKindOfClass:[PieceView class]]) {
			
			if (!v.userInteractionEnabled) {
				return v;
			}
		}
	}
	
	return lattice;
}



#pragma mark -
#pragma mark Lattice

- (void)createLattice {
	
	[lattice removeFromSuperview];
	
	
	float w = (piceSize-2*self.padding)*pieceNumber;
	
	CGRect rect = [[UIScreen mainScreen] bounds];
	
	//Center the lattice
	
	if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
		
		rect = CGRectMake((rect.size.height-w)/2+drawerSize/2, (rect.size.width-w)/2, w, w);
		
	} else {
		
		rect = CGRectMake((rect.size.width-w)/2, (rect.size.height-w)/2+drawerSize/2, w, w);
		
	}
	
	lattice = [[Lattice alloc] init];
	[lattice initWithFrame:rect
							withNumber:pieceNumber
						withDelegate:self];
	lattice.frame = [self frameForLatticeWithOrientation:self.interfaceOrientation];
	
	//float optimalPiceSize = PUZZLE_SIZE*rect.size.width/(pieceNumber)+2*self.padding;
	lattice.scale = 1; //optimalPiceSize/piceSize;
	//[self resizeLattice];
	
	[self.view addSubview:lattice];
	[self.view bringSubviewToFront:drawerView];
}

- (void)resetLatticePositionAndSizeWithDuration:(float)duration {
	
	float f = (screenWidth)/(pieceNumber+1)/(piceSize-2*padding);
	
	
	[UIView animateWithDuration:duration animations:^{
		
		[self resizeLatticeToScale:f];
		
	}completion:^(BOOL finished) {
		
		[UIView animateWithDuration:duration animations:^{
			
			CGPoint center = [self.view convertPoint:(CGPoint)[(UIView*)[self->lattice objectAtIndex:self->firstPiecePlace] center] fromView:self->lattice];
			int topBar = (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad && UIInterfaceOrientationIsLandscape(self.interfaceOrientation))*20;
			
			if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
				
				self->lattice.transform = CGAffineTransformTranslate(self->lattice.transform,
																														 -center.x/self->lattice.scale+(self->piceSize-2*self->padding)+(self->drawerSize)/self->lattice.scale,
																														 -center.y/self->lattice.scale+(self->piceSize-2*self->padding)+10);
			} else {
				
				self->lattice.transform = CGAffineTransformTranslate(self->lattice.transform,
																														 -center.x/self->lattice.scale+(self->piceSize-2*self->padding),
																														 -center.y/self->lattice.scale+(self->piceSize-2*self->padding)+(self->elapsedTimeLabel.bounds.size.height)/self->lattice.scale-topBar);
			}
			
			
			[self refreshPositions];
			
		}];
	}];
	
}

- (void)moveLatticeToLeftWithDuration:(float)duration {
	
	CGPoint center = [self.view convertPoint:[(UIView*)[lattice objectAtIndex:firstPiecePlace] center] fromView:lattice];
	int topBar = (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad && UIInterfaceOrientationIsPortrait(self.interfaceOrientation))*20;
	
	lattice.transform = CGAffineTransformTranslate(lattice.transform,
																								 -center.x/lattice.scale+(piceSize-2*padding),
																								 -center.y/lattice.scale+(piceSize-2*padding)/2+topBar);
	
	
	[self refreshPositions];
	
	[UIView animateWithDuration:duration animations:^{
		
		for (GroupView *g in self->groups) {
			g.alpha = 1;
		}
		
		for (PieceView *p in self->pieces) {
			if (!p.group) {
				p.alpha = 1;
			}
		}
	}];
}

- (CGRect)frameOfLatticePiece:(int)i {
	
	UIView *v = [lattice objectAtIndex:i];
	return CGRectMake(
										lattice.frame.origin.x + lattice.scale*(v.frame.origin.x-self.padding)-2.0*lattice.scale,
										lattice.frame.origin.y + lattice.scale*(v.frame.origin.y-self.padding)-2.0*lattice.scale,
										lattice.scale*piceSize,
										lattice.scale*piceSize
										);
	
}

- (CGPoint)centerOfLatticePiece:(int)i {
	
	CGRect rect = [self frameOfLatticePiece:i];
	return CGPointMake(rect.origin.x+lattice.scale*piceSize/2.0, rect.origin.y+lattice.scale*piceSize/2.0);
	
}



#pragma mark -
#pragma mark Drawer

- (void)organizeDrawerWithOrientation:(UIImageOrientation)orientation {
	
	NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:pieces];
	
	if ([temp count] == 0) {
		return;
	}
	
	
	//Removes removed pieces
	for (int i=0; i<[pieces count]; i++) {
		
		PieceView *p = [pieces objectAtIndex:i];
		if (p.isFree || p.isLifted) {
			[temp removeObject:p];
		}
	}
	
	
	if ((drawerFirstPoint.x==0 && drawerFirstPoint.y==0) ){//|| removed) {
		
		PieceView *p = [temp objectAtIndex:0];
		drawerFirstPoint.x = [p frame].origin.x+p.bounds.size.height/2;
		drawerFirstPoint.y = [p frame].origin.y+p.bounds.size.height/2;
		//NSLog(@"FirstPoint = %.1f, %.1f", drawerView.frame.origin.x, drawerView.frame.origin.y);
		
	}
	
	//[UIView animateWithDuration:ORG_TIME animations:^{
	
	for (int i=0; i<[temp count]; i++) {
		
		PieceView *p = [temp objectAtIndex:i];
		
		CGPoint point = p.center;
		PieceView *p2;
		
		if (i>0) {
			p2 = [temp objectAtIndex:i-1];
			CGPoint point2 = p2.center;
			
			if (UIInterfaceOrientationIsLandscape(orientation)) {
				point.y = point2.y+p2.bounds.size.width+drawerMargin;
				point.x = drawerView.center.x; //(self.padding*0.75)/2+p.bounds.size.width/2;;
			} else {
				point.x = point2.x+p2.bounds.size.width+drawerMargin;
				point.y = screenHeight-drawerSize+(self.padding*0.75)/2+p.bounds.size.height/2;
			}
			
		} else {
			
			
			if (UIInterfaceOrientationIsLandscape(orientation)) {
				point.y = drawerFirstPoint.y+p.bounds.size.height/2+drawerMargin;
				point.x = drawerView.center.x; //(self.padding*0.75)/2+p.bounds.size.width/2;;
			} else {
				point.x = drawerFirstPoint.x+p.bounds.size.width/2+drawerMargin;
				point.y = screenHeight-drawerSize+(self.padding*0.75)/2+p.bounds.size.height/2;
			}
			
			//NSLog(@"FirstPoint was %.1f, %.1f", drawerFirstPoint.x, drawerFirstPoint.y);
			
		}
		
		if (!didRotate && UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
			//point.y += 20;
		}
		
		p.center = point;
		
	}
	//}];
	
	
	
}

- (BOOL)drawerStoppedShouldBeStopped {
	
	if ([self numberOfPiecesInDrawerAtTheMoment]<=numberOfPiecesInDrawer) {
		
		if (!drawerStopped) {
			drawerStopped = YES;
			drawerFirstPoint = CGPointMake(-4, 5);
			[UIView animateWithDuration:0.5 animations:^{
				[self organizeDrawerWithOrientation:self.interfaceOrientation];
			}];
		}
		return YES;
	}
	return NO;
}

- (void)panDrawer:(UIPanGestureRecognizer*)gesture {
	if ([self drawerStoppedShouldBeStopped]) return;
	drawerStopped = NO;
	CGPoint traslation = [gesture translationInView:lattice.superview];
	if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) { //Landscape
		
		float velocity = [gesture velocityInView:self.view].y;
		
		if (velocity<0) {
			
			if (velocity < -VELOCITY_LIMIT) velocity = -VELOCITY_LIMIT;
			
			if ([self lastPieceInDrawer].frame.origin.y<screenWidth-piceSize) {
				
				[self moveNegativePieces];
			}
			
		} else {
			
			if (velocity>VELOCITY_LIMIT) velocity = VELOCITY_LIMIT;
			
			if ([self firstPieceInDrawer].frame.origin.y>0) {
				
				[self movePositivePieces];
			}
			
		}
		
		if (ABS(traslation.x > PAN_DRAWER_ACCURACY) || ABS(traslation.y) > PAN_DRAWER_ACCURACY) {
			
			for (PieceView *p in pieces) {
				if (!p.isFree) {
					
					CGPoint point = p.center;
					point.y += velocity*PANNING_SPEED;
					p.center = point;
				}
			}
			drawerFirstPoint.y += velocity*PANNING_SPEED;
			[gesture setTranslation:CGPointMake(traslation.x, 0) inView:lattice.superview];
		}
		
		
	} else {    //Portrait
		float velocity = [gesture velocityInView:self.view].x;
		if (velocity<0) {
			if (velocity < -VELOCITY_LIMIT) velocity = -VELOCITY_LIMIT;
			if ([self lastPieceInDrawer].frame.origin.x<screenWidth-piceSize) {
				[self moveNegativePieces];
			}
		} else {
			if (velocity>VELOCITY_LIMIT) velocity = VELOCITY_LIMIT;
			if ([self firstPieceInDrawer].frame.origin.x>0) {
				[self movePositivePieces];
			}
		}
		if (ABS(traslation.x > PAN_DRAWER_ACCURACY) || ABS(traslation.y) > PAN_DRAWER_ACCURACY) {
			for (PieceView *p in pieces) {
				if (!p.isFree) {
					
					CGPoint point = p.center;
					point.x += velocity*PANNING_SPEED;
					p.center = point;
				}
			}
			drawerFirstPoint.x += velocity*PANNING_SPEED;
			[gesture setTranslation:CGPointMake(0, traslation.y) inView:lattice.superview];
		}
	}
	//[self organizeDrawerWithOrientation:self.interfaceOrientation];
	PieceView *first = [self firstPieceInDrawer];
	drawerFirstPoint = first.center;
}

- (int)numberOfPiecesInDrawerAtTheMoment {
	int i = 0;
	for (PieceView *p in pieces) {
		if (!p.isFree) {
			i++;
		}
	}
	return i;
}

- (PieceView*)firstPieceInDrawer {
	
	for (int i=0; i<[pieces count]; i++) {
		PieceView *p = [pieces objectAtIndex:i];
		if (!p.isFree) {
			return p;
		}
	}
	return nil;
	
}

- (PieceView*)lastPieceInDrawer {
	for (NSInteger i = [pieces count]-1; i>-1; i--) {
		PieceView *p = [pieces objectAtIndex:i];
		if (!p.isFree) {
			return p;
		}
	}
	return nil;
}

- (CGRect)frameUnderPiece:(PieceView*)piece {
	if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
		return CGRectMake(drawerView.frame.origin.x+drawerMargin,
											piece.frame.origin.y+piceSize+drawerMargin,
											piece.frame.size.width,
											piece.frame.size.height);
	} else {
		return CGRectMake(piece.frame.origin.x+piceSize+drawerMargin,
											drawerView.frame.origin.y+drawerMargin,
											piece.frame.size.width,
											piece.frame.size.height);
	}
}

- (CGRect)frameOverPiece:(PieceView*)piece {
	if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
		return CGRectMake(drawerView.frame.origin.x+drawerMargin,
											piece.frame.origin.y-piceSize-drawerMargin,
											piece.frame.size.width,
											piece.frame.size.height);
	} else {
		return CGRectMake(piece.frame.origin.x-piceSize-drawerMargin,
											drawerView.frame.origin.y+drawerMargin,
											piece.frame.size.width,
											piece.frame.size.height);
	}
}

- (void)moveNegativePieces {
	PieceView *swap = [self firstPieceInDrawer];
	[pieces removeObject:swap];
	swap.frame = [self frameUnderPiece:[self lastPieceInDrawer]];
	[pieces addObject:swap];
	return;
}

- (void)movePositivePieces {
	if ([self numberOfPiecesInDrawerAtTheMoment]<numberOfPiecesInDrawer) {
		return;
	}
	PieceView *swap = [self lastPieceInDrawer];
	[pieces removeObject:swap];
	swap.frame = [self frameOverPiece:[self firstPieceInDrawer]];
	[pieces insertObject:swap atIndex:0];
	return;
}

- (void)swipeInDirection:(UISwipeGestureRecognizerDirection)direction {
	NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:pieces];
	for (PieceView *p in pieces) {
		if (p.isFree) {
			[temp removeObject:p];
		}
	}
	int sgn = 1;
	if (direction==UISwipeGestureRecognizerDirectionLeft) {
		sgn *= -1;
	}
	float traslation = screenWidth-drawerMargin;
	if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
		
		if (direction==UISwipeGestureRecognizerDirectionRight && drawerFirstPoint.y>=-piceSize) {
			return;
		}
		
		PieceView *p = [temp lastObject];
		if (
				direction==UISwipeGestureRecognizerDirectionLeft &&
				p.frame.origin.y<screenWidth-p.frame.size.height+self.padding
				) {
			return;
		}
		if (!swiping) {
			[UIView animateWithDuration:0.5 animations:^{
				self->swiping = YES;
				self->drawerFirstPoint.y += sgn*(traslation);
				[UIView animateWithDuration:0.5 animations:^{
					[self organizeDrawerWithOrientation:self.interfaceOrientation];
				}];
				//NSLog(@"first point = %.1f", drawerFirstPoint.x);
			}completion:^(BOOL finished){
				self->swiping = NO;
			}];
		}
	} else {
		if (direction==UISwipeGestureRecognizerDirectionRight && drawerFirstPoint.x>=-piceSize) {
			return;
		}
		PieceView *p = [temp lastObject];
		if (direction==UISwipeGestureRecognizerDirectionLeft && p.frame.origin.x<screenWidth-p.frame.size.width+self.padding) {
			return;
		}
		if (!swiping) {
			[UIView animateWithDuration:0.5 animations:^{
				self->swiping = YES;
				self->drawerFirstPoint.x += sgn*traslation;
				[UIView animateWithDuration:0.5 animations:^{
					[self organizeDrawerWithOrientation:self.interfaceOrientation];
				}];
			}completion:^(BOOL finished){
				self->swiping = NO;
			}];
		}
	}
}

- (void)swipeR:(UISwipeGestureRecognizer*)swipe {
	[self swipeInDirection:UISwipeGestureRecognizerDirectionRight];
}

- (void)swipeL:(UISwipeGestureRecognizer*)swipe {
	[self swipeInDirection:UISwipeGestureRecognizerDirectionLeft];
}

- (CGRect)frameForLatticeWithOrientation:(UIInterfaceOrientation)orientation {
	float w = (piceSize-2*self.padding)*pieceNumber;
	CGRect latticeRect = [[UIScreen mainScreen] bounds];
	if (UIInterfaceOrientationIsLandscape(orientation)) {
		latticeRect = CGRectMake((latticeRect.size.height-w)/2+drawerSize/2, (latticeRect.size.width-w)/2, w, w);
	} else {
		latticeRect = CGRectMake((latticeRect.size.width-w)/2, (latticeRect.size.height-w)/2+drawerSize/2, w, w);
	}
	return latticeRect;
}

#pragma mark -
#pragma mark Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
		if (puzzleCompete) {
			return NO;
		}
		return YES;
	} else {
		return (interfaceOrientation==UIInterfaceOrientationPortrait);
	}
}

- (CGRect)rotatedFrame:(CGRect)frame {
	return CGRectMake(frame.origin.y, frame.origin.x, frame.size.width, frame.size.height);
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	IF_IPAD [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
	[completedController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	CGRect drawerFrame = drawerView.frame;
	CGRect HUDFrame = elapsedTimeLabel.frame;
	CGPoint chooseCenter = CGPointZero;
	CGPoint completedCenter = CGPointZero;
	
	if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation) && !UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
		drawerFirstPoint = CGPointMake(5, drawerFirstPoint.x);
		drawerFrame.size.width = drawerSize;
		drawerFrame.size.height = screenWidth;
		drawerFrame.origin.x = 0;
		drawerFrame.origin.y = -10;
		
		lattice.center = CGPointMake(lattice.center.x+drawerSize, lattice.center.y);
		
	} else if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation) && !UIInterfaceOrientationIsPortrait(self.interfaceOrientation)){
		
		drawerFirstPoint = CGPointMake(drawerFirstPoint.y, 5);
		
		drawerFrame.size.height = drawerSize;
		drawerFrame.size.width = screenWidth;
		drawerFrame.origin.x = 0;
		drawerFrame.origin.y = screenWidth-drawerSize;
		
		chooseCenter = CGPointMake(self.view.center.x-10, self.view.center.y-290);
		
		lattice.center = CGPointMake(lattice.center.x-drawerSize, lattice.center.y);
	}
	
	
	[self refreshPositions];
	
	HUDFrame.origin.x = 0;
	HUDFrame.origin.y = 0;
	
	[UIView animateWithDuration:duration animations:^{
		self->drawerView.frame = drawerFrame;
		self->elapsedTimeLabel.frame = HUDFrame;
	}];
	
	
	[UIView animateWithDuration:duration animations:^{
		[self organizeDrawerWithOrientation:toInterfaceOrientation];
	}];
}

- (void)refreshPositions {
	
	for (PieceView *p in pieces) {
		if (p.isFree && p.position>-1 && p.group==nil) {
			[self movePiece:p toLatticePoint:p.position animated:NO];
		}
	}
	
	for (GroupView *g in groups) {
		[self moveGroup:g toLatticePoint:g.boss.position animated:NO];
	}
}

- (CGPoint)applyMatrix:(CGAffineTransform)matrix toVector:(CGPoint)vector {
	
	return CGPointMake(matrix.a*vector.x+matrix.b*vector.y, matrix.c*vector.x+matrix.d*vector.y);
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
	anchorPoint = CGPointMake(anchorPoint.x / lattice.bounds.size.width, anchorPoint.y / lattice.bounds.size.height);
	CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y);
	CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y);
	
	newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
	oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
	
	CGPoint pos = view.layer.position;
	
	pos.x -= oldPoint.x;
	pos.x += newPoint.x;
	
	pos.y -= oldPoint.y;
	pos.y += newPoint.y;
	
	view.layer.position = pos;
	view.layer.anchorPoint = anchorPoint;
}

- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
	if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
		
		UIView *piece = gestureRecognizer.view;
		//Change this!!!
		piece = lattice;
		
		CGPoint locationInView = [gestureRecognizer locationInView:piece];
		CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
		
		piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
		piece.center = locationInSuperview;
	}
}

- (void)shuffle {
	
	pieces = [self shuffleArray:pieces];
	
	for (int i=0; i<NumberSquare; i++) {
		PieceView *p = [pieces objectAtIndex:i];
		CGRect rect = p.frame;
		rect.origin.x = piceSize*i+drawerMargin;
		rect.origin.y = screenHeight-drawerSize+5;
		p.frame = rect;
		if (APPALL.myCacheItem.isRotate) {
			int r = arc4random_uniform(4);
			p.transform = CGAffineTransformMakeRotation(r*M_PI/2);
			p.angle = r*M_PI/2;
		} else {
			p.angle = 0;
		}
	}
	
}

- (NSMutableArray*)shuffleArray:(NSMutableArray*)array {
	for(long i = [array count]; i > 1; i--) {
		int j = arc4random_uniform(i);
		[array exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
	}
	for (int i=0; i<[array count]; i++) {
		[[array objectAtIndex:i] setPositionInDrawer:i];
	}
	return array;
}

- (void)shuffleAngles {
	
	for (int i=0; i<NumberSquare; i++) {
		
		PieceView *p = [pieces objectAtIndex:i];
		if (!p.isFree) {
			int r = arc4random_uniform(4);
			p.transform = CGAffineTransformMakeRotation(r*M_PI/2);
			p.angle = r*M_PI/2;
		}
	}
	
}

- (void)computePieceSize {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
		piceSize = PIECE_SIZE_IPAD;
	}else{
		piceSize = PIECE_SIZE_IPHONE;
	}
	
	self.padding = piceSize*0.15;
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
		drawerSize = piceSize+1.8*self.padding-15;
	else
		drawerSize = piceSize+1.8*self.padding-10;
	
	numberOfPiecesInDrawer = screenWidth/(piceSize+1);
	float unusedSpace = screenWidth - numberOfPiecesInDrawer*piceSize;
	drawerMargin = (float)(unusedSpace/(numberOfPiecesInDrawer+1));
	firstPiecePlace =  3*NumberSquare+pieceNumber;
}

- (void)bringDrawerToTop {
	
	for (PieceView *p in pieces) {
		if (p.isFree && !p.isPositioned) {
			
			[self.view bringSubviewToFront:p];
		}
	}
	
	[self.view bringSubviewToFront:drawerView];
	[self.view bringSubviewToFront:elapsedTimeLabel];
	
	for (PieceView *p in pieces) {
		if (!p.isFree) {
			[self.view bringSubviewToFront:p];
		}
	}
}

- (void)updatePercentage {
	[self.navigationItem.leftBarButtonItem setTitle:[NSString stringWithFormat:@"%.0f %%", [self completedPercentage]]];
}

- (void)removeOldPieces {
	for (int i = 0; i<[pieces count]; i++) {
		PieceView *p = [pieces objectAtIndex:i];
		[p removeFromSuperview];
		p = nil;
	}
	
	for (UIView *v in groups) {
		[v removeFromSuperview];
	}
}

- (NSOperationQueue *)operationQueue {
	if (operationQueue == nil) {
		operationQueue = [[NSOperationQueue alloc] init];
	}
	return operationQueue;
}

- (float)completedPercentage {
	
	float positioned = 0.0;
	
	for (PieceView *p in pieces) {
		if (p.isFree && p.isPositioned) {
			positioned += 1.0;
		}
	}
	
	return (positioned/NumberSquare*100);
	
}

- (void)print_free_memory {
#ifdef FRACTAL_DEBUG
	mach_port_t host_port;
	mach_msg_type_number_t host_size;
	vm_size_t pagesize;
	
	host_port = mach_host_self();
	host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
	host_page_size(host_port, &pagesize);
	
	vm_statistics_data_t vm_stat;
	
	if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
		NSLog(@"Failed to fetch vm statistics");;
	
	/* Stats in bytes */
	natural_t mem_used = (vm_stat.active_count +
												vm_stat.inactive_count +
												vm_stat.wire_count) * pagesize;
	natural_t mem_free = vm_stat.free_count * pagesize;
	natural_t mem_total = mem_used + mem_free;
	NSLog(@"used: %u free: %u total: %u", mem_used/ 100000, mem_free/ 100000, mem_total/ 100000);
#endif
}

+ (float)computeFloat:(float)f modulo:(float)m {
	
	float result = f - floor((f)/m)*m;
	
	if (result>m-0.2) result = 0;
	
	if (result<0) result = 0;
	
	return result;
	
}



#pragma mark -
#pragma mark Timer

- (void)oneSecondElapsed {
	elapsedTime += 0.1;
	int seconds = (int)elapsedTime%60;
	int minutes = (int)elapsedTime/60;
	if (elapsedTime - (int)elapsedTime < 0.1) {
		elapsedTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
	}
}

- (void)startTimer {
	if (![self isPuzzleComplete]) {
		if (!timer) {
			timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(oneSecondElapsed) userInfo:nil repeats:YES];
		}
	}
}

- (void)stopTimer {
	[timer invalidate];
	timer = NULL;
}

- (void)startNewGame {
	[APPALL.mySoundManager playMusic:@"canon.mp3" looping:YES];
	UIImage *pickedImage = [APPALL.puzzleImage copy];
	NSData *dataJPG = UIImageJPEGRepresentation(pickedImage, IMAGE_QUALITY);
	NSLog(@"Image size JPG = %.2f", (float)2*((float)dataJPG.length/10000000.0));
	self.image = [UIImage imageWithData:dataJPG];
	self.loadingGame = NO;
	self.pieceNumber = (int)APPALL.myCacheItem.countNum;
	[self removeOldPieces];
	
	puzzleCompete = NO;
	
	groups = nil;
	pieces = nil;
	groups = [[NSMutableArray alloc] initWithCapacity:NumberSquare];
	pieces = [[NSMutableArray alloc] initWithCapacity:NumberSquare];
	
	
	[self createPuzzleFromImage:image];
	
	[UIView animateWithDuration:0.2 animations:^{
		
		self->lattice.frame = [self frameForLatticeWithOrientation:self.interfaceOrientation];
		
	}];
}

-(void)preNextState
{
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:mmsloc("completed") message:mmsloc("gotoNextLevel") preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *restartActon = [UIAlertAction actionWithTitle:mmsloc("menurestart") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[self startNewGame];
	}];
	UIAlertAction *backAction = [UIAlertAction actionWithTitle:mmsloc("menuquit") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[self.navigationController popViewControllerAnimated:YES];
	}];
	[vc addAction:restartActon];
	[vc addAction:backAction];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:vc animated:NO completion:nil];
	});
}

-(void)nextPressed:(id)sender
{
	NSLog(@"next...");
	NSInteger cacheLevel = APPALL.myCacheItem.myLevel;
	NSInteger cacheState = APPALL.myCacheItem.myState;
	NSLog(@"%ld, %ld", cacheLevel, cacheState);
	if(APPALL.myCacheItem.myState < levelNum - 1)
	{
		cacheState++;
	}
	else if(APPALL.myCacheItem.myLevel < 3)
	{
		cacheLevel++;
		cacheState = 0;
	}
	else
	{
		//#TODO :game clear.....
		cacheLevel = 0;
		cacheState = 0;
	}
	//#TODO :save game max level and state......
	[self setLevel:cacheLevel andState:cacheState];
	[self startNewGame];
}

-(void)setLevel:(NSInteger)aLevel andState:(NSInteger)aState
{
	APPALL.myCacheItem.myLevel = aLevel;
	APPALL.myCacheItem.myState = aState;
}

-(void)menuRestartPressed:(id)sender {
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:mmsloc("menuRestart") preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("menuCancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
		[self startTimer];
	}];
	UIAlertAction *ok1Action = [UIAlertAction actionWithTitle:mmsloc("OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[self startNewGame];
	}];
	[vc addAction:ok1Action];
	[vc addAction:cancelAction];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:vc animated:NO completion:nil];
	});
}

-(void)menuQuitPressed:(id)sender {
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:mmsloc("menuBack") preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("menuCancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
		[self startTimer];
	}];
	UIAlertAction *ok1Action = [UIAlertAction actionWithTitle:mmsloc("OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[self.navigationController popViewControllerAnimated:YES];
	}];
	[vc addAction:ok1Action];
	[vc addAction:cancelAction];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:vc animated:NO completion:nil];
	});
}

-(void)menuBackPressed:(id)sender {
	[self startTimer];
}

@end

