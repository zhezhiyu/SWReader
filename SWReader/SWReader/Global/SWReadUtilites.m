//
//  SWReadUtilites.m
//  SWReader
//
//  Created by Shadow. G on 2018/10/9.
//  Copyright © 2018年 Shadow. G. All rights reserved.
//

#import "SWReadUtilites.h"


@implementation SWReadUtilites

// MARK: 共用
/// 章节内用标题
+ (NSString *)chapterContentTitle:(NSString *)name
{
    return [NSString stringWithFormat:@"\n%@\n\n", name];
}

// MAKR: 截屏
/// 获得截屏视图（无值获取当前Window）
+(UIImage *)screenCapture:(UIView *)view isSave:(BOOL)isSave
{
    UIView *captureView = view;
    if (!captureView) {
        captureView = [UIApplication sharedApplication].keyWindow ?: [UIApplication sharedApplication].windows.firstObject;
    }
    
    UIGraphicsBeginImageContextWithOptions(captureView.frame.size, false, 0.0);
    
    [captureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    if (isSave && image) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    return image;
}

// MARK: 创建分割线
/// 给一个视图创建一条分割线
+ (UIView *)spaceLineSetupWithColor:(UIColor *)color frame:(CGRect)frame
{
    UIView *spaceLine = [[UIView alloc] init];
    
    spaceLine.backgroundColor = color != nil ? color : [UIColor lightGrayColor];
    
    spaceLine.frame = frame;
    
    return spaceLine;
}
@end
