// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

%hook ClassName

+ (id)sharedInstance
{
	%log;

	return %orig;
}

- (void)messageWithNoReturnAndOneArgument:(id)originalArgument
{
	%log;

	%orig(originalArgument);
	
	// or, for exmaple, you could use a custom value instead of the original argument: %orig(customValue);
}

- (id)messageWithReturnAndNoArguments
{
	%log;

	id originalReturnOfMessage = %orig;
	
	// for example, you could modify the original return value before returning it: [SomeOtherClass doSomethingToThisObject:originalReturnOfMessage];

	return originalReturnOfMessage;
}

%end


%hook ZHHookDetection

+ (BOOL)isJailbroken1
{
    return NO;
}

+ (BOOL)isJailbroken2
{
    return NO;
}

+ (BOOL)isJailbroken3
{
    return NO;
}


%end


%hook UIDevice

- (BOOL)isJailbroken
{
    return NO;
}

%end

%hook UP0223Utility

+ (BOOL)isJailbroken
{
    return NO;
}

%end

%hook UP0223DeviceProfile

- (BOOL)isJailbroken
{
    return NO;
}

%end

%hook HKEDeviceInfo

+ (BOOL)isJailbroken
{
    return NO;
}

%end
