//
//  QHDDContextWhitelistFilterLogFormatter.m
//  QHDDLogDemo
//
//  Created by Anakin chen on 2017/9/29.
//  Copyright © 2017年 AnakinChen Network Technology. All rights reserved.
//

#import "QHDDContextWhitelistFilterLogFormatter.h"

#define DATEFORMAT @"yyyy-MM-dd HH:mm:ss:SSS"

@interface QHDDContextWhitelistFilterLogFormatter()

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation QHDDContextWhitelistFilterLogFormatter

- (void)dealloc
{
    _dateFormatter = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4]; // 10.4+ style
        [self.dateFormatter setDateFormat:DATEFORMAT];
    }
    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    if ([self isOnWhitelist:logMessage->_context]) {
        NSString *dateAndTime = [self.dateFormatter stringFromDate:(logMessage->_timestamp)];
        return [NSString stringWithFormat:@"%@ %@", dateAndTime, logMessage->_message];
    }
    else {
        return nil;
    }
}

@end
