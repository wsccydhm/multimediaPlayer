//
//  CYAudioToolView.m
//  multimediaPlayer
//
//  Created by ccy on 2018/2/28.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import "CYAudioToolView.h"

@interface CYAudioToolView()
@property (weak, nonatomic) IBOutlet UILabel     *beginLabel;
@property (weak, nonatomic) IBOutlet UISlider    *broadcastPaceSlider;
@property (weak, nonatomic) IBOutlet UILabel     *endLabel;
@property (weak, nonatomic) IBOutlet UIButton    *playButton;
@property (weak, nonatomic) IBOutlet UILabel    *tempLabel;
@end

@implementation CYAudioToolView

-(instancetype)init{
    if(self = [super init]){
    [self.broadcastPaceSlider setThumbImage:[UIImage originImage:[UIImage imageNamed:@"cat"] scaleToSize:CGSizeMake(30, 30)] forState:UIControlStateNormal];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.broadcastPaceSlider setThumbImage:[UIImage originImage:[UIImage imageNamed:@"cat"] scaleToSize:CGSizeMake(30, 30)] forState:UIControlStateNormal];
}

- (void)setCurrentTime:(NSString *)currentTime {
    _currentTime = currentTime;
    self.beginLabel.text = _currentTime;
}

- (void)setTotalTime:(NSString *)totalTime {
    _totalTime = totalTime;
    self.endLabel.text = _totalTime;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.broadcastPaceSlider.value = progress;
}

- (void)setIsPlay:(BOOL)isPlay {
    _isPlay = isPlay;
    self.playButton.selected = _isPlay;
}

@end
