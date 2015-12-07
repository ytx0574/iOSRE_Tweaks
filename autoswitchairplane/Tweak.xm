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



#import "autoswitchairplane.h"
#import <objc/message.h>


%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application
{
%orig;

NSString *openTime = @"23:23";

[[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"每天 %@ 自动开启飞行模式", openTime] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];

[self setAirplane:YES fireDate:openTime];
}

%new(v@:B@)
- (void)setAirplane:(BOOL)on fireDate:(NSString *)string
{
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyy-MM-dd HH:mm"];

NSString *stringFireDate = [[formatter stringFromDate:[NSDate date]] stringByReplacingCharactersInRange:NSMakeRange(11, string.length) withString:string];
NSDate *dateFire = [formatter dateFromString:stringFireDate];

NSTimeInterval interval = [dateFire timeIntervalSinceNow];
if (interval <= 0) {
dateFire = [dateFire dateByAddingTimeInterval:60 * 60 * 24];
interval = [dateFire timeIntervalSinceNow];
}

[NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(method:) userInfo:on ? @(YES) : @(NO) repeats:NO];
}

%new(v@:@)
- (void)method:(NSTimer *)timer
{
//NSTimeInterval interval = [[[NSDate date] dateByAddingTimeInterval:3] timeIntervalSinceDate:[NSDate date]];
NSTimeInterval interval = [[[NSDate date] dateByAddingTimeInterval:60 * 60 * 24] timeIntervalSinceDate:[NSDate date]];
[NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(method:) userInfo:timer.userInfo repeats:NO];

//[[SBTelephonyManager sharedTelephonyManager] setIsInAirplaneMode:[timer.userInfo boolValue]];
//[[SBTelephonyManager sharedTelephonyManager] setIsInAirplaneMode:YES];


id sharedTelephonyManager = ((id (*)(id, SEL))objc_msgSend)(objc_getClass("SBTelephonyManager"), NSSelectorFromString(@"sharedTelephonyManager"));
[sharedTelephonyManager performSelector:@selector(setIsInAirplaneMode:) withObject:@([timer.userInfo boolValue])];


NSLog(@"-- 切换 -- 飞行 -- 模式 --%d", [timer.userInfo boolValue]);
}

%end