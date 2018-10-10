//
//  SWReadGlobalProperty.m
//  SWReader
//
//  Created by Shadow. G on 2018/10/9.
//  Copyright © 2018年 Shadow. G. All rights reserved.
//

#import "SWReadGlobalProperty.h"

@implementation SWReadGlobalProperty

/// 段落头部双圆角空格
NSString *const SWParagraphHeaderSpace = @"　　";

// MAKR: -- 间距支持
CGFloat const SWSpace_1 = 1;
CGFloat const SWSpace_5 = 5;
CGFloat const SWSpace_10 = 10;
CGFloat const SWSpace_15 = 15;
CGFloat const SWSpace_20 = 20;
CGFloat const SWSpace_25 = 25;

// MARK: 拖拽触发光标范围
CGFloat const SWCursorOffset = -SWSpace_20;

/// 是夜间还是日间模式  true: 夜间  false:日间
NSString *const ReadKey_IsNightOrDay = @"isNightOrDay";

/// ReadView 手势开启状态
NSString *const ReadKey_Ges_isOpen = @"ges_isOpen";

/// ReadView 手势状态通知
NSString *const ReadNotificationName_ReadView_Ges = @"ReadView_Ges";

@end
