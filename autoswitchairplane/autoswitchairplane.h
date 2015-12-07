@interface SpringBoard : NSObject

- (void)applicationDidFinishLaunching:(id)application;

- (void)setAirplane:(BOOL)on fireDate:(NSString *)string;

- (void)method:(NSTimer *)timer;

@end


@interface SBTelephonyManager : NSObject

+ (id)sharedTelephonyManager;

- (void)setIsInAirplaneMode:(_Bool)arg1;

@end