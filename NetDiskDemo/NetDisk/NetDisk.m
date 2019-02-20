//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//
//  NetDisk.m
//  NetDisk
//
//  Created by Johnson on 2018/11/9.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import "NetDisk.h"
#import "substrate.h"

#define DLog(fmt, ...)   NSLog((@"=========[line:%d function:%s]" fmt "\n{%@}"), __LINE__, __FUNCTION__, ##__VA_ARGS__, [NSThread callStackSymbols]);
@class _TtC16BaiduNetdisk_mac11AppDelegate;
@class BDUser;



static void (*BDUser_isSVip)(BDUser*,SEL);
static void new_BDUser_isSVip(BDUser* self,SEL _cmd){
    BDUser_isSVip(self, _cmd);
    DLog(@"isSVIP>>>>>>>>>>>>>> %@", @"");
}

//static void (*DownloadListViewController_setProbationaryView)(BDUser*, SEL, id);
//static void new_DownloadListViewController_setProbationaryView(BDUser* self, SEL _cmd, NSArray *ay){
//    DownloadListViewController_setProbationaryView(self, _cmd, ay);
//
//    DLog(@"DownloadListViewController_setProbationaryView>>>>>>>>>>>>>> %@", ay);
//}
//
//static void (*initView)(BDUser*,SEL);
//static void ninitView(BDUser* self,SEL _cmd){
//    initView(self, _cmd);
//    DLog(@"initView>>>>>>>>>>>>>> %@", @"");
//}
//
//static void (*internalInit)(BDUser*,SEL);
//static void ninternalInit(BDUser* self,SEL _cmd){
//    internalInit(self, _cmd);
//    DLog(@"internalInit>>>>>>>>>>>>>> %@", @"");
//}
//
//static void (*showProbationView)(BDUser*,SEL);
//static void nshowProbationView(BDUser* self,SEL _cmd){
//    showProbationView(self, _cmd);
//    DLog(@"showProbationView>>>>>>>>>>>>>> %@", @"");
//}
//
//static void (*probationaryAction)(BDUser*,SEL,id);
//static void nprobationaryAction(BDUser* self,SEL _cmd, id value){
//    probationaryAction(self, _cmd, value);
//    DLog(@"probationaryAction>>>>>>>>>>>>>> %@", value);
//}
//
//
//static id (*modelContainerPropertyGenericClass)(BDUser*, SEL);
//static id nmodelContainerPropertyGenericClass(BDUser* self, SEL _cmd)
//{
//    id value = modelContainerPropertyGenericClass(self, _cmd);
//    DLog(@"%@", value);
//    DLog(@"DownloadListViewController_setProbationaryView>>>>>>>>>>>>>> %@ %@ %@ %@ %@ %@ %@", [value valueForKey:@"timestamp"], [value valueForKey:@"token"], [value valueForKey:@"buttonInfo"], [value valueForKey:@"duration"], [value valueForKey:@"increaseType"], [value valueForKey:@"remainsCount"], [value valueForKey:@"couldExperience"]);
//
//    return value;
//}
//
//static id (*modelCustomPropertyMapper)(BDUser*, SEL);
//static id nmodelCustomPropertyMapper(BDUser* self, SEL _cmd){
//    id value = modelCustomPropertyMapper(self, _cmd);
//    DLog(@"%@", value);
//    DLog(@"DownloadListViewController_setProbationaryView>>>>>>>>>>>>>> %@ %@ %@ %@ %@ %@ %@", [value valueForKey:@"timestamp"], [value valueForKey:@"token"], [value valueForKey:@"buttonInfo"], [value valueForKey:@"duration"], [value valueForKey:@"increaseType"], [value valueForKey:@"remainsCount"], [value valueForKey:@"couldExperience"]);
//
//    return value;
//}
//
//void (*applicationDidFinishLaunching)(BDUser *, SEL, id);
//void (napplicationDidFinishLaunching)(BDUser *self, SEL _cmd, id args) {
//    applicationDidFinishLaunching(self, _cmd, args);
//    DLog(@"VVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
//}

void (*destroyInstance)(id, SEL);
void (ndestroyInstance)(id self, SEL _cmd) {
    DLog(@"");
    destroyInstance(self, _cmd);
}

id (*sharedInstance)(id, SEL);
id (nsharedInstance)(id self, SEL _cmd) {
    id value = sharedInstance(self, _cmd);
    DLog(@"%@", value);
    return value;
}
long (*probationDuration)(id, SEL);
long (nprobationDuration)(id self, SEL _cmd) {
    long long value = probationDuration(self, _cmd);
    DLog(@"%lld", value);
    return value;
}
void (*checkProbationary)(id, SEL);
void (ncheckProbationary)(id self, SEL _cmd) {
    DLog(@"");
    checkProbationary(self, _cmd);
}
long long (*calculateAverageSpeed)(id, SEL, id);
long long (ncalculateAverageSpeed)(id self, SEL _cmd, id argv) {
    long long value = calculateAverageSpeed(self, _cmd, argv);
    DLog(@"argv:%@", argv);
    DLog(@"%lld", value);
    return value;
}
id (*trialToken)(id, SEL);
id (ntrialToken)(id self, SEL _cmd) {
    id value = trialToken(self, _cmd);
    DLog(@"%@", value);
    return value;
}
long long (*trialTimeStamp)(id, SEL);
long long (ntrialTimeStamp)(id self, SEL _cmd) {
    long long value = trialTimeStamp(self, _cmd);
    DLog(@"%lld", value);
    return value;
}

void (*resetTrialStatus)(id, SEL);
void (nresetTrialStatus)(id self, SEL _cmd) {
    DLog(@"");
}
void (*startTrial)(id, SEL);
void (nstartTrial)(id self, SEL _cmd) {
    DLog(@"开始");
    startTrial(self, _cmd);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(66 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DLog("继续再来");
        [self performSelector:@selector(resetTrialStatus)];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            startTrial(self, _cmd);
        });
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        while(true) {
            id _probationaryStatus = [self valueForKey:@"_probationaryStatus"];
            id _probationaryDuration = [self valueForKey:@"_probationaryDuration"];
            id _probationaryModel = [self valueForKey:@"_probationaryModel"];
            DLog(@">>>>>%@ %@ %@", _probationaryStatus, _probationaryDuration, _probationaryModel);
            sleep(5);
        }
    });
}

static void __attribute__((constructor)) initialize(void) {
//    MSHookMessageEx(objc_getClass("BDUser"),  @selector(isSVip), (IMP)&new_BDUser_isSVip, (IMP*)&BDUser_isSVip);

    MSHookMessageEx(objc_getMetaClass("FileTransSpeedUpTrialManager"), @selector(destroyInstance), (IMP)&ndestroyInstance, (IMP*)&destroyInstance);
//    MSHookMessageEx(objc_getMetaClass("FileTransSpeedUpTrialManager"), @selector(sharedInstance), (IMP)&nsharedInstance, (IMP*)&sharedInstance);


    MSHookMessageEx(objc_getClass("FileTransSpeedUpTrialManager"), @selector(probationDuration), (IMP)&nprobationDuration, (IMP*)&probationDuration);
    MSHookMessageEx(objc_getClass("FileTransSpeedUpTrialManager"), @selector(checkProbationary), (IMP)&ncheckProbationary, (IMP*)&checkProbationary);
//    MSHookMessageEx(objc_getClass("FileTransSpeedUpTrialManager"), @selector(calculateAverageSpeed:), (IMP)&ncalculateAverageSpeed, (IMP*)&calculateAverageSpeed);
    MSHookMessageEx(objc_getClass("FileTransSpeedUpTrialManager"), @selector(trialToken), (IMP)&ntrialToken, (IMP*)&trialToken);
    MSHookMessageEx(objc_getClass("FileTransSpeedUpTrialManager"), @selector(trialTimeStamp), (IMP)&ntrialTimeStamp, (IMP*)&trialTimeStamp);
    MSHookMessageEx(objc_getClass("FileTransSpeedUpTrialManager"), @selector(startTrial), (IMP)&nstartTrial, (IMP*)&startTrial);
    MSHookMessageEx(objc_getClass("FileTransSpeedUpTrialManager"), @selector(resetTrialStatus), (IMP)&nresetTrialStatus, (IMP*)&resetTrialStatus);


//    + (void)destroyInstance;
//    + (id)sharedInstance;
//
//    - (long long)probationDuration;
//    - (void)checkProbationary;
//    - (long long)calculateAverageSpeed:(id)arg1;
//    - (id)trialToken;
//    - (long long)trialTimeStamp;
//    - (void)startTrial;

    
//    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac26DownloadListViewController"),  @selector(setProbationaryView:), (IMP)&new_DownloadListViewController_setProbationaryView, (IMP*)&DownloadListViewController_setProbationaryView);
//
//
//
//    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(initView), (IMP)&ninitView, (IMP*)&initView);
//    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(internalInit), (IMP)&ninternalInit, (IMP*)&internalInit);
//
//
//    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(showProbationView), (IMP)&nshowProbationView, (IMP*)&showProbationView);
//
//    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(probationaryAction:), (IMP)&nprobationaryAction, (IMP*)&probationaryAction);
//
//
//    MSHookMessageEx(object_getClass(objc_getClass("SpeedUpTrialModel")),  @selector(modelContainerPropertyGenericClass), (IMP)&nmodelContainerPropertyGenericClass, (IMP*)&modelContainerPropertyGenericClass);
//    MSHookMessageEx(object_getClass(objc_getClass("SpeedUpTrialModel")),  @selector(modelCustomPropertyMapper), (IMP)&nmodelCustomPropertyMapper, (IMP*)&modelCustomPropertyMapper);
//
//    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac11AppDelegate"), @selector(applicationDidFinishLaunching:), (IMP)&napplicationDidFinishLaunching, (IMP*)&applicationDidFinishLaunching);

    /*
        SpeedUpTrialModel
     
     + (id)modelContainerPropertyGenericClass;
     + (id)modelCustomPropertyMapper;

     */
    
    /*
     _TtC16BaiduNetdisk_mac26DownloadListViewController
     
     setProbationaryView:
     curentTransmissionType
     canDisplayTransFile:
     showTransFile:
     handleWidgetShow
     handleWidgetHidden
     handleRestrictedUserNotification:
     handleUserVipChangedNotification:
     
     */
    /*
     _TtC16BaiduNetdisk_mac21TransProbationaryView
     
     initView
     internalInit
     showWidgetWithProbationInfo:
     showProbationView
     hiddenProbationView
     probationaryAction:
     cancelAction:
     */
    //    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(applicationDidFinishLaunching:), (IMP)&new_QQMessageRevokeEngine_handleRecallNotify_isOnline, (IMP*)&origin_QQMessageRevokeEngine_handleRecallNotify_isOnline);
}
