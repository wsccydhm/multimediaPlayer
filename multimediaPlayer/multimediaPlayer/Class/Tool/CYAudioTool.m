//
//  CYAudioTool.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/27.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYAudioTool.h"
#import <AVFoundation/AVFoundation.h>
static CYAudioTool *_audioTool = nil;
@interface CYAudioTool ()
@property (strong, nonatomic) AVPlayer  *player;
@end

@implementation CYAudioTool

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _audioTool = [[CYAudioTool alloc] init];
    });
    return _audioTool;
}

- (instancetype)init{
    if(self = [super init]){
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
        [audioSession setActive:YES error:nil];
    }
    return self;
}
#pragma mark - Action by ccy
- (void)playWithIsLocal:(BOOL)isLocal {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"xcc.mp3" ofType:nil];
    [self playMuiscWithUrl:[NSURL fileURLWithPath:filePath]];
}

- (void)pause {
    [self.player pause];
}

- (void)playMuiscWithUrl:(NSURL *)url {
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:item];
    [self.player play];
}



#pragma mark - GetSet by ccy

- (AVPlayer *)player {
    if (_player == nil) {
        _player = [[AVPlayer alloc] init];
        __weak typeof(self) weakSelf = self;
        [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
//            NSLog(@"%@,%lf",[NSThread currentThread],CMTimeGetSeconds(weakSelf.player.currentItem.currentTime));
            if ([weakSelf.delegate respondsToSelector:@selector(audioTool:CurrentTime:AndTotalTime:)]) {
                [weakSelf.delegate audioTool:weakSelf CurrentTime:CMTimeGetSeconds(weakSelf.player.currentItem.currentTime) AndTotalTime:CMTimeGetSeconds(weakSelf.player.currentItem.duration)];
            }
        }];
    }
    return _player;
}

@end
