//
//  SWReadUtilites.h
//  SWReader
//
//  Created by Shadow. G on 2018/10/9.
//  Copyright © 2018年 Shadow. G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface SWReadUtilites : NSObject

// MARK: 共用
/// 章节内用标题
+ (NSString *)chapterContentTitle:(NSString *)name;

// MAKR: 截屏
/// 获得截屏视图（无值获取当前Window）
+ (UIImage *)screenCapture:(UIView *)view isSave:(BOOL)isSave;

// MARK: 创建分割线
/// 给一个视图创建一条分割线
+ (UIView *)spaceLineSetupWithColor:(UIColor *)color frame:(CGRect)frame;

// MARK: 阅读ViewFrame
/// 阅读TableView的位置
+ (CGRect)getReadTableViewFrame;

/* 阅读视图位置
 
 需要做横竖屏的可以在这里修改阅读View的大小
 
 getReadViewFrame 会使用与 阅读View的Frame 以及计算分页的范围
 
 */
+ (CGRect)getReadViewFrame;

// MARK: -- 创建文件夹
/// 创建文件夹 如果存在则不创建
+ (BOOL)createFilePath:(NSString *)filePath;

@end

NS_ASSUME_NONNULL_END
