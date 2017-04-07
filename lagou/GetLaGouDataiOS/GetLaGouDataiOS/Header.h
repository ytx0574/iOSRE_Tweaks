//
//  Header.h
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/25.
//  Copyright © 2017年 Johnson. All rights reserved.
//








#define lgConfigData                             [NSDictionary dictionaryWithContentsOfFile:LgConfigPath]

//保存每一次会话的session，用于发送指定企业用户
#define LgSessionPath                            [NSHomeDirectory() stringByAppendingString:@"/Documents/lgSession"]

//保存每一次刷新校验的数据， 用于下次对新数据进行比对
#define LgJobListPath                            [NSHomeDirectory() stringByAppendingString:@"/Documents/lgJobList"]

//本地配置刷新频率 刷新页数 刷新间隔
#define LgConfigPath                             [NSHomeDirectory() stringByAppendingString:@"/Documents/lgConfig.plist"]

//本地配置每次更新校验的字段
#define LgCheckProperties                        [NSHomeDirectory() stringByAppendingString:@"/Documents/lgCheckProperties.plist"]


#define SCREEN_WIDTH                             [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT                            [[UIScreen mainScreen] bounds].size.height








static char ChatVC_Key =                         'b';
static char UpdateAllDataTimer_Key =             'c';
static char LoadMoreTimer_Key =                  'd';
static char LoadMoreCount_Key =                  'e';
static char PushSearchVC_Key =                   'f';


#define SetChatVC(value)                         objc_setAssociatedObject(self, &ChatVC_Key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
#define GetChatVC                                objc_getAssociatedObject(self, &ChatVC_Key)

#define SetUpdateAllDataTimer(value)             objc_setAssociatedObject(self, &UpdateAllDataTimer_Key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
#define GetUpdateAllDataTimer                    objc_getAssociatedObject(self, &UpdateAllDataTimer_Key)

#define SetLoadMoreTimer(value)                  objc_setAssociatedObject(self, &LoadMoreTimer_Key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
#define GetLoadMoreTimer                         objc_getAssociatedObject(self, &LoadMoreTimer_Key)

#define SetCurrentPage(value)                    objc_setAssociatedObject(self, &LoadMoreCount_Key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC)
#define GetCurrentPage                           [objc_getAssociatedObject(self, &LoadMoreCount_Key) intValue]

#define SetPushSearchVCTimer(value)              objc_setAssociatedObject(self, &PushSearchVC_Key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
#define GetPushSearchVCTimer                     objc_getAssociatedObject(self, &PushSearchVC_Key)





//--------------------------------------------config---------------------------

#define kUseAnalogData                           [[lgConfigData objectForKey:@"kUseAnalogData"] boolValue]     //使用模拟数据数据  目前仅仅测试能否自动发送消息到企业端

#define kKeyword                                 [lgConfigData objectForKey:@"kKeyword"]       //搜索关键字

#define kUpdateInterval                          [[lgConfigData objectForKey:@"kUpdateInterval"] intValue]     //刷新间隔

#define kUpdatePage                              [[lgConfigData objectForKey:@"kUpdatePage"] intValue]     //刷新总页数

#define kUpdatePageInterval                      [[lgConfigData objectForKey:@"kUpdatePageInterval"] intValue]     //获取分页间隔

