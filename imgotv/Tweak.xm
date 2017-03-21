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





#import "imgotv.h"




%hook BaseADControlView

/*
- (void)playOver
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)hasDetailEvent:(_Bool)arg1
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)hideButton
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)showButton
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)vipSkipButtonAction:(id) arg1
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)setVideoTitle:(id)arg1
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)clickLargeView
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)clickSmallView
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)clickControlButton
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)skipAD
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}
- (void)clickButtonType:(long long)arg1
{
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}

*/



//上面的都是日志， 在这个方法中调用skipAD即可
- (void)setSurplusTime:(int)arg1
{
[self skipAD];
%orig;
NSLog(@"ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ:         %@", NSStringFromSelector(_cmd));
}


%end
