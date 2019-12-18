#line 1 "/Users/johnson/Desktop/nanchongshangyeyinhang/nanchongshangyeyinhang/nanchongshangyeyinhang.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIDevice; @class HKEDeviceInfo; @class UP0223DeviceProfile; @class ClassName; @class ZHHookDetection; @class UP0223Utility; 
static id (*_logos_meta_orig$_ungrouped$ClassName$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$ClassName$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$)(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments)(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$ZHHookDetection$isJailbroken1)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken1(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$ZHHookDetection$isJailbroken2)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken2(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$ZHHookDetection$isJailbroken3)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken3(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$isJailbroken)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$isJailbroken(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$UP0223Utility$isJailbroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$UP0223Utility$isJailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UP0223DeviceProfile$isJailbroken)(_LOGOS_SELF_TYPE_NORMAL UP0223DeviceProfile* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UP0223DeviceProfile$isJailbroken(_LOGOS_SELF_TYPE_NORMAL UP0223DeviceProfile* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$HKEDeviceInfo$isJailbroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$HKEDeviceInfo$isJailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 

#line 9 "/Users/johnson/Desktop/nanchongshangyeyinhang/nanchongshangyeyinhang/nanchongshangyeyinhang.xm"



static id _logos_meta_method$_ungrouped$ClassName$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	HBLogDebug(@"+[<ClassName: %p> sharedInstance]", self);

	return _logos_meta_orig$_ungrouped$ClassName$sharedInstance(self, _cmd);
}


static void _logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id originalArgument) {
	HBLogDebug(@"-[<ClassName: %p> messageWithNoReturnAndOneArgument:%@]", self, originalArgument);

	_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$(self, _cmd, originalArgument);
	
	
}


static id _logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	HBLogDebug(@"-[<ClassName: %p> messageWithReturnAndNoArguments]", self);

	id originalReturnOfMessage = _logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments(self, _cmd);
	
	

	return originalReturnOfMessage;
}









static BOOL _logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken1(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}


static BOOL _logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken2(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}


static BOOL _logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken3(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}








static BOOL _logos_method$_ungrouped$UIDevice$isJailbroken(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}






static BOOL _logos_meta_method$_ungrouped$UP0223Utility$isJailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}






static BOOL _logos_method$_ungrouped$UP0223DeviceProfile$isJailbroken(_LOGOS_SELF_TYPE_NORMAL UP0223DeviceProfile* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}






static BOOL _logos_meta_method$_ungrouped$HKEDeviceInfo$isJailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ClassName = objc_getClass("ClassName"); Class _logos_metaclass$_ungrouped$ClassName = object_getClass(_logos_class$_ungrouped$ClassName); MSHookMessageEx(_logos_metaclass$_ungrouped$ClassName, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$ClassName$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$ClassName$sharedInstance);MSHookMessageEx(_logos_class$_ungrouped$ClassName, @selector(messageWithNoReturnAndOneArgument:), (IMP)&_logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$, (IMP*)&_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$);MSHookMessageEx(_logos_class$_ungrouped$ClassName, @selector(messageWithReturnAndNoArguments), (IMP)&_logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments, (IMP*)&_logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments);Class _logos_class$_ungrouped$ZHHookDetection = objc_getClass("ZHHookDetection"); Class _logos_metaclass$_ungrouped$ZHHookDetection = object_getClass(_logos_class$_ungrouped$ZHHookDetection); MSHookMessageEx(_logos_metaclass$_ungrouped$ZHHookDetection, @selector(isJailbroken1), (IMP)&_logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken1, (IMP*)&_logos_meta_orig$_ungrouped$ZHHookDetection$isJailbroken1);MSHookMessageEx(_logos_metaclass$_ungrouped$ZHHookDetection, @selector(isJailbroken2), (IMP)&_logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken2, (IMP*)&_logos_meta_orig$_ungrouped$ZHHookDetection$isJailbroken2);MSHookMessageEx(_logos_metaclass$_ungrouped$ZHHookDetection, @selector(isJailbroken3), (IMP)&_logos_meta_method$_ungrouped$ZHHookDetection$isJailbroken3, (IMP*)&_logos_meta_orig$_ungrouped$ZHHookDetection$isJailbroken3);Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(isJailbroken), (IMP)&_logos_method$_ungrouped$UIDevice$isJailbroken, (IMP*)&_logos_orig$_ungrouped$UIDevice$isJailbroken);Class _logos_class$_ungrouped$UP0223Utility = objc_getClass("UP0223Utility"); Class _logos_metaclass$_ungrouped$UP0223Utility = object_getClass(_logos_class$_ungrouped$UP0223Utility); MSHookMessageEx(_logos_metaclass$_ungrouped$UP0223Utility, @selector(isJailbroken), (IMP)&_logos_meta_method$_ungrouped$UP0223Utility$isJailbroken, (IMP*)&_logos_meta_orig$_ungrouped$UP0223Utility$isJailbroken);Class _logos_class$_ungrouped$UP0223DeviceProfile = objc_getClass("UP0223DeviceProfile"); MSHookMessageEx(_logos_class$_ungrouped$UP0223DeviceProfile, @selector(isJailbroken), (IMP)&_logos_method$_ungrouped$UP0223DeviceProfile$isJailbroken, (IMP*)&_logos_orig$_ungrouped$UP0223DeviceProfile$isJailbroken);Class _logos_class$_ungrouped$HKEDeviceInfo = objc_getClass("HKEDeviceInfo"); Class _logos_metaclass$_ungrouped$HKEDeviceInfo = object_getClass(_logos_class$_ungrouped$HKEDeviceInfo); MSHookMessageEx(_logos_metaclass$_ungrouped$HKEDeviceInfo, @selector(isJailbroken), (IMP)&_logos_meta_method$_ungrouped$HKEDeviceInfo$isJailbroken, (IMP*)&_logos_meta_orig$_ungrouped$HKEDeviceInfo$isJailbroken);} }
#line 99 "/Users/johnson/Desktop/nanchongshangyeyinhang/nanchongshangyeyinhang/nanchongshangyeyinhang.xm"
