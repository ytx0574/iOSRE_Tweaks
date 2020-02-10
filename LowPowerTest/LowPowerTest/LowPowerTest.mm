#line 1 "/Users/johnson/Desktop/LowPowerTest/LowPowerTest/LowPowerTest.xm"


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

@class SpringBoard; @class ClassName; 
static id (*_logos_meta_orig$_ungrouped$ClassName$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$ClassName$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$)(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments)(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$devicePowerStateDidChange(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$addNewMethod(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); 

#line 9 "/Users/johnson/Desktop/LowPowerTest/LowPowerTest/LowPowerTest.xm"



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



@interface PSLowPowerModeSettingsDetail : NSObject
@property (readonly, copy) NSString *debugDescription;
@property (readonly, copy) NSString *description;
@property (readonly) unsigned long long hash;
@property (readonly) Class superclass;

+ (id)iconImage;
+ (bool)isEnabled;
+ (id)preferencesURL;
+ (void)setEnabled:(bool)arg1;
@end

@interface SpringBoard : NSObject
- (void)addNewMethod;
- (void)powerStateDidChange:(NSNotification *)noti;
@end



static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {
    _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);



    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(devicePowerStateDidChange) name:NSProcessInfoPowerStateDidChangeNotification object:nil];


    [self addNewMethod];


}



static void _logos_method$_ungrouped$SpringBoard$devicePowerStateDidChange(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    


    UIDevice.currentDevice.batteryMonitoringEnabled = YES;
     if (!NSProcessInfo.processInfo.isLowPowerModeEnabled && [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging && UIDevice.currentDevice.batteryLevel == 0.8f) {

        id batterySaver = objc_getAssociatedObject(self, _cmd);
        if (!batterySaver) {
            batterySaver = [NSClassFromString(@"_CDBatterySaver") performSelector:@selector(batterySaver)];
            objc_setAssociatedObject(self, _cmd, batterySaver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        


        NSMethodSignature *signature = [[batterySaver class] instanceMethodSignatureForSelector:@selector(setPowerMode:error:)];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.target = batterySaver;
        invocation.selector = @selector(setPowerMode:error:);
        long long value = 0x1;
        [invocation setArgument:&value atIndex:2];
        [invocation invoke];



         dispatch_async(dispatch_get_main_queue(), ^{
             [[[UIAlertView alloc] initWithTitle:@"充电中到80%, 自动开启低电量模式" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
         });
    }
}

















static void _logos_method$_ungrouped$SpringBoard$addNewMethod(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [[[UIAlertView alloc] initWithTitle:@"自动开启低电量模式的插件已启动" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}























static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ClassName = objc_getClass("ClassName"); Class _logos_metaclass$_ungrouped$ClassName = object_getClass(_logos_class$_ungrouped$ClassName); MSHookMessageEx(_logos_metaclass$_ungrouped$ClassName, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$ClassName$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$ClassName$sharedInstance);MSHookMessageEx(_logos_class$_ungrouped$ClassName, @selector(messageWithNoReturnAndOneArgument:), (IMP)&_logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$, (IMP*)&_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$);MSHookMessageEx(_logos_class$_ungrouped$ClassName, @selector(messageWithReturnAndNoArguments), (IMP)&_logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments, (IMP*)&_logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(devicePowerStateDidChange), (IMP)&_logos_method$_ungrouped$SpringBoard$devicePowerStateDidChange, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(addNewMethod), (IMP)&_logos_method$_ungrouped$SpringBoard$addNewMethod, _typeEncoding); }} }
#line 148 "/Users/johnson/Desktop/LowPowerTest/LowPowerTest/LowPowerTest.xm"
