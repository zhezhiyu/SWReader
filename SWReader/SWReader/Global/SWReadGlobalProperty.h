//
//  SWReadGlobalProperty.h
//  SWReader
//
//  Created by Shadow. G on 2018/10/9.
//  Copyright © 2018年 Shadow. G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// MARK: 屏幕属性

/// 屏幕宽度
#define SWScreenWidth [UIScreen mainScreen].bounds.size.width

/// 屏幕高度
#define SWScreenHeight [UIScreen mainScreen].bounds.size.height

/// 是否是iPhone
#define SWIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/// iPhone X
#define SWIsIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/// 是否有顶部刘海
#define SWIsHaveBangs ([[UIApplication sharedApplication] statusBarFrame].size.height>20 ? YES : NO)

/// 状态栏的高度
#define SWStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

/// 导航栏高度(包括状态栏)
#define SWNaviBarHeight (statusBarHeight + 44)

/// tabBar高度
#define SWTabbarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

/// 按iPhone6屏幕比例设置字体大小
#define SWText_Font(font) (font * ([UIScreen mainScreen].bounds.size.width / 375.0))

/// 尺寸计算 以iPhone6为比例
#define SWSCALE_HEIGHT(height)        (height * (kScreenHeight / 667.0))

#define SWSCALE_WIDTH(width)          (width * (kScreenWidth / 375.0))

#define SWLineHeight                  (1.0 / [UIScreen mainScreen].scale)

/// RGBColor
#define SWRGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

/// RGBAColor
#define SWRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

NS_ASSUME_NONNULL_BEGIN

@interface SWReadGlobalProperty : NSObject

// MARK: 全局属性

/// 段落头部双圆角空格
UIKIT_EXTERN NSString *const SWParagraphHeaderSpace;

// MAKR: -- 间距支持
UIKIT_EXTERN CGFloat const SWSpace_1;
UIKIT_EXTERN CGFloat const SWSpace_5;
UIKIT_EXTERN CGFloat const SWSpace_10;
UIKIT_EXTERN CGFloat const SWSpace_15;
UIKIT_EXTERN CGFloat const SWSpace_20;
UIKIT_EXTERN CGFloat const SWSpace_25;
UIKIT_EXTERN CGFloat const SWReadViewTopSpace;
UIKIT_EXTERN CGFloat const SWReadViewBottomSpace;
UIKIT_EXTERN CGFloat const SWReadViewLeftSpace;
UIKIT_EXTERN CGFloat const SWReadViewRightSpace;
UIKIT_EXTERN CGFloat const SWBottomStatusHeight;

// MARK: 拖拽触发光标范围
UIKIT_EXTERN CGFloat const SWCursorOffset;

// MARK: -- Key

/// 是夜间还是日间模式  true: 夜间  false:日间
UIKIT_EXTERN NSString *const ReadKey_IsNightOrDay;

/// ReadView 手势开启状态
UIKIT_EXTERN NSString *const ReadKey_Ges_isOpen;

// MARK: 通知名称

/// ReadView 手势状态通知
UIKIT_EXTERN NSString *const ReadNotificationName_ReadView_Ges;


@end

NS_ASSUME_NONNULL_END
