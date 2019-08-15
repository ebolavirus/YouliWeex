//
//  RainbowVController.m
//  Chouqian
//
//  Created by MingmingSun on 2019/4/26.
//  Copyright © 2019 Sunmingming. All rights reserved.
//

#import "RainbowVController.h"

@interface RainbowVController ()

@property(nonatomic,strong) CAShapeLayer *mainLayer;

@end

@implementation RainbowVController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Do any additional setup after loading the view from its nib.
	NSArray *colors = @[(__bridge id)[UIColor redColor].CGColor,
											(__bridge id)[UIColor orangeColor].CGColor,
											(__bridge id)[UIColor yellowColor].CGColor,
											(__bridge id)[UIColor greenColor].CGColor,
											(__bridge id)[UIColor cyanColor].CGColor,
											(__bridge id)[UIColor blueColor].CGColor,
											(__bridge id)[UIColor purpleColor].CGColor];
	for(int i=0; i<colors.count; i++) {
		UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(180, 250) radius:(150-10*i) startAngle:M_PI endAngle:M_PI*2 clockwise:YES];
		[bezierPath addArcWithCenter:CGPointMake(180, 250) radius:(140-10*i) startAngle:0 endAngle:M_PI clockwise:NO];
		[bezierPath closePath];
		
		self.mainLayer = [CAShapeLayer layer];
		self.mainLayer.path = bezierPath.CGPath;
		self.mainLayer.fillColor = (__bridge CGColorRef _Nullable)(colors[i]);
		[self.view.layer addSublayer:self.mainLayer];
	}
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
