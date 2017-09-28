//
//  QHDDLogManager.h
//  QHDDLogDemo
//
//  Created by Anakin chen on 2017/9/29.
//  Copyright © 2017年 AnakinChen Network Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

#import "QHDDLogMacros.h"
#import "QHDDContextWhitelistFilterLogFormatter.h"

/*
 定义日志级别，也可以自定义，如:QHDDLogFlagInfo，但只有被定义的才能打印和写入文本
 */
static const int ddLogLevel = DDLogLevelInfo;

@interface QHDDLogManager : NSObject

/**
 获取对应标识的日志路径，可供获取文件和清除

 @param flag 日志标识
 @return 日志路径
 */
+ (NSString *)logPath:(NSInteger)flag;


/**
 添加DDLog

 @param flag 日志标识
 @param block 设置DDFileLogger
 */
+ (void)addLogger:(NSInteger)flag fileLogger:(void(^)(DDFileLogger *fileLogger))block;

@end
