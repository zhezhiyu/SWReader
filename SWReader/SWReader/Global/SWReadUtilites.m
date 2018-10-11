//
//  SWReadUtilites.m
//  SWReader
//
//  Created by Shadow. G on 2018/10/9.
//  Copyright © 2018年 Shadow. G. All rights reserved.
//

#import "SWReadUtilites.h"
#import "SWReadGlobalProperty.h"

/// 主文件夹名称
NSString *const ReadFolderName = @"SWBookRead";

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

// MARK: 阅读ViewFrame
/// 阅读TableView的位置
+ (CGRect)getReadTableViewFrame
{
    CGFloat y = SWReadViewTopSpace;
    
    CGFloat bottomHeight = SWReadViewBottomSpace + SWBottomStatusHeight;
    
    if (SWIsHaveBangs) {
        
        y = SWStatusBarHeight + SWReadViewTopSpace;

    }
    
    return CGRectMake(SWReadViewLeftSpace, y, SWScreenWidth - SWReadViewLeftSpace - SWReadViewRightSpace, SWScreenHeight - y - bottomHeight);
}

/* 阅读视图位置
 
 需要做横竖屏的可以在这里修改阅读View的大小
 
 getReadViewFrame 会使用与 阅读View的Frame 以及计算分页的范围
 
 */
+ (CGRect)getReadViewFrame
{
    return CGRectMake(0, 0, [self getReadTableViewFrame].size.width, [self getReadTableViewFrame].size.height);
}

// MARK: -- 创建文件夹
/// 创建文件夹 如果存在则不创建
+ (BOOL)createFilePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]) {
        
        return YES;
        
    }
    
    @try {
        
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
        
        return YES;
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    return NO;
}

/// 文件类型
+ (NSString *)getFileExtension:(NSURL *)url
{
    return url.path.pathExtension;
}

/// 文件名称
+ (NSString *)getFileName:(NSURL *)url
{
    return url.path.lastPathComponent.stringByDeletingPathExtension;
}

// MAKR: 阅读页面获取文件方法

/// 归档阅读文件
+ (BOOL)readKeyedArchiverWithFolderName:(NSString *)folderName fileName:(NSString *)fileName object:(id)object
{
    NSString *path = [NSString stringWithFormat:@"%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject];
    path = [path stringByAppendingPathComponent:ReadFolderName];
    path = [path stringByAppendingPathComponent:folderName];
    
    if ([self createFilePath:path]) {
        
        path = [path stringByAppendingPathComponent:fileName];
        
        return [NSKeyedArchiver archiveRootObject:object toFile:path];
    }
    
    return NO;
}

/// 解档阅读文件
+ (id)readKeyedUnarchiverWithFolderName:(NSString *)folderName fileName:(NSString *)fileName
{
    NSString *path = [NSString stringWithFormat:@"%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject];
    path = [path stringByAppendingPathComponent:ReadFolderName];
    path = [path stringByAppendingPathComponent:folderName];
    path = [path stringByAppendingPathComponent:fileName];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

/// 删除阅读归档文件
+ (BOOL)readKeyedRemoveArchiverWithFolderName:(NSString *)folderName fileName:(NSString *)fileName
{
    NSString *path = [NSString stringWithFormat:@"%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject];
    path = [path stringByAppendingPathComponent:ReadFolderName];
    path = [path stringByAppendingPathComponent:folderName];
    
    if (fileName) {
        path = [path stringByAppendingString:fileName];
    }
    
    @try {
        
        NSError *error = nil;
        
        [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        
        if (error) {
            return NO;
            NSLog(@"删除--%@失败 %@", path, error.description);
        }
        
        return YES;
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    return NO;
}

/// 归档文件是否存在
+ (BOOL)readKeyedIsExistArchiverWithFolderName:(NSString *)folderName fileName:(NSString *)fileName
{
    NSString *path = [NSString stringWithFormat:@"%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject];
    path = [path stringByAppendingPathComponent:ReadFolderName];
    path = [path stringByAppendingPathComponent:folderName];
    
    if (fileName) {
        path = [path stringByAppendingString:fileName];
    }
    
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
    
}
























@end
