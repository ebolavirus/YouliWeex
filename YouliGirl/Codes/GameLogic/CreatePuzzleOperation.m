//
//  CreatePuzzleOperation.m
//  Puzzle
//
//  Created by Andrea Barbon on 03/05/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import "CreatePuzzleOperation.h"
#import "PuzzleController.h"
#import "UIImage+CWAdditions.h"
#import "AppDelegate.h"

#define IMAGE_SIZE_BOUND_IPAD 2*PIECE_SIZE_IPAD
#define IMAGE_SIZE_BOUND_IPHONE 3*PIECE_SIZE_IPHONE

#define JPG_QUALITY 1
#define SHAPE_QUALITY_IPAD 1
#define SHAPE_QUALITY_IPHONE 3


@implementation CreatePuzzleOperation

@synthesize delegate, loadingGame;

- (void)main {
    float IMAGE_SIZE_BOUND = 0;
    float SHAPE_QUALITY = 0;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        IMAGE_SIZE_BOUND = IMAGE_SIZE_BOUND_IPAD;
        SHAPE_QUALITY = SHAPE_QUALITY_IPAD;
    } else {
        IMAGE_SIZE_BOUND = IMAGE_SIZE_BOUND_IPHONE;
        SHAPE_QUALITY = SHAPE_QUALITY_IPHONE;
    }
}

- (UIImage*)clipImage:(UIImage*)img toRect:(CGRect)rect {
    
    CGImageRef drawImage = CGImageCreateWithImageInRect(img.CGImage, rect);
    UIImage *newImage = [UIImage imageWithCGImage:drawImage];
    CGImageRelease(drawImage);
    return newImage;
    
}

- (NSArray *)splitImage:(UIImage *)im partSize:(float)partSize {
    
    float x = delegate.pieceNumber;
    float y= delegate.pieceNumber;
    
    float padding = partSize*0.15;
    
    NSLog(@"Splitting image w=%.1f, ww=%.1f, imageSize=%.1f", partSize, padding, im.size.width);
    
    delegate.loadedPieces = 0;
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:delegate.NumberSquare];
    for (int i=0;i<x;i++){
        for (int j=0;j<y;j++){
            
            CGRect rect = CGRectMake(i * (partSize-2*padding)-padding,
                                     j * (partSize-2*padding)-padding,
                                     partSize, partSize);
            
            [arr addObject:[im subimageWithRect:rect]];
            
            delegate.loadedPieces++;
            
            //[arr addObject:[self clipImage:im toRect:rect]];
        }
    }
    
    return arr;
    
}

- (NSArray *)splitImage:(UIImage *)im{
    
    float x = delegate.pieceNumber;
    float y= delegate.pieceNumber;
    
    float w = QUALITY*delegate.piceSize;
    
    float ww = w*0.15;
    
    NSLog(@"Splitting image w=%.1f, ww=%.1f, imageSize=%.1f", w, ww, im.size.width);
    
    delegate.loadedPieces = 0;
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:delegate.NumberSquare];
    for (int i=0;i<x;i++){
        for (int j=0;j<y;j++){
            
            delegate.loadedPieces++;
            CGRect rect = CGRectMake(i * (w-2*ww)-ww, j * (w-2*ww)-ww, w, w);
            [arr addObject:[im subimageWithRect:rect]];
            //[arr addObject:[self clipImage:im toRect:rect]];
        }
    }
    
    return arr;
    
}

@end
