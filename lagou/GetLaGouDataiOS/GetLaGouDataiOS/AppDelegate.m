//
//  AppDelegate.m
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/23.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import "AppDelegate.h"
#import "GeTuiSdk.h"
#import "TestVC.h"
#import "LGJobListHomeViewController.h"
#import <objc/runtime.h>
#import <dlfcn.h>

//#import "JPlaceholder.framework/JPlaceholder"

@interface AppDelegate () <GeTuiSdkDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        [application registerUserNotificationSettings:setting];
     [application registerForRemoteNotifications];

    
    [GeTuiSdk startSdkWithAppId:@"amSAH6p1vqArKtpPKhHx49" appKey:@"QNMyXdIaNW9ZzaEWPMbGZ7" appSecret:@"MBfFtDpOtM7ESEO0ZwKdM5" delegate:self];
    
    
    
//    self.window.rootViewController = [TestVC new];
//    self.window.rootViewController = [LGJobListHomeViewController new];
    [self testFramework];
//    UIView *view = [NSClassFromString(@"JPlaceholderTextView") new];
//    NSLog(@"%@", view);
    return YES;
}
-(void)testFramework
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentDirectory = nil;
    if ([paths count] != 0)
    documentDirectory = [paths objectAtIndex:0];
    
    //拼接我们放到document中的framework路径
    NSString *libName = @"JPlaceholder.framework/JPlaceholder";
    NSString *destLibPath = [documentDirectory stringByAppendingPathComponent:libName];
    
    //判断一下有没有这个文件的存在　如果没有直接跳出
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:destLibPath]) {
        NSLog(@"There isn't have the file");
        return;
    }
    
    //复制到程序中
    NSError *error = nil;
    
//    加载方式一：使用dlopen加载动态库的形式　使用此种方法的时候注意头文件的引入
        void* lib_handle = dlopen([destLibPath cStringUsingEncoding:NSUTF8StringEncoding], RTLD_GLOBAL);
        if (!lib_handle) {
            NSLog(@"Unable to open library: %s\n", dlerror());
            return;
        }
//    加载方式一　关闭的方法
//     Close the library.
//        if (dlclose(lib_handle) != 0) {
//            NSLog(@"Unable to close library: %s\n",dlerror());
//        }
    
    //加载方式二：使用NSBundle加载动态库
//    NSBundle *frameworkBundle = [NSBundle bundleWithPath:destLibPath];
//    if (frameworkBundle && [frameworkBundle load]) {
//        NSLog(@"bundle load framework success.");
//    }else {
//        NSLog(@"bundle load framework err:%@",error);
//        
//    }
    
    /*
     *通过NSClassFromString方式读取类
     *PacteraFramework　为动态库中入口类
     */
    Class pacteraClass = NSClassFromString(@"JPlaceholderTextView");
    if (!pacteraClass) {
        NSLog(@"Unable to get TestDylib class");
    }
    
    /*
     *初始化方式采用下面的形式
     　alloc　init的形式是行不通的
     　同样，直接使用PacteraFramework类初始化也是不正确的
     *通过- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
     　方法调用入口方法（showView:withBundle:），并传递参数（withObject:self withObject:frameworkBundle）
     */
    NSObject *pacteraObject = [pacteraClass new];
//    [pacteraObject performSelector:@selector(showView:withBundle:) withObject:self withObject:frameworkBundle];
    
}

    - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0);
    {
        NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
        token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"\n>>>[DeviceToken Success]:%@\n\n", token);
        
        // [ GTSdk ]：向个推服务器注册deviceToken
        [GeTuiSdk registerDeviceToken:token];
    }
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_AVAILABLE_IOS(3_0);
    {
        NSLog(@"error: %@", error);
    }
    
    
    /** APP已经接收到“远程”通知(推送) - (App运行在后台)  */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
    // [ GTSdk ]：将收到的APNs信息传给个推统计
    [GeTuiSdk handleRemoteNotification:userInfo];
    
    // 显示APNs信息到页面
    NSString *record = [NSString stringWithFormat:@"[APN]%@, %@", [NSDate date], userInfo];
    NSLog(@"%@", record);
    
    completionHandler(UIBackgroundFetchResultNewData);
}
    
    
#pragma mark - background fetch  唤醒
- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // [ GTSdk ]：Background Fetch 恢复SDK 运行
    [GeTuiSdk resume];
    
    completionHandler(UIBackgroundFetchResultNewData);
}
    

#pragma mark - GeTuiSdkDelegate
    
    /** SDK启动成功返回cid */
- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
    // [ GTSdk ]：个推SDK已注册，返回clientId
    NSLog(@">>[GTSdk RegisterClient]:%@", clientId);
}
    
    /** SDK收到透传消息回调 */
- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId {
    // [ GTSdk ]：汇报个推自定义事件(反馈透传消息)
    [GeTuiSdk sendFeedbackMessage:90001 andTaskId:taskId andMsgId:msgId];
    
    // 数据转换
    NSString *payloadMsg = nil;
    if (payloadData) {
        payloadMsg = [[NSString alloc] initWithBytes:payloadData.bytes length:payloadData.length encoding:NSUTF8StringEncoding];
    }
    
    // 页面显示日志
    NSString *record = [NSString stringWithFormat:@"%d, %@, %@%@", 3, [self formateTime:[NSDate date]], payloadMsg, offLine ? @"<离线消息>" : @""];

    
    // 控制台打印日志
    NSString *msg = [NSString stringWithFormat:@"%@ : %@%@", [self formateTime:[NSDate date]], payloadMsg, offLine ? @"<离线消息>" : @""];
    NSLog(@">>[GTSdk ReceivePayload]:%@, taskId: %@, msgId :%@", msg, taskId, msgId);
}
    
    /** SDK收到sendMessage消息回调 */
- (void)GeTuiSdkDidSendMessage:(NSString *)messageId result:(int)result {
    // 页面显示：上行消息结果反馈
    NSString *record = [NSString stringWithFormat:@"Received sendmessage:%@ result:%d", messageId, result];

}
    
    /** SDK遇到错误回调 */
- (void)GeTuiSdkDidOccurError:(NSError *)error {
    // 页面显示：个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。

}
    
    /** SDK运行状态通知 */
- (void)GeTuiSDkDidNotifySdkState:(SdkStatus)aStatus {
    // 页面显示更新通知SDK运行状
}
    
    /** SDK设置推送模式回调  */
- (void)GeTuiSdkDidSetPushMode:(BOOL)isModeOff error:(NSError *)error {
    // 页面显示错误信息
    if (error) {
        return;
    }
    
   
}

    
    
    
    
    
    
    
    
    
    - (NSString *)formateTime:(NSDate *)date {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString *dateTime = [formatter stringFromDate:date];
        return dateTime;
    }

@end
