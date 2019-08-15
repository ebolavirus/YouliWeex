//
//  tooles.h
//  huoche
//
//  Created by kan xu on 11-1-22.
//  Copyright 2011 paduu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tooles : NSObject

+(float)computeFloat:(float)f modulo:(float)m;
+(UIImage*)getImageByColor:(UIColor*)aColor;
+ (NSString *)defaultViewControllerWithNibName:(NSString *)nibNameOrNil;
+(float)DeviceVersion;
+(UIImage*)grayImage:(UIImage *)sourceImage;

//旋转照片
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
+(UIImage *)rotateImage:(UIImage *)aImage;
+(UIImage *)cropSquareImage:(UIImage *)image;

+(BOOL)isTheStr:(NSString*)aStr hasContainTheSubStr:(NSString*)bStr;

@end
