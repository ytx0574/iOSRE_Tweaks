#line 1 "/Users/johnson/Desktop/tweak1/tweak1/tweak1.xm"


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

@class APPDelegate; 
static id (*_logos_meta_orig$_ungrouped$APPDelegate$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$APPDelegate$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$APPDelegate$messageWithNoReturnAndOneArgument$)(_LOGOS_SELF_TYPE_NORMAL APPDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$APPDelegate$messageWithNoReturnAndOneArgument$(_LOGOS_SELF_TYPE_NORMAL APPDelegate* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$APPDelegate$messageWithReturnAndNoArguments)(_LOGOS_SELF_TYPE_NORMAL APPDelegate* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$APPDelegate$messageWithReturnAndNoArguments(_LOGOS_SELF_TYPE_NORMAL APPDelegate* _LOGOS_SELF_CONST, SEL); 

#line 9 "/Users/johnson/Desktop/tweak1/tweak1/tweak1.xm"



static id _logos_meta_method$_ungrouped$APPDelegate$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	HBLogDebug(@"+[<APPDelegate: %p> sharedInstance]", self);

	return _logos_meta_orig$_ungrouped$APPDelegate$sharedInstance(self, _cmd);
}


static void _logos_method$_ungrouped$APPDelegate$messageWithNoReturnAndOneArgument$(_LOGOS_SELF_TYPE_NORMAL APPDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id originalArgument) {
	HBLogDebug(@"-[<APPDelegate: %p> messageWithNoReturnAndOneArgument:%@]", self, originalArgument);

NSLog(@"222");
	_logos_orig$_ungrouped$APPDelegate$messageWithNoReturnAndOneArgument$(self, _cmd, originalArgument);
	NSLog(@"333");
	
	
}


static id _logos_method$_ungrouped$APPDelegate$messageWithReturnAndNoArguments(_LOGOS_SELF_TYPE_NORMAL APPDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	HBLogDebug(@"-[<APPDelegate: %p> messageWithReturnAndNoArguments]", self);

	id originalReturnOfMessage = _logos_orig$_ungrouped$APPDelegate$messageWithReturnAndNoArguments(self, _cmd);
	
	

	return originalReturnOfMessage;
}


static __attribute__((constructor)) void _logosLocalInit() {
{
    Class _logos_class$_ungrouped$APPDelegate = objc_getClass("APPDelegate");
    Class _logos_metaclass$_ungrouped$APPDelegate = object_getClass(_logos_class$_ungrouped$APPDelegate);
    
    MSHookMessageEx(_logos_metaclass$_ungrouped$APPDelegate, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$APPDelegate$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$APPDelegate$sharedInstance);
    
    MSHookMessageEx(_logos_class$_ungrouped$APPDelegate, @selector(messageWithNoReturnAndOneArgument:), (IMP)&_logos_method$_ungrouped$APPDelegate$messageWithNoReturnAndOneArgument$, (IMP*)&_logos_orig$_ungrouped$APPDelegate$messageWithNoReturnAndOneArgument$);
    
    MSHookMessageEx(_logos_class$_ungrouped$APPDelegate, @selector(messageWithReturnAndNoArguments), (IMP)&_logos_method$_ungrouped$APPDelegate$messageWithReturnAndNoArguments, (IMP*)&_logos_orig$_ungrouped$APPDelegate$messageWithReturnAndNoArguments);} }
#line 41 "/Users/johnson/Desktop/tweak1/tweak1/tweak1.xm"
