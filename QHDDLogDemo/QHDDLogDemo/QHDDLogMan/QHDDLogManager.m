//
//  QHDDLogManager.m
//  QHDDLogDemo
//
//  Created by Anakin chen on 2017/9/29.
//  Copyright © 2017年 AnakinChen Network Technology. All rights reserved.
//

#import "QHDDLogManager.h"

#import "QHDDContextWhitelistFilterLogFormatter.h"

@implementation QHDDLogManager

+ (NSString *)logPath:(NSInteger)flag {
    NSString *logPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/qhLogs/%ld", (long)flag]];
    return logPath;
}

+ (void)addLogger:(NSInteger)flag fileLogger:(void(^)(DDFileLogger *fileLogger))block {
    DDLogFileManagerDefault *logFileManager = [[DDLogFileManagerDefault alloc] initWithLogsDirectory:[self logPath:flag]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
    
    if (block != nil) {
        block(fileLogger);
    }
    
    QHDDContextWhitelistFilterLogFormatter *filterLogFormatter = [[QHDDContextWhitelistFilterLogFormatter alloc] init];
    [filterLogFormatter addToWhitelist:flag];
    [fileLogger setLogFormatter:filterLogFormatter];
    
    [DDLog addLogger:fileLogger];
}

@end
