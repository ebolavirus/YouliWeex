//
//  Lattice.m
//  Puzzle
//
//  Created by Andrea Barbon on 22/04/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import "Lattice.h"
#import "PuzzleController.h"
#import <QuartzCore/QuartzCore.h>

@implementation Lattice

@synthesize delegate, scale, pieces;

- (void)initWithFrame:(CGRect)frame
					 withNumber:(int)n_
				 withDelegate:(id)delegate_ {
	n = n_;
	self.delegate = delegate_;
	scale = 1;
	float w = frame.size.width/n;
	@autoreleasepool {
		self.bgImageView = [[UIImageView alloc] initWithImage:[APPALL.puzzleImage copy]];
		[self.bgImageView setAlpha:0.5f];
		float panning = 2.0;
		[self.bgImageView setFrame:CGRectMake(n*w-2*panning, n*w-2*panning, n*w, n*w)];
		self.bgImageView.hidden = !APPALL.myCacheItem.isTip;
		[self addSubview:self.bgImageView];
		NSMutableArray *a = [[NSMutableArray alloc] initWithCapacity:n^2];
		for (int i=0;i<3*n;i++){
			for (int j=0;j<3*n;j++){
				CGRect rect = CGRectMake(i*w-panning, j*w-panning, w-2*panning, w-2*panning);
				UIView *v = [[UIView alloc] initWithFrame:rect];
				//v.layer.cornerRadius = w/15;
				//v.layer.masksToBounds = YES;
				v.backgroundColor = [UIColor whiteColor];
				if ( i >= n && i < 2*n && j >= n && j < 2*n ) {
					v.alpha = .2;
				} else {
					
					v.alpha = .05;
				}
				[a addObject:v];
				[self addSubview:v];
			}
		}
		
		pieces = [NSArray arrayWithArray:a];
		
	}
	
	//[self addSubview:[[UIImageView alloc] initWithImage:[(PuzzleController*)delegate image]]];
	
}
- (void)switchTip {
	self.bgImageView.hidden = !APPALL.myCacheItem.isTip;
}
- (id)objectAtIndex:(int)i {
	if ( i < 0 || i > n*n*9-1 ) {
		NSLog(@"%d is out of bounds", i);
		return nil;
	}
	return [pieces objectAtIndex:i];
}

@end
