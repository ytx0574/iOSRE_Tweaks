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


//屏蔽视频头部广告

%hook LTPlayerDisplayView
- (id)initWithCoder:(id)arg1
{
UIView *view = %orig;
view.tag = 1010;
return view;
}
- (id)initWithFrame:(struct CGRect)arg1
{
UIView *view = %orig;
view.tag = 1010;
return view;
}
%end



%hook LTPlayControlFSAdTopView

- (void)createBtnCounter
{
%orig;


LTMoviePlayerViewController *vc = (id)[[[[self nextResponder] nextResponder] nextResponder] nextResponder];

LTPlayerDisplayView *playerDisplayView = [[[[[[[vc viewPlayControl] subviews] firstObject] subviews] firstObject] subviews] firstObject];



if (playerDisplayView.tag == 1010) {

[playerDisplayView.player pause];

//直接跳转到广告最后一秒。  也不完美，广告始终会显示一下
[playerDisplayView.player seekToTime:CMTimeMake(([vc adCurrentTime] + [vc lastRecordSecond])  * 30, 30)];

}


}

%end











//屏蔽视频中间的广告 10分钟时展示

%hook APSBaseViewForPlayer


- (void)topViewCreate
{

%orig;



LTMoviePlayerViewController *vc = (id)[[[[self nextResponder] nextResponder] nextResponder] nextResponder];

LTPlayerDisplayView *playerDisplayView = [[[[[[[vc viewPlayControl] subviews] firstObject] subviews] firstObject] subviews] firstObject];




LTMidProAdvertiseData *midProAdvertiseData = vc.midProAdDataArray.lastObject;



[playerDisplayView.player pause];
[self invalidateCountdownTimer];
[self adComplete];
[self removeself];



long long currentTime = playerDisplayView.player.currentTime.value / playerDisplayView.player.currentTime.timescale;

long long nextTime = midProAdvertiseData.duration + currentTime;

nextTime += 2;


[playerDisplayView.player seekToTime:CMTimeMake(nextTime * 30, 30)];

NSLog(@"ÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂ  %@  %@  startTime:%f  duration:%f  currentTime:%lld  nextTime:%lld", vc, playerDisplayView, midProAdvertiseData.startTime, midProAdvertiseData.duration, currentTime, nextTime);

}

%end






