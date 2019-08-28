//
//  tooles.m
//  huoche
//
//  Created by kan xu on 11-1-22.
//  Copyright 2011 paduu. All rights reserved.
//

#import "stories.h"

@implementation stories

+(NSArray*)loadStoryByDayFlag:(NSInteger)aDayFlag {
	// 规则
	// 普通剧本
	// 第一个元素：story-祐莉衣服-背景-初始bgm-0（好感度变化）
	// 第二个元素开始: 0/1/2(是否展示祐莉，2为标题)-12（祐莉表情）-speaker-text（文本）-bgm（新bgm）
	// 最后一个元素：end-index（下一个元素index）
	// dialog
	// 第一个元素：dialog-问句
	// 第三个元素：选项一-index（下一个元素）,index为end
	// 第四个元素：选项二-index（下一个元素）
	switch (aDayFlag) {
		case 1: {
			NSArray *array0dialog =
			[NSArray arrayWithObjects:
			@"dialog-現在開始將進行片頭劇情。您可以選擇跳過，但是將會錯過重要的劇情與遊戲提示。請問您確定要跳過嗎？",
			 @"不，進行片頭劇情-1",
			 @"是，直接開始遊戲-end",
			 nil];
			NSArray *array1prologue =
			[NSArray arrayWithObjects:
			 @"story-face01001-scene_cinema-0-0",
			 @"2-0-0-Prologue 告白-0",
			 @"0-lt-0-那是壹次很普通的約會。-lt",
			 @"0-lt-0-相識多年的女孩祐莉，壹如往常的和我看電影。-lt",
			 @"0-lt-0-不過，就在道別時，她說了令我意想不到的話。-lt",
			 @"0-lt-0-這是，我倆新關系的開始……-lt",
			 @"1-0-祐莉-今天謝謝你陪我。今天這部電影真好看。-bgm009",
			 @"1-lt-我-倒是我才要謝謝妳呢。本來這部片想自己來看的呢！-lt",
			 @"1-lt-我-不過……沒想到，妳也會對這種陽剛的動作片有興趣啊？-lt",
			 @"1-face02002-祐莉-說得也是呢。不過，畢竟是大卡司的強片，我也會想看看啊！-lt",
			 @"1-lt-我-總之，今天謝謝妳陪我。下次……再一起去看電影吧！-lt",
			 @"1-lt-0-每一次想要約祐莉下次約會，總是這樣提心吊膽的。-lt",
			 @"1-lt-0-沒辦法，像祐莉這樣的美女，身邊總是有許多實力堅強的追求者呢。-lt",
			 @"1-face02007-祐莉-嗯……-lt",
			 @"1-lt-0-通常，祐莉總是會模稜兩可的說『看情況囉』含混地帶過。-lt",
			 @"1-lt-0-不過，今天，祐莉的神情看起來似乎不太一樣。-lt",
			 @"1-lt-我-怎麼啦？妳似乎有什麼心事是嗎？-lt",
			 @"1-face02006-祐莉-啊！？你……看得出來嗎？-lt",
			 @"1-face02010-我-這還用說！認識妳這麼久了，平常的妳總是會開心地跟我揮手說拜拜啊！-lt",
			 @"1-lt-我-今天是怎麼了？我好歹也是妳的好朋友，有什麼事要幫忙儘管說吧！-lt",
			 @"1-lt-0-是的，就像這樣，我對祐莉而言是個有難可以共苦的好朋友。-lt",
			 @"1-lt-0-不過…至於會不會有更進一步的發展呢？……答案不用說也知道。-lt",
			 @"1-lt-0-就像人家說的，我對她而言，就是個『好人』吧。-lt",
			 @"1-lt-0-我唯一能要求的，頂多只是像這樣不具任何意義的約會罷了。-lt",
			 @"1-face02007-祐莉-是啊……好朋友……嗎……-lt",
			 @"1-lt-我-當然啦！一切包在我身上！-lt",
			 @"1-face02007-祐莉-我說……平常你總是很樂意幫我任何事情。我想……這次有個大忙想請你幫忙……-lt",
			 @"1-lt-0-平常祐莉有任何想要我幫忙的事時，總是會用快讓我融化的語調請求我。-lt",
			 @"1-lt-0-光是這樣就足以讓我心甘情願為她赴湯蹈火。即使最後得到的，只有那甜到我心頭的笑容。-lt",
			 @"1-lt-0-現在聽到祐莉這樣語重心長地說，總覺得有什麼大事要發生。-lt",
			 @"1-face02008-祐莉-你住的地方……還有空的房間嗎？-lt",
			 @"1-lt-我-空的房間？呃……是有一間啦。怎麼？是妳的衣服太多，要我幫妳保管嗎？哈哈……-lt",
			 @"1-lt-0-我承認，剛剛的發言很遜。我總是這樣，在祐莉面前時，一旦心裡慌了，就會說出這種自以為風趣的冷笑話。-lt",
			 @"1-face02007-祐莉-我想……搬過去跟你一起住！-lt",
			 @"1-lt-我-哦，這樣啊。那當然是沒問題……咦！？-lt",
			 @"1-lt-0-平常我對她的請求總是二話不說地答應下來。但是，這次……我以為我聽錯了。-lt",
			 @"1-lt-我-跟……跟我一起住！？我……我沒聽錯吧？-lt",
			 @"1-face02010-祐莉-……是真的！-lt",
			 @"1-lt-我-這……不太好吧？我們又不是男女朋友，像這樣住在一起……-lt",
			 @"1-face02007-祐莉-所以…我想…我們可以不必再當普通朋友了。-lt",
			 @"1-lt-我-呃！？-lt",
			 @"1-face02008-祐莉-我想……我們是不是可以開始當……男女朋友？-lt",
			 @"1-lt-0-聽到她這麼說，一時之間我還真不敢相信。-lt",
			 @"1-lt-0-是啊！在我面前的，是從以前同班以來，就一直不乏追求者的女神．祐莉啊！-lt",
			 @"1-lt-0-不僅是已知的追求者，暗戀她的人更不勝枚舉。……是的，也包括我在內。-lt",
			 @"1-lt-我-哈…哈哈……，妳…妳這麼說……我還真不知道該怎麼辦……-lt",
			 @"1-lt-祐莉-我不是開玩笑的！只有你……不把我當成別人眼中，只靠金錢與外表來決定對象的膚淺女人……。-lt",
			 @"1-lt-0-聽祐莉這麼說，我能想像，即使像她這樣的女生，也會碰到許多愛情上的挫折。-lt",
			 @"1-lt-0-是的，我都知道。那些她交往過的男人，儘管再多金、帥氣，卻沒一個是真心疼惜祐莉的。-lt",
			 @"1-lt-我-不！當然不是！在我心中，妳一直是最耀眼的！只是……-lt",
			 @"1-lt-我-就因為妳太耀眼了……，光是能跟妳當普通朋友，我以為這樣就很好了！-lt",
			 @"1-lt-我-跟妳成為男女朋友，更是心中遙遠的夢想！……只是，一直當成夢想而已……-lt",
			 @"1-face02005-祐莉-因為…只有你，不會只把我當成想追求的女生，用最虛假的一面來對待我。-lt",
			 @"1-lt-祐莉-你總是在我最需要幫助的時候，不經意的陪伴我，甚至給我最需要的幫助！-lt",
			 @"1-lt-我-哈哈，我一直以為，你只是把我當成一個很好差遣的好人而已呢！-lt",
			 @"1-lt-祐莉-嗯嗯……，就是因為你太老實了，讓我到現在才發現你的好啊！-lt",
			 @"1-lt-我-祐莉……-lt",
			 @"1-face02008-祐莉-那麼…我可以從現在開始…用“達令”來稱呼你嗎？-lt",
			 @"1-lt-我-“達令”！？會不會有點怪怪的？又不是外國人……-lt",
			 @"1-face02002-祐莉-不會啊！因為，我小時候住國外時，大家都這樣叫的啊！-lt",
			 @"1-lt-0-對哦…我差點忘了。祐莉是從小就在國外長大，可說是家境優渥的千金小姐呢。-lt",
			 @"1-face02007-祐莉-反正，人家就是想這樣稱呼你嘛！-lt",
			 @"1-lt-我-這…這樣啊……那，只要妳喜歡就可以的……-lt",
			 @"1-face02003-祐莉-嘻嘻！那就這麼決定囉，達～令！-lt",
			 @"1-lt-我-……不過，馬上就說要搬來一起住，會不會太突然了？是不是有什麼……-lt",
			 @"1-face02007-祐莉-拜託你……就這件事……請你不要追究……好嗎？-lt",
			 @"1-lt-我-這……-lt",
			 @"1-lt-祐莉-還是說……你不想…跟我一起住？-lt",
			 @"1-lt-我-絕、絕對沒這回事！我……我很樂意！-lt",
			 @"1-face02005-祐莉-這麼說你是答應了？　我的請求……-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0dialog, array1prologue, nil];
		}
		default:
			return [NSArray array];
	}
}

+(UIImage*)getImageByColor:(UIColor*)aColor
{
	CGSize as = CGSizeMake(1, 1);
	UIImage *img = nil;
	CGRect rect = CGRectMake(0, 0, as.width, as.height);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context,
																 aColor.CGColor);
	CGContextFillRect(context, rect);
	img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return img;
}

+ (NSString *)defaultViewControllerWithNibName:(NSString *)nibNameOrNil
{
	if (KDeviceHeight==480) {
		//iphone 3G,4,4s
		return [NSString stringWithFormat:@"%@_4",nibNameOrNil];
	}
	return nibNameOrNil;
}

+(float)DeviceVersion
{
	return [[UIDevice currentDevice].systemVersion doubleValue];
}

+(UIImage *)grayImage:(UIImage *)sourceImage
{
	int bitmapInfo = kCGImageAlphaNone;
	int width = sourceImage.size.width;
	int height = sourceImage.size.height;
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	CGContextRef context = CGBitmapContextCreate (nil,
																								width,
																								height,
																								8,      // bits per component
																								0,
																								colorSpace,
																								bitmapInfo);
	CGColorSpaceRelease(colorSpace);
	if (context == NULL) {
		return nil;
	}
	CGContextDrawImage(context,
										 CGRectMake(0, 0, width, height), sourceImage.CGImage);
	UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
	CGContextRelease(context);
	return grayImage;
}

+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
	UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
	[image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
	UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return reSizeImage;
	
}

+(UIImage *)cropSquareImage:(UIImage *)image {
	CGFloat width = image.size.width;
	CGFloat height = image.size.height;
	CGFloat edge = MIN(width, height);
	CGRect rect = CGRectMake((edge-width)/2,(edge-height)/2, width,height);
	UIGraphicsBeginImageContext(CGSizeMake(edge, edge));
	[image drawInRect:rect];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return  newImage;
}

+(UIImage *)rotateImage:(UIImage *)aImage
{
	CGImageRef imgRef = aImage.CGImage;
	CGFloat width = CGImageGetWidth(imgRef);
	CGFloat height = CGImageGetHeight(imgRef);
	CGAffineTransform transform = CGAffineTransformIdentity;
	CGRect bounds = CGRectMake(0, 0, width, height);
	CGFloat scaleRatio = 1;
	CGFloat boundHeight;
	UIImageOrientation orient = aImage.imageOrientation;
	
	switch(orient)
	{
		case UIImageOrientationUp: //EXIF = 1
			transform = CGAffineTransformIdentity;
			break;
		case UIImageOrientationUpMirrored: //EXIF = 2
			transform = CGAffineTransformMakeTranslation(width, 0.0);
			transform = CGAffineTransformScale(transform, -1.0, 1.0);
			break;
		case UIImageOrientationDown: //EXIF = 3
			transform = CGAffineTransformMakeTranslation(width, height);
			transform = CGAffineTransformRotate(transform, M_PI);
			break;
		case UIImageOrientationDownMirrored: //EXIF = 4
			transform = CGAffineTransformMakeTranslation(0.0, height);
			transform = CGAffineTransformScale(transform, 1.0, -1.0);
			break;
		case UIImageOrientationLeftMirrored: //EXIF = 5
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeTranslation(height, width);
			transform = CGAffineTransformScale(transform, -1.0, 1.0);
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
			break;
		case UIImageOrientationLeft: //EXIF = 6
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeTranslation(0.0, width);
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
			break;
		case UIImageOrientationRightMirrored: //EXIF = 7
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeScale(-1.0, 1.0);
			transform = CGAffineTransformRotate(transform, M_PI / 2.0);
			break;
		case UIImageOrientationRight: //EXIF = 8
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeTranslation(height, 0.0);
			transform = CGAffineTransformRotate(transform, M_PI / 2.0);
			break;
		default:
			[NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
	}
	UIGraphicsBeginImageContext(bounds.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
		CGContextScaleCTM(context, -scaleRatio, scaleRatio);
		CGContextTranslateCTM(context, -height, 0);
	}
	else {
		CGContextScaleCTM(context, scaleRatio, -scaleRatio);
		CGContextTranslateCTM(context, 0, -height);
	}
	CGContextConcatCTM(context, transform);
	CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
	UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return imageCopy;
}

+(BOOL)isTheStr:(NSString *)aStr hasContainTheSubStr:(NSString *)bStr
{
	NSRange range=[aStr rangeOfString:bStr];
	return range.location != NSNotFound;
}

+(float)computeFloat:(float)f modulo:(float)m {
	float result = f - floor((f)/m)*m;
	if (result>m-0.2) result = 0;
	if (result<0) result = 0;
	return result;
}

@end
