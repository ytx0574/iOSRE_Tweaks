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
\

#import "letvipadclient.h"

%hook LTMoviePlayerViewController



/*

- (void)LTPopWebViewClosed:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)LTPopWebViewShowed:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)notifyMidproAdPlayFinish
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)notifyCornerAdFinish
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)notifyAdSDKVideoPlayEnd
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (double)videoCurrentTime
{
double value = %orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
return value;
}
- (void)adMovieFrontPauseNotification:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)getSuspendViewShut
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)getSuspendViewTouch:(long long)arg1 withUrl:(id)arg2
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)getSuspendError
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)getSuspendSuccess:(id)arg1 withView:(id)arg2
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)requestAdPause:(_Bool)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (double)adCurrentTime
{
double value = %orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
return value;
}
- (void)updateAdPauseViewState
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)LTPlayControlViewVisibleChanged:(_Bool)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)getCornerViewShut
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)getCornerViewTouch:(long long)arg1 withUrl:(id)arg2
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)motionShake
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)apsCornorViewWillHidden:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)apsCornorViewWillShow:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)hideCornerAdvertiseView
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)showCornerAdvertiseView
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (_Bool)isMidproAdFinished
{
BOOL value = %orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
return value;
}
- (void)switchMidProAdVolume:(_Bool)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)calculateAdvertiseRange:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)destroyAdPlayerInfoManager
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)createAdPlayerInfoManager
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)addMiddleProllADViewWithAdData:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)viewTouchEvent:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)seekToPlaybackTime:(id)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)seekJumpMidproAD:(id)arg1 currentTime:(double)arg2
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)destroyMidproAd
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)midProDidFinished:(_Bool)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)notifyAdPlayerInfoManagerPlaybackTime:(double)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)notifyAdPlayerInfoManagerFullScreen:(_Bool)arg1
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)relayoutCornerAdvertiseView
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)unregisterMotionShake
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)registerMotionShake
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)videoDidResumed
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)videoDidPaused
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (long long)currentVideoPlayTime
{
double value = %orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
return value;
}
- (void)destroyAdPolicyManager
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}
- (void)createAdPolicyManager
{
%orig;
NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@", NSStringFromSelector(_cmd));
}




- (void)updateAdCounter
{
%orig;

//UIView *view;


LTPlayerDisplayView *playerDisplayView = [[[[[[[self viewPlayControl] subviews] firstObject] subviews] firstObject] subviews] firstObject];

if ([self viewAdTopPlayControl].hidden == NO) {
//[playerDisplayView.player performSelector:@selector(advanceToNextItem)];
}

NSLog(@"ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ%@ %@", NSStringFromSelector(_cmd), playerDisplayView);
}



*/















- (void)viewDidLoad
{

//发起一个定时器  每秒调用一次本类无用方法
[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(getSuspendError) userInfo:nil repeats:YES];

}


- (void)getSuspendError
{


if ([self adCurrentTime] > 0.0 && self.viewAdTopPlayControl.hidden == NO) {

NSLog(@"55555555555555555555555555555555555555555555 %f", ([self adCurrentTime] + [self lastRecordSecond]));

LTPlayerDisplayView *playerDisplayView = [[[[[[[self viewPlayControl] subviews] firstObject] subviews] firstObject] subviews] firstObject];

//直接跳过本广告视频 （短视频有bug）
//[playerDisplayView.player performSelector:@selector(advanceToNextItem)];


//直接跳转到广告最后一秒。  也不完美，广告始终会显示一下
[playerDisplayView.player seekToTime:CMTimeMake(([self adCurrentTime] + [self lastRecordSecond]) * 30, 30)];

}


}



%end
