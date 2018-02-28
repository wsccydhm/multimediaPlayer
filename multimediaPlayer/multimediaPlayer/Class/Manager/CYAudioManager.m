
//
//  CYAudioManager.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/27.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYAudioManager.h"
#import "CYAudioTool.h"
static CYAudioManager *_manager = nil;
@interface CYAudioManager () <CYAudioDelegate>
@property (weak, nonatomic)   NSTimer   *timer;
@property (assign, nonatomic) NSInteger listenDuration;
@property (assign, nonatomic) BOOL playOrPasue;
@property (strong, nonatomic) CYAudioTool *audioTool;
@end

@implementation CYAudioManager

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[CYAudioManager alloc] init];
    });
    return _manager;
}

#pragma mark - CYAudioDelegate  by ccy

- (void)audioTool:(CYAudioTool *)audioTool CurrentTime:(double)currentTime AndTotalTime:(double)totalTime {
    if ([self.delegate respondsToSelector:@selector(audioManager:CurrentTime:AndTotalTime:)]) {
        [self.delegate audioManager:self CurrentTime:currentTime AndTotalTime:totalTime];
    }
}

#pragma mark - Action by ccy
- (void)timeFire {
    self.listenDuration ++;
//    NSLog(@"%ld",self.listenDuration);
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"listenDuration" object:[NSNumber numberWithInt:(int)self.listenDuration]];
}

#pragma mark - public method by ccy
- (void)play {
    self.playOrPasue            = YES;
    self.audioTool              = [CYAudioTool sharedInstance];
    self.audioTool.delegate     = self;
    [[CYAudioTool sharedInstance] playWithIsLocal:YES];
    [self.timer setFireDate:[NSDate date]];
}
- (void)pause {
    [[CYAudioTool sharedInstance] pause];
    [self.timer setFireDate:[NSDate distantFuture]];
}

#pragma mark - setget by ccy
- (NSTimer *)timer {
    if (_timer == nil) {
        _timer             = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
        [_timer setFireDate:[NSDate distantFuture]];
    }
    return _timer;
}

- (BOOL)isPaly {
    return self.playOrPasue;
}

- (void)moveTimer {
    [self.timer invalidate];
    self.timer = nil;
}

@end
