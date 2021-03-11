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






//
- (void)publicIPCheck;
{
    requestCount = ++requestCount;
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:@"https://2020.ip138.com/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error && data) {
            requestSuccessCount = ++requestSuccessCount;
            NSString *htmlString = [[NSString  alloc] initWithData:data encoding:NSUTF8StringEncoding];
            [[htmlString componentsSeparatedByString:@"\n"] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                //您的iP地址是：[<a href="https://www.ip138.com/iplookup.asp?ip=183.236.3.206&action=2" target="_blank">183.236.3.206</a>] 来自：广东省广州市 移动
                if ([obj containsString:@"您的iP地址是"]) { //拆分字符串
                    NSString *info = [[obj componentsSeparatedByString:@"target=\"_blank\">"] lastObject];
                    NSArray *ay = [info componentsSeparatedByString:@"</a>] 来自："];
                    NSString *ip = ay.firstObject;
                    NSString *address = ay.lastObject;
                    NSLog(@"IP: %@, Adress: %@", ip, address);
                    *stop = YES;
                }
            }];
            
            NSLog(@"requestCount:%ld, requestSuccessCount:%ld", requestCount, requestSuccessCount);
        }else {
            NSLog(@"-----error:%@", error);
        }
    }];
    [task resume];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self deviceWANIPAddress];
    });
}


//
- (void)VPNConnectStatusCheck
{
    static NSDate *VPNConnectionTimerFired_RecordDate;
    static NSTimer *timer;
    NSTimeInterval intervalTip = 3;
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"VPNConnectionTimerFired" object:nil queue:nil usingBlock:^(NSNotification *note) {
        VPNConnectionTimerFired_RecordDate = NSDate.date;
        
        NSLog(@"received noti");
        [timer invalidate];
        timer = [NSTimer timerWithTimeInterval:intervalTip repeats:NO block:^(NSTimer * _Nonnull timer) {
            NSTimeInterval interval = [NSDate.date timeIntervalSinceDate:VPNConnectionTimerFired_RecordDate];
            NSLog(@"timer up       %@  %@ %f", VPNConnectionTimerFired_RecordDate, NSDate.date, interval);
            
            if (interval > intervalTip) {
                [[[UIAlertView alloc] initWithTitle:@"超过3s未更新, 检查VPN是否断开" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                //1021
                AudioServicesPlaySystemSound(1331);
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
        }];
        
        [NSRunLoop.currentRunLoop addTimer:timer forMode:NSRunLoopCommonModes];
    }];
    
}
