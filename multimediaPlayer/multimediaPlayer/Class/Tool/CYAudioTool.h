//
//  CYAudioTool.h
//  multimediaPlayer
//
//  Created by ccy on 2018/2/27.
//  Copyright © 2018年 ccy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CYAudioTool;
@protocol CYAudioDelegate <NSObject>

- (void)audioTool:(CYAudioTool *)audioTool CurrentTime:(double)currentTime AndTotalTime:(double)totalTime;

@end

@interface CYAudioTool : NSObject

@property (weak, nonatomic) id<CYAudioDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)playWithIsLocal:(BOOL)isLocal;
- (void)pause;
@end
