//
//  GroupView.m
//  Puzzle
//
//  Created by Andrea Barbon on 05/05/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import "GroupView.h"
#import "PieceView.h"
#import "PuzzleController.h"

@implementation GroupView

@synthesize boss, pieces, angle, delegate, isPositioned;

- (void)pulse {    
    
    if (isPositioned) {
        return;
    }
    
    [self removeFromSuperview];
    [delegate.view insertSubview:self aboveSubview:[delegate upperPositionedThing]];

    [self setAnchorPoint:boss.center forView:self];

    CATransform3D trasform = CATransform3DScale(self.layer.transform, 1.15, 1.15, 1);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:trasform];
    animation.autoreverses = YES;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = 2;
    [self.layer addAnimation:animation forKey:@"pulseAnimationGroup"];    
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
    
    anchorPoint = CGPointMake(anchorPoint.x / view.bounds.size.width, anchorPoint.y / view.bounds.size.height);
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

- (void)translateWithVector:(CGPoint)traslation {

    self.transform = CGAffineTransformTranslate(self.transform, traslation.x, traslation.y);

}

-(CGPoint)sum:(CGPoint)a plus:(CGPoint)b {
    return CGPointMake(a.x+b.x, a.y+b.y);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        pieces = [[NSMutableArray alloc] init];
        angle = 0;
    }
    return self;
}

@end
