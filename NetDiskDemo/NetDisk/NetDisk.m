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

#define DLog(fmt, ...)   NSLog((@"=========[lineNum:%d]" fmt "\n{%@}"), __LINE__, ##__VA_ARGS__, [NSThread callStackSymbols]);
@class _TtC16BaiduNetdisk_mac11AppDelegate;
@class BDUser;



static void (*BDUser_isSVip)(BDUser*,SEL);
static void new_BDUser_isSVip(BDUser* self,SEL _cmd){
    BDUser_isSVip(self, _cmd);
    DLog(@"isSVIP>>>>>>>>>>>>>> %@", @"");
}

static void (*DownloadListViewController_setProbationaryView)(BDUser*, SEL, id);
static void new_DownloadListViewController_setProbationaryView(BDUser* self, SEL _cmd, NSArray *ay){
    DownloadListViewController_setProbationaryView(self, _cmd, ay);
    
    DLog(@"DownloadListViewController_setProbationaryView>>>>>>>>>>>>>> %@", ay);
}

static void (*initView)(BDUser*,SEL);
static void ninitView(BDUser* self,SEL _cmd){
    initView(self, _cmd);
    DLog(@"initView>>>>>>>>>>>>>> %@", @"");
}

static void (*internalInit)(BDUser*,SEL);
static void ninternalInit(BDUser* self,SEL _cmd){
    internalInit(self, _cmd);
    DLog(@"internalInit>>>>>>>>>>>>>> %@", @"");
}

static void (*showProbationView)(BDUser*,SEL);
static void nshowProbationView(BDUser* self,SEL _cmd){
    showProbationView(self, _cmd);
    DLog(@"showProbationView>>>>>>>>>>>>>> %@", @"");
}

static void (*probationaryAction)(BDUser*,SEL,id);
static void nprobationaryAction(BDUser* self,SEL _cmd, id value){
    probationaryAction(self, _cmd, value);
    DLog(@"probationaryAction>>>>>>>>>>>>>> %@", value);
}


static NSString * (*modelContainerPropertyGenericClass)(BDUser*, SEL);
static NSString * nmodelContainerPropertyGenericClass(BDUser* self, SEL _cmd);
static NSString * nmodelContainerPropertyGenericClass(BDUser* self, SEL _cmd)
{
    id value = modelContainerPropertyGenericClass(self, _cmd);

    DLog(@"DownloadListViewController_setProbationaryView>>>>>>>>>>>>>> %@ %@ %@ %@ %@ %@ %@", [value valueForKey:@"timestamp"], [value valueForKey:@"token"], [value valueForKey:@"buttonInfo"], [value valueForKey:@"duration"], [value valueForKey:@"increaseType"], [value valueForKey:@"remainsCount"], [value valueForKey:@"couldExperience"]);

    return value;
}
//
//id (*modelCustomPropertyMapper)(BDUser*, SEL);
//id nmodelCustomPropertyMapper(BDUser* self, SEL _cmd){
//    id value = modelCustomPropertyMapper(self, _cmd);
//
//    DLog(@"DownloadListViewController_setProbationaryView>>>>>>>>>>>>>> %@ %@ %@ %@ %@ %@ %@", [value valueForKey:@"timestamp"], [value valueForKey:@"token"], [value valueForKey:@"buttonInfo"], [value valueForKey:@"duration"], [value valueForKey:@"increaseType"], [value valueForKey:@"remainsCount"], [value valueForKey:@"couldExperience"]);
//
//    return value;
//}

void (*applicationDidFinishLaunching)(BDUser *, SEL, id);
void (napplicationDidFinishLaunching)(BDUser *value, SEL _cmd, id args) {
    applicationDidFinishLaunching(value, _cmd, args);
    DLog(@"VVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
}

static void __attribute__((constructor)) initialize(void) {
    MSHookMessageEx(objc_getClass("BDUser"),  @selector(isSVip), (IMP)&new_BDUser_isSVip, (IMP*)&BDUser_isSVip);
    
    
    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac26DownloadListViewController"),  @selector(setProbationaryView:), (IMP)&new_DownloadListViewController_setProbationaryView, (IMP*)&DownloadListViewController_setProbationaryView);
    
    
    
    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(initView), (IMP)&ninitView, (IMP*)&initView);
    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(internalInit), (IMP)&ninternalInit, (IMP*)&internalInit);
    
    
    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(showProbationView), (IMP)&nshowProbationView, (IMP*)&showProbationView);
    
    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac21TransProbationaryView"),  @selector(probationaryAction:), (IMP)&nprobationaryAction, (IMP*)&probationaryAction);

    
    MSHookMessageEx(objc_getClass("SpeedUpTrialModel"),  @selector(modelContainerPropertyGenericClass), (IMP)&nmodelContainerPropertyGenericClass, (IMP*)&modelContainerPropertyGenericClass);
//    MSHookMessageEx(objc_getClass("SpeedUpTrialModel"),  @selector(modelCustomPropertyMapper), (IMP)&nmodelCustomPropertyMapper, (IMP*)&modelCustomPropertyMapper);
    
    MSHookMessageEx(objc_getClass("_TtC16BaiduNetdisk_mac11AppDelegate"), @selector(applicationDidFinishLaunching:), (IMP)&napplicationDidFinishLaunching, (IMP*)&applicationDidFinishLaunching);

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
