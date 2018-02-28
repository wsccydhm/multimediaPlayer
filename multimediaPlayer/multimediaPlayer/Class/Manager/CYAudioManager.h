//
//  CYAudioManager.h
//  multimediaPlayer
//
//  Created by ccy on 2018/2/27.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CYAudioManager;
@protocol CYAudioManagerDelegate <NSObject>

- (void)audioManager:(CYAudioManager *)audioManager CurrentTime:(double)currentTime AndTotalTime:(double)totalTime;

@end

@interface CYAudioManager : NSObject

@property (weak, nonatomic) id<CYAudioManagerDelegate> delegate;

+ (instancetype)sharedManger;
- (void)play;
- (void)pause;
- (BOOL)isPaly;

@end
