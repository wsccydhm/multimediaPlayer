//
//  CYAudioPlayViewController.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/26.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYAudioPlayViewController.h"

@interface CYAudioPlayViewController ()
@property (weak, nonatomic) IBOutlet UISlider    *broadcastPaceSlider;
@property (weak, nonatomic) IBOutlet UIImageView *needleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *diskImageView;
@property (weak, nonatomic) IBOutlet UIImageView *placeholderImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *waitActivity;
@property (assign, nonatomic) BOOL isPlay;
@end

@implementation CYAudioPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - Action by ccy

- (IBAction)playOrPauseAction:(UIButton *)sender {
    self.isPlay     = !self.isPlay;
    sender.selected = self.isPlay;
}

#pragma mark - Private methods by ccy

- (void)needleAnimationWithIsPlay:(BOOL)isPlay {
    [UIView animateWithDuration:0.5 animations:^{
        CGAffineTransform transform    = isPlay ? CGAffineTransformIdentity : CGAffineTransformMakeRotation(-M_PI_4);
        self.needleImageView.transform = transform;
    }];
}

- (void)diskAnimationWithIsPlay:(BOOL)isPlay {
    if (isPlay) {
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue  = @(M_PI *2);
        rotationAnimation.duration = 3;
        rotationAnimation.repeatCount = MAXFLOAT;
        rotationAnimation.autoreverses = NO;
        rotationAnimation.fillMode = kCAFillModeForwards;
        [self.placeholderImageView.layer addAnimation:rotationAnimation forKey:@"cc"];
    } else {
        
    }
}

- (void)prepareUI {
    [self.placeholderImageView setupCornerWithRadius:self.placeholderImageView.frame.size.width / 2 + 18];
    [self.broadcastPaceSlider setThumbImage:[UIImage originImage:[UIImage imageNamed:@"cat"] scaleToSize:CGSizeMake(30, 30)] forState:UIControlStateNormal];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.needleImageView.layer.anchorPoint = CGPointMake(0.12, 0.17);
    self.needleImageView.layer.position    = CGPointMake(KScreenW / 2 , -5);
    self.needleImageView.transform         = CGAffineTransformMakeRotation(-M_PI_4);

}

#pragma mark - SetGet by ccy
- (void)setIsPlay:(BOOL)isPlay {
    _isPlay = isPlay;
    [self needleAnimationWithIsPlay:_isPlay];
    [self diskAnimationWithIsPlay:_isPlay];
}

@end
