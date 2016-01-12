/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

#import "shieldingad.h"


//优酷-----------------------------------------------------------------

%hook YTEngineAdPlayer

- (void)playWithScheme:(unsigned long long)arg1 playerItem:(id)arg2 preAdItems:(id)arg3 quality:(long long)arg4 language:(_Bool)arg5
{
arg3 = nil; //仅仅这么一句就够了 哈哈哈
%orig;


/*
[arg3 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
NSLog(@" ------- %@\n  %@  %@  %@  %@", [obj valueForKey:@"mAdDuration"], [obj valueForKey:@"mStatus"], [obj valueForKey:@"mClickUrl"], [obj valueForKey:@"mEmDictionary"], [obj valueForKey:@"mSusArray"]);


[obj setValue:@"0" forKey:@"mAdDuration"];
NSLog(@"===%@", [obj valueForKey:@"mAdDuration"]);

}];


%orig;
NSLog(@"--0--- %@  %lld  %@ %@ %lld", NSStringFromSelector(_cmd), arg1, arg2, arg3, arg4);

NSLog(@"%@--%@--%@--%@", [arg2 valueForKey:@"mTotalSeconds"], [arg2 valueForKey:@"mStartTime"], [arg2 valueForKey:@"mSidDataDic"], [arg2 valueForKey:@"mVideoUrlsDic"]);

*/
}

%end



//爱奇艺-----------------------------------------------------------------


%hook pumaplayer
- (void)play
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@", NSStringFromSelector(_cmd));
}

- (void)start
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@", NSStringFromSelector(_cmd));
}
- (void)pause:(_Bool)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@", NSStringFromSelector(_cmd));
}
- (void)stop
{
%orig;
NSLog(@"--IQIYI-pumaplayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}

- (double)currentPlaybackTime
{
double value = %orig;
//NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@", NSStringFromSelector(_cmd));
return value;
}
- (double)playableDuration
{
double value = %orig;
//NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@", NSStringFromSelector(_cmd));
return value;
}
- (double)duration
{
double value = %orig;
//NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %f", NSStringFromSelector(_cmd), value);
return value;
}
- (id)addBoundaryTimeObserverForTimes:(id)arg1 queue:(struct dispatch_queue_s *)arg2 usingBlock:(int)arg3
{
id value = %orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@  %@", NSStringFromSelector(_cmd), self, value, arg1);
return value;
}
- (id)documentDirectory
{
id value = %orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, value);
return value;
}
- (double)adsLeftTime
{
double value = %orig;
//NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %f", NSStringFromSelector(_cmd), self, value);
return value;
}
- (void)seekToTime:(long long)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %lld", NSStringFromSelector(_cmd), self, arg1);
}
- (id)getVideoInfo
{
id value = %orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, value);
return value;
}
- (id)getMovieJSON
{
id value = %orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, value);
return value;
}
- (void)setNextMovie:(id)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), arg1);
}
- (void)prepareMovieWithExternInfo:(id)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), arg1);
}
- (void)prepareMovieWithString:(const char *)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, [NSString stringWithUTF8String:arg1]);
}
- (void)prepareMovie:(id)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), arg1);
}

- (void)excuteAdCommand:(int)arg1 withParam1:(void *)arg2 withParam2:(void *)arg3
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}

%end



%hook QYAVPlayerController
- (void)handlePlayTime
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}
- (void)handlePlayerTimerEvent
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}
- (void)openPlayerByQixiuUrl:(id)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, arg1);
}
- (void)openPlayerByItem:(id)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@  %@", NSStringFromSelector(_cmd), self, arg1, [self valueForKey:@"_adsManager"]);
}

- (void)showVideo:(id)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@  %@", NSStringFromSelector(_cmd), self, arg1, [self valueForKey:@"_adsManager"]);
}
- (void)open:(id)arg1
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@  %@", NSStringFromSelector(_cmd), self, arg1, [self valueForKey:@"_adsManager"]);
}
- (void)AdCreateWithId:(long long)arg1 URL:(id)arg2
{
%orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %lld  %@", NSStringFromSelector(_cmd), self, arg1, arg2);
}
%end



/*
%hook PumaPlayerViewController

- (void)play
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}

- (_Bool)isJailBreakJudge
{
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
return NO;
}
- (void)pumaStopLoad
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}
- (void)pumaStartLoad
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}
- (void)onPreloadAD
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}
- (void)createPlayerWithString:(id)arg1 pumaType:(int)arg2
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@  %d", NSStringFromSelector(_cmd), self, arg1, arg2);
}
- (void)playMovieWithStrData:(id)arg1 andAutoJump:(_Bool)arg2
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@  %d", NSStringFromSelector(_cmd), self, arg1, arg2);
}

- (double)adTotalTime
{
double value = %orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %f", NSStringFromSelector(_cmd), self, value);
return value;
}
- (double)adLeftTime
{
double value = %orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %f", NSStringFromSelector(_cmd), self, value);
return value;
}
- (double)playableDuration{
double value = %orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %f", NSStringFromSelector(_cmd), self, value);
return value;
}
- (double)duration
{
double value = %orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %f", NSStringFromSelector(_cmd), self, value);
return value;
}
- (double)currentPlaybackTime
{
double value = %orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %f", NSStringFromSelector(_cmd), self, value);
return value;
}

%end



%hook IOSPumaPlayer

- (void)play
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}

- (void)setNextMovie:(id)arg1
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, arg1);
}
- (void)prepareMovieWithExternInfo:(id)arg1
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, arg1);
}
- (void)prepareMovieWithString:(const char *)arg1
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, [NSString stringWithUTF8String:arg1]);
}
- (void)prepareMovie:(id)arg1
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), self, arg1);
}
- (void)seekToTime:(long long)arg1
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %lld", NSStringFromSelector(_cmd), self, arg1);
}
- (void)stopLoad
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}
- (void)startLoad
{
%orig;
NSLog(@"--IQIYI-IOSPumaPlayer-¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), self);
}

%end







%hook QYAVPlayAdsManager

- (id)getRenderBannerModel:(id)arg1
{
id value = %orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), value, arg1);
return value;
}
- (id)getRenderTicketModel:(id)arg1
{
id value = %orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %@", NSStringFromSelector(_cmd), value, arg1);
return value;
}
- (id)getCornerDataByTime:(int)arg1
{
id value = %orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@  %d", NSStringFromSelector(_cmd), value, arg1);
return value;
}
- (void)updateCornerAdsShowState:(_Bool)arg1 byStartTime:(int)arg2
{
%orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %d      %d", NSStringFromSelector(_cmd), arg1, arg2);
}
- (void)updateCornerAdsReqState:(_Bool)arg1 byStartTime:(int)arg2
{
%orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %d      %d", NSStringFromSelector(_cmd), arg1, arg2);
}
- (void)checkCornerAds:(double)arg1
{
%orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@        %f", NSStringFromSelector(_cmd), arg1);
}
- (void)updateRenderAdsItem:(id)arg1
{
%orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@ %@  %@", NSStringFromSelector(_cmd), arg1, self);
}
- (void)updatePauseAdsItem:(id)arg1
{
%orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), arg1);
}
- (void)updateCornerAdsItem:(id)arg1
{
%orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), arg1);
}
- (void)updateCornerAdsIndex:(id)arg1
{
%orig;
NSLog(@"--IQIYIOOOOOOOOOOOOOOOOOOOOO--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), arg1);
}
- (id)init
{
id value = %orig;
NSLog(@"--IQIYI--¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ %@  %@", NSStringFromSelector(_cmd), value);
return nil;
}

%end
*/
