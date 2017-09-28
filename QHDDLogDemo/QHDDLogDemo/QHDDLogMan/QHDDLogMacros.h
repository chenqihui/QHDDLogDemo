//
//  QHDDLogMacros.h
//  QHDDLogDemo
//
//  Created by Anakin chen on 2017/9/29.
//  Copyright © 2017年 AnakinChen Network Technology. All rights reserved.
//

#import <CocoaLumberjack/DDLogMacros.h>

#ifndef QHDDLogMacros_h
#define QHDDLogMacros_h

/**
 创建其他文件夹的日志
 
 #define <#QHDD_LOG_CONTEXT#> <#flag#>
 
 #define QHDDLogInfo(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, <#日志级别(QHDDLogFlagInfo)#>, <#QHDD_LOG_CONTEXT#>, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
 **/

#define QHDD_LOG_CONTEXT 1044

#define QHDD_APP_LOG_CONTEXT QHDD_LOG_CONTEXT + 4

#define QHDDLogFlagInfo     (1 << 5)

//QHDD_LOG_CONTEXT
#define QHDDLogInfo(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogLevelInfo, QHDD_LOG_CONTEXT, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
//QHDD_APP_LOG_CONTEXT
#define QHDDAppLogInfo(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogLevelInfo, QHDD_APP_LOG_CONTEXT, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#endif /* QHDDLogMacros_h */
