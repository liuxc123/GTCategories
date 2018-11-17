//
//  NSData+GTPCM.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
/*

 AudioStreamBasicDescription _format;
 _format.mFormatID = kAudioFormatLinearPCM;
 _format.mFormatFlags = kLinearPCMFormatFlagIsSignedInteger | kLinearPCMFormatFlagIsPacked;
 _format.mBitsPerChannel = 16;
 _format.mChannelsPerFrame = 1;
 _format.mBytesPerPacket = _format.mBytesPerFrame = (_format.mBitsPerChannel / 8) * _format.mChannelsPerFrame;
 _format.mFramesPerPacket = 1;
 _format.mSampleRate = 8000.0f;
 */

@interface NSData (GTPCM)
//self   raw audio data

/**
 *  format wav data
 *
 *  @param PCMFormat format of pcm
 *
 *  @return wav data
 */
- (NSData *)gt_wavDataWithPCMFormat:(AudioStreamBasicDescription)PCMFormat;

@end
