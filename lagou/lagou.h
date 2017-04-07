//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
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




@interface NSObject (MJKeyValue)

- (id)mj_JSONObject;

- (NSString *)mj_JSONString;

+ (instancetype)mj_objectWithKeyValues:(id)keyValues;

@end


@interface LGChatSession : NSObject

@property(nonatomic) int orderStatus; // @synthesize orderStatus=_orderStatus;
@property(nonatomic) long long interViewOrderId; // @synthesize interViewOrderId=_interViewOrderId;
@property(nonatomic) long long interViewTime; // @synthesize interViewTime=_interViewTime;
@property(nonatomic) _Bool hasSendMessageMessage; // @synthesize hasSendMessageMessage=_hasSendMessageMessage;
@property(nonatomic) _Bool hasReceivedMessage; // @synthesize hasReceivedMessage=_hasReceivedMessage;
@property(nonatomic) _Bool didTalkSuccess; // @synthesize didTalkSuccess=_didTalkSuccess;
@property(nonatomic) long long lastLocalMessageId; // @synthesize lastLocalMessageId=_lastLocalMessageId;
@property(nonatomic) int messagePlaceHolderStatus; // @synthesize messagePlaceHolderStatus=_messagePlaceHolderStatus;
@property(nonatomic) long long draftTime; // @synthesize draftTime=_draftTime;
@property(copy, nonatomic) NSString *draft; // @synthesize draft=_draft;
@property(nonatomic) long long sendingFeedbackReadMessageId; // @synthesize sendingFeedbackReadMessageId=_sendingFeedbackReadMessageId;
@property(nonatomic) long long didFeedbackReadToMessageId; // @synthesize didFeedbackReadToMessageId=_didFeedbackReadToMessageId;
@property(nonatomic) long long targetLastReadMessageId; // @synthesize targetLastReadMessageId=_targetLastReadMessageId;
@property(nonatomic) long long lastMessageTime; // @synthesize lastMessageTime=_lastMessageTime;
@property(copy, nonatomic) NSString *lastMessageDescription; // @synthesize lastMessageDescription=_lastMessageDescription;
@property(nonatomic) int lastMessageType; // @synthesize lastMessageType=_lastMessageType;
@property(nonatomic) int lastMessageState; // @synthesize lastMessageState=_lastMessageState;
@property(nonatomic) long long lastMessageLocalId; // @synthesize lastMessageLocalId=_lastMessageLocalId;
@property(nonatomic) long long serverLastMessageTime; // @synthesize serverLastMessageTime=_serverLastMessageTime;
@property(nonatomic) long long serverLastMessageId; // @synthesize serverLastMessageId=_serverLastMessageId;
@property(nonatomic) int unreadCount; // @synthesize unreadCount=_unreadCount;
@property(copy, nonatomic) NSString *positionUrl; // @synthesize positionUrl=_positionUrl;
@property(nonatomic) int positionId; // @synthesize positionId=_positionId;
@property(copy, nonatomic) NSString *icon; // @synthesize icon=_icon;
@property(copy, nonatomic) NSString *title; // @synthesize title=_title;
@property(nonatomic) int targetStatus; // @synthesize targetStatus=_targetStatus;
@property(nonatomic) int localStatus; // @synthesize localStatus=_localStatus;
@property(nonatomic) long long serverStatusVersion; // @synthesize serverStatusVersion=_serverStatusVersion;
@property(nonatomic) int serverStatus; // @synthesize serverStatus=_serverStatus;
@property(nonatomic) int detailStatus; // @synthesize detailStatus=_detailStatus;
@property(nonatomic) long long updateVersion; // @synthesize updateVersion=_updateVersion;
@property(nonatomic) int sessionType; // @synthesize sessionType=_sessionType;
@property(nonatomic) long long sessionId; // @synthesize sessionId=_sessionId;
- (_Bool)isNoticeSession;
- (_Bool)lastMessageDidReadByOtherPerson;
- (id)description;
- (_Bool)setDetailStatusCancelLoad;
- (_Bool)setDetailStatusLoading;
@property(readonly, nonatomic) int personId;
@property(nonatomic) _Bool isForbiddenTarget;
@property(readonly, nonatomic) _Bool isNoInput;
@property(readonly, nonatomic) _Bool isForbiddenSelf;
@property(readonly, nonatomic) _Bool isNoNotify;
@property(readonly, nonatomic) _Bool isTop;
@property(readonly, nonatomic) _Bool isDelete;
@property(readonly, nonatomic) _Bool serverStatusIsDelete;
- (void)setServerStatusValue:(_Bool)arg1 forBit:(int)arg2;
- (_Bool)statusValueForBit:(int)arg1;
- (void)setStatusValue:(_Bool)arg1 forBit:(int)arg2;

@end



@interface LGModel : NSObject
- (id)jsonString;
- (id)jsonData;
- (id)jsonDictionary;
@end

@interface LGJobListItemModel : LGModel
@property(copy, nonatomic) NSString *showId; // @synthesize showId=_showId;
@property(retain, nonatomic) NSArray *strategyArray; // @synthesize strategyArray=_strategyArray;
@property(nonatomic) float cellHeight; // @synthesize cellHeight=_cellHeight;
@property(nonatomic) int index; // @synthesize index=_index;
@property(copy, nonatomic) NSString *closeIcon; // @synthesize closeIcon=_closeIcon;
@property(copy, nonatomic) NSString *infoLink; // @synthesize infoLink=_infoLink;
@property(copy, nonatomic) NSString *imageUrl; // @synthesize imageUrl=_imageUrl;
@property(nonatomic) int adId; // @synthesize adId=_adId;
@property(copy, nonatomic) NSString *adCode; // @synthesize adCode=_adCode;
@property(copy, nonatomic) NSString *cornerTag; // @synthesize cornerTag=_cornerTag;
@property(nonatomic) int type; // @synthesize type=_type;
@property(copy, nonatomic) NSString *district; // @synthesize district=_district;
@property(copy, nonatomic) NSString *businessZone; // @synthesize businessZone=_businessZone;
@property(nonatomic) _Bool talkable; // @synthesize talkable=_talkable;
@property(nonatomic) long long updateTime; // @synthesize updateTime=_updateTime;
@property(nonatomic) _Bool hasDeliver; // @synthesize hasDeliver=_hasDeliver;
@property(retain, nonatomic) NSString *companyFullName; // @synthesize companyFullName=_companyFullName;
@property(retain, nonatomic) NSString *positionAdvantage; // @synthesize positionAdvantage=_positionAdvantage;
@property(retain, nonatomic) NSString *industryField; // @synthesize industryField=_industryField;
@property(retain, nonatomic) NSString *financeStage; // @synthesize financeStage=_financeStage;
@property(retain, nonatomic) NSString *education; // @synthesize education=_education;
@property(retain, nonatomic) NSString *workYear; // @synthesize workYear=_workYear;
@property(retain, nonatomic) NSString *salary; // @synthesize salary=_salary;
@property(retain, nonatomic) NSString *createTime; // @synthesize createTime=_createTime;
@property(retain, nonatomic) NSString *city; // @synthesize city=_city;
@property(retain, nonatomic) NSString *companySize; // @synthesize companySize=_companySize;
@property(retain, nonatomic) NSString *companyName; // @synthesize companyName=_companyName;
@property(retain, nonatomic) NSString *companyLogo; // @synthesize companyLogo=_companyLogo;
@property(retain, nonatomic) NSString *positionName; // @synthesize positionName=_positionName;
@property(nonatomic) int companyId; // @synthesize companyId=_companyId;
@property(nonatomic) int publisherId; // @synthesize publisherId=_publisherId;
@property(nonatomic) int positionId; // @synthesize positionId=_positionId;
@end







@interface LGJobListHomeViewController : UIViewController

- (void)appleButtonClick;

- (void)moveTest:(UIGestureRecognizer *)gestureRecognizer;

- (void)initSearchVC;

@end



@interface LGSearchViewController : UIViewController

- (void)searchWithKeyword:(id)arg1;

@end



@interface LGSearchResultViewController : UIViewController

+ (id)initializeWithPreViewController:(id)arg1 searchKeyword:(id)arg2;

- (NSMutableArray *)resultArray;

@end



@interface LGChatBaseViewController : UIViewController


+ (id)initializeWithSession:(id)arg1;

- (void)conductViewSendMessageWithText:(id)arg1;

@end

@interface LGTalkChatViewController : LGChatBaseViewController

@end

