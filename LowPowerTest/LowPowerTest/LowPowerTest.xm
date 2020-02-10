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

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application
{
    %orig;

//    [[[UIAlertView alloc] initWithTitle:@"Hello，Tanzhou!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(devicePowerStateDidChange) name:NSProcessInfoPowerStateDidChangeNotification object:nil];

//    [self performSelector:@selector(powerStateDidChange:) withObject:@YES];
    [self addNewMethod];
//    [NSClassFromString(@"PSLowPowerModeSettingsDetail") performSelector:@selector(setEnabled:) withObject:@YES];
//    [self powerStateDidChange:NSNotification.alloc];
}

%new
- (void)devicePowerStateDidChange
{
    //该函数低版本无效
//    [NSClassFromString(@"PSLowPowerModeSettingsDetail") performSelector:@selector(setEnabled:) withObject:@YES];

    UIDevice.currentDevice.batteryMonitoringEnabled = YES;
     if (!NSProcessInfo.processInfo.isLowPowerModeEnabled && [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging && UIDevice.currentDevice.batteryLevel == 0.8f) {
//    if (!NSProcessInfo.processInfo.isLowPowerModeEnabled && UIDevice.currentDevice.batteryLevel >= 0.8f) {
        id batterySaver = objc_getAssociatedObject(self, _cmd);
        if (!batterySaver) {
            batterySaver = [NSClassFromString(@"_CDBatterySaver") performSelector:@selector(batterySaver)];
            objc_setAssociatedObject(self, _cmd, batterySaver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        //performSelector无效, 带入参数有问题. 最好使用 invocation | msgSend
        //0关闭 1开启
//        [batterySaver performSelector:@selector(setPowerMode:error:) withObject:[NSNumber numberWithLongLong:0x1] withObject:nil];

        NSMethodSignature *signature = [[batterySaver class] instanceMethodSignatureForSelector:@selector(setPowerMode:error:)];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.target = batterySaver;
        invocation.selector = @selector(setPowerMode:error:);
        long long value = 0x1;
        [invocation setArgument:&value atIndex:2];
        [invocation invoke];

//        ((Bool (*) (id, SEL, long long, id *)) objc_msgSend) (batterySaver, @selector(setPowerMode:error:), 0x1, nil);

         dispatch_async(dispatch_get_main_queue(), ^{
             [[[UIAlertView alloc] initWithTitle:@"充电中到80%, 自动开启低电量模式" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
         });
    }
}

//- (void)devicePowerStateDidChange
//{
//    UIDevice.currentDevice.batteryMonitoringEnabled = YES;
//    if (!NSProcessInfo.processInfo.isLowPowerModeEnabled && [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging && UIDevice.currentDevice.batteryLevel >= 0.8f) {
//
//    if (!NSProcessInfo.processInfo.isLowPowerModeEnabled && UIDevice.currentDevice.batteryLevel >= 0.8f) {
//        [NSClassFromString(@"PSLowPowerModeSettingsDetail") performSelector:@selector(setEnabled:) withObject:@YES];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[[UIAlertView alloc] initWithTitle:@"充电中到80%, 自动开启低电量模式" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//        });
//    };
//    UIDevice.currentDevice.batteryMonitoringEnabled = NO;
//}

%new
- (void)addNewMethod
{
    [[[UIAlertView alloc] initWithTitle:@"自动开启低电量模式的插件已启动" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

//%new(v@:@)
//- (void)powerStateDidChange:(NSNotification *)noti
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//
//    [[[UIAlertView alloc] initWithTitle:NSClassFromString(@"PSLowPowerModeSettingsDetail") message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//    });
//
//
//    if (!NSProcessInfo.processInfo.isLowPowerModeEnabled) {
//        [PSLowPowerModeSettingsDetail setEnabled:YES];
//    }
//
//    UIDevice.currentDevice.batteryMonitoringEnabled = YES;
//    if (!NSProcessInfo.processInfo.isLowPowerModeEnabled && [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging && UIDevice.currentDevice.batteryLevel == 80.f) {
//        [NSClassFromString(@"PSLowPowerModeSettingsDetail") performSelector:@selector(setEnabled:) withObject:@YES];
//    };
//    UIDevice.currentDevice.batteryMonitoringEnabled = NO;
//}

%end

