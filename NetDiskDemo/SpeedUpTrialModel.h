//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <netdisk-business/ALModel.h>

@class NSString, SpeedUpTrialPromptContext;

@interface SpeedUpTrialModel : ALModel
{
    BOOL _couldExperience;
    long long _remainsCount;
    long long _increaseType;
    long long _duration;
    SpeedUpTrialPromptContext *_buttonInfo;
    NSString *_token;
    long long _timestamp;
}

+ (id)modelContainerPropertyGenericClass;
+ (id)modelCustomPropertyMapper;
@property(nonatomic) long long timestamp; // @synthesize timestamp=_timestamp;
@property(copy, nonatomic) NSString *token; // @synthesize token=_token;
@property(retain, nonatomic) SpeedUpTrialPromptContext *buttonInfo; // @synthesize buttonInfo=_buttonInfo;
@property(nonatomic) long long duration; // @synthesize duration=_duration;
@property(nonatomic) long long increaseType; // @synthesize increaseType=_increaseType;
@property(nonatomic) long long remainsCount; // @synthesize remainsCount=_remainsCount;
@property(nonatomic) BOOL couldExperience; // @synthesize couldExperience=_couldExperience;
- (void).cxx_destruct;

@end
