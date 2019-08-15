//
//  PuzzleCompletedController.m
//  Puzzle
//
//  Created by Andrea Barbon on 13/05/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import "PuzzleCompletedController.h"
#import "PuzzleController.h"
#import <QuartzCore/QuartzCore.h>

@interface PuzzleCompletedController ()

@property (nonatomic, assign) PuzzleController *delegate;
@property (nonatomic,strong) UILabel *pieces;
@property (nonatomic,strong) UILabel *time;
@property (nonatomic,strong) UILabel *score;
@property (nonatomic,strong) UILabel *moves;
@property (nonatomic,strong) UILabel *rotations;

@property (nonatomic,strong) UILabel *scoreLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *moveLabel;
@property (nonatomic,strong) UILabel *rotationLabel;

@end

@implementation PuzzleCompletedController

@synthesize delegate;
@synthesize pieces,time,score,moves,rotations;
@synthesize scoreLabel,timeLabel,moveLabel,rotationLabel;

- (id)initWithDelegate:(PuzzleController*)delegate {
	self = [super init];
	if (self) {
		self.delegate = delegate;
		self.view.frame = CGRectMake(0,0,kDeviceWidth,kDeviceWidth/2);
		self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
		self.view.layer.cornerRadius = 20;
		self.view.layer.masksToBounds = YES;
		
		CGFloat fontsize = kDeviceWidth/16.0f;
		
		self.pieces = [[UILabel alloc] init];
		pieces.text = mmsloc("gameconfig");
		pieces.font = [UIFont flatFontOfSize:fontsize];
		pieces.textAlignment = NSTextAlignmentLeft;
		pieces.textColor = MMColorWhite;
		[self.view addSubview:pieces];
		
		self.scoreLabel = [[UILabel alloc] init];
		scoreLabel.text = mmsloc("scoreLabel");
		scoreLabel.font = [UIFont flatFontOfSize:fontsize];
		scoreLabel.textAlignment = NSTextAlignmentLeft;
		scoreLabel.textColor = MMColorWhite;
		[self.view addSubview:scoreLabel];
		
		self.timeLabel = [[UILabel alloc] init];
		timeLabel.text = mmsloc("timeLabel");
		timeLabel.font = [UIFont flatFontOfSize:fontsize];
		timeLabel.textAlignment = NSTextAlignmentLeft;
		timeLabel.textColor = MMColorWhite;
		[self.view addSubview:timeLabel];
		
		self.moveLabel = [[UILabel alloc] init];
		moveLabel.text = mmsloc("movesLabel");
		moveLabel.font = [UIFont flatFontOfSize:fontsize];
		moveLabel.textAlignment = NSTextAlignmentLeft;
		moveLabel.textColor = MMColorWhite;
		[self.view addSubview:moveLabel];
		
		self.rotationLabel = [[UILabel alloc] init];
		rotationLabel.text = mmsloc("rotationsLabel");
		rotationLabel.font = [UIFont flatFontOfSize:fontsize];
		rotationLabel.textAlignment = NSTextAlignmentLeft;
		rotationLabel.textColor = MMColorWhite;
		[self.view addSubview:rotationLabel];
		
		self.score = [[UILabel alloc] init];
		score.text = mmsloc("gameconfig");
		score.font = [UIFont flatFontOfSize:fontsize];
		score.textAlignment = NSTextAlignmentLeft;
		score.textColor = MMColorWhite;
		[self.view addSubview:score];
		
		self.time = [[UILabel alloc] init];
		time.text = mmsloc("gameconfig");
		time.font = [UIFont flatFontOfSize:fontsize];
		time.textAlignment = NSTextAlignmentLeft;
		time.textColor = MMColorWhite;
		[self.view addSubview:time];
		
		self.moves = [[UILabel alloc] init];
		moves.text = mmsloc("gameconfig");
		moves.font = [UIFont flatFontOfSize:fontsize];
		moves.textAlignment = NSTextAlignmentLeft;
		moves.textColor = MMColorWhite;
		[self.view addSubview:moves];
		
		self.rotations = [[UILabel alloc] init];
		rotations.text = mmsloc("gameconfig");
		rotations.font = [UIFont flatFontOfSize:fontsize];
		rotations.textAlignment = NSTextAlignmentLeft;
		rotations.textColor = MMColorWhite;
		[self.view addSubview:rotations];
	}
	return self;
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	WS(ws);
	CGFloat fontsize = kDeviceWidth/16.0f;
	// 13/24 * edge
	CGFloat space = (kDeviceWidth/2 - fontsize*5)/6;
	NSLog(@"space is %f %f", fontsize, space);
	
	[self.pieces mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view).with.offset(20);
		make.right.mas_equalTo(ws.view).with.offset(-20);
		make.top.mas_equalTo(ws.view).with.offset(space);
		make.height.mas_equalTo(fontsize);
	}];
	[self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.pieces);
		make.top.mas_equalTo(ws.pieces.mas_bottom).with.offset(space);
		make.height.mas_equalTo(fontsize);
	}];
	//
	[self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.pieces);
		make.top.mas_equalTo(ws.scoreLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(fontsize);
	}];
	
	[self.moveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.pieces);
		make.top.mas_equalTo(ws.timeLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(fontsize);
	}];
	
	[self.rotationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.pieces);
		make.top.mas_equalTo(ws.moveLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(fontsize);
	}];
	
	[self.score mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view.mas_centerX);
		make.right.mas_equalTo(ws.view);
		make.top.and.height.mas_equalTo(ws.scoreLabel);
	}];
	
	[self.time mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view.mas_centerX);
		make.right.mas_equalTo(ws.view);
		make.top.and.height.mas_equalTo(ws.timeLabel);
	}];
	
	[self.moves mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view.mas_centerX);
		make.right.mas_equalTo(ws.view);
		make.top.and.height.mas_equalTo(ws.moveLabel);
	}];
	
	[self.rotations mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view.mas_centerX);
		make.right.mas_equalTo(ws.view);
		make.top.and.height.mas_equalTo(ws.rotationLabel);
	}];
}

- (void)updateValues {
	pieces.text = [NSString stringWithFormat:@"%d %@", delegate.NumberSquare, mmsloc("pieceLabel")];
	time.text = [NSString stringWithFormat:@"%@", delegate.elapsedTimeLabel.text];
	score.text = [NSString stringWithFormat:@"%d", delegate.score];
	moves.text = [NSString stringWithFormat:@"%d", delegate.moves];
	rotations.text = [NSString stringWithFormat:@"%d", delegate.rotations];
}

@end
