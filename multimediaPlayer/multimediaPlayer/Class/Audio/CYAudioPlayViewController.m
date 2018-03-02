//
//  CYAudioPlayViewController.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/26.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYAudioPlayViewController.h"
#import "CYAudioManager.h"
#import "CYAudioToolView.h"
#import "CYLyricView.h"
@interface CYAudioPlayViewController () <CYAudioManagerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *needleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *diskImageView;
@property (weak, nonatomic) IBOutlet UIImageView *placeholderImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *waitActivity;
@property (weak, nonatomic) IBOutlet CYAudioToolView *audioToolView;
@property (weak, nonatomic) IBOutlet CYLyricView *lyricView;
@property (strong, nonatomic) CYAudioManager         *audioManager;
@property (assign, nonatomic) BOOL                   isPlay;


@property (weak, nonatomic) CADisplayLink *displayLink;
@property (assign, nonatomic) NSInteger listenTime;
@end

@implementation CYAudioPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
#pragma mark - CYAudioManagerDelegate by ccy
- (void)audioManager:(CYAudioManager *)audioManager CurrentTime:(double)currentTime AndTotalTime:(double)totalTime {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.audioToolView.currentTime = [self timeToString:(int)currentTime];
        self.audioToolView.progress = currentTime / totalTime;
        self.audioToolView.totalTime = [self timeToString:(int)totalTime];
//        self.tempLabel.text = [self timeToString:(int)currentTime];
    });
}


#pragma mark - Action by ccy

- (IBAction)playOrPauseAction:(UIButton *)sender {
    self.isPlay     = !self.isPlay;
}

#pragma mark - Private methods by ccy

- (void)needleAnimationWithIsPlay:(BOOL)isPlay {
    CGAffineTransform transform    = isPlay ? CGAffineTransformIdentity : CGAffineTransformMakeRotation(-0.5f);
    [UIView animateWithDuration:0.2 animations:^{
        self.needleImageView.transform = transform;
    }];
}

- (void)diskAnimationWithIsPlay:(BOOL)isPlay {
    if (isPlay) {
        CFTimeInterval pauseTime = self.placeholderImageView.layer.timeOffset;
        CFTimeInterval begin = CACurrentMediaTime() - pauseTime;
        [self.placeholderImageView.layer setTimeOffset:0];
        [self.placeholderImageView.layer setBeginTime:begin];
        self.placeholderImageView.layer.speed = 1;
    } else {
        CFTimeInterval pauseTime                   = [self.placeholderImageView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        self.placeholderImageView.layer.timeOffset = pauseTime;
        self.placeholderImageView.layer.speed = 0;
    }
}

- (void)prepareUI {
    [self.placeholderImageView setupCornerWithRadius:self.placeholderImageView.frame.size.width / 2 + 18];
    [self createAnimation];
    self.audioManager                = [CYAudioManager sharedManger];
    self.audioManager.delegate       = self;
    self.needleImageView.transform   = CGAffineTransformMakeRotation(-M_PI_4);
}

- (void)createAnimation {
    CABasicAnimation *rotationAnimation   = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue             = @(M_PI *2);
    rotationAnimation.duration            = 3;
    rotationAnimation.repeatCount         = MAXFLOAT;
    rotationAnimation.autoreverses        = NO;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode            = kCAFillModeForwards;
    [self.placeholderImageView.layer addAnimation:rotationAnimation forKey:@"cc"];
    self.placeholderImageView.layer.speed = 0;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.needleImageView.layer.anchorPoint = CGPointMake(0.12, 0.17);
    self.needleImageView.layer.position    = CGPointMake(KScreenW / 2 , -5);
}

- (NSString *)timeToString:(NSInteger )time {
    NSInteger hour   = time / 3600;
    NSInteger minute = time % 3600 / 60;
    NSInteger second = time % 60;
    return hour > 0 ? [NSString stringWithFormat:@"%02ld:%02ld:%02ld",hour,minute,second] : [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}


#pragma mark - SetGet by ccy
- (void)setIsPlay:(BOOL)isPlay {
    _isPlay = isPlay;
    self.audioToolView.isPlay = _isPlay;
    [self diskAnimationWithIsPlay:_isPlay];
    [self needleAnimationWithIsPlay:_isPlay];
    if (_isPlay) {
        [self.audioManager play];
    } else {
        [self.audioManager pause];
    }
    
}


@end
