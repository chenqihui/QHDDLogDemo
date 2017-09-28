//
//  QHTableSubViewController.m
//  QHTableViewDemo
//
//  Created by chen on 17/3/21.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "QHTableSubViewController.h"

#import "QHDDLogMacros.h"
#import "QHDDLogManager.h"

@interface QHTableSubViewController ()

@end

@implementation QHTableSubViewController

- (void)dealloc {
#if DEBUG
    NSLog(@"%s", __FUNCTION__);
#endif
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self p_initDDLog];
    [self p_logAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private

- (void)p_initDDLog {
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];// 启用颜色区分
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor grayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:nil forFlag:DDLogFlagDebug];
    
    DDLogError(@"DDLogError");      // red
    DDLogWarn(@"DDLogWarn");        // orange
    DDLogDebug(@"DDLogDebug");      // green
    DDLogInfo(@"DDLogInfo");        // pink
    DDLogVerbose(@"DDLogVerbose");  // gray
    
    NSLog(@"%@", fileLogger.currentLogFileInfo.filePath);
}

- (void)p_logAction {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    [QHDDLogManager addLogger:QHDD_LOG_CONTEXT fileLogger:nil];
    [QHDDLogManager addLogger:QHDD_APP_LOG_CONTEXT fileLogger:^(DDFileLogger *fileLogger) {
        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    }];
    
    QHDDLogInfo(@"QHDDLogInfo");
    QHDDAppLogInfo(@"QHDDAppLogInfo--%@", @"hello world");
}

#pragma mark - Public


#pragma mark - <#SystemDelegate#>


#pragma mark - <#CustomDelegate#>


#pragma mark - Util


#pragma mark - Action


#pragma mark - Get



@end
