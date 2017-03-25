//
//  TestVC.h
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/24.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestVC : UIViewController

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



@interface LGSearchViewController : UIViewController
- (void)searchWithKeyword:(id)arg1;

@end



@interface LGSearchResultViewController : UIViewController

+ (id)initializeWithPreViewController:(id)arg1 searchKeyword:(id)arg2;

@end



@interface LGChatBaseViewController : UIViewController


+ (id)initializeWithSession:(id)arg1;

- (void)conductViewSendMessageWithText:(id)arg1;

@end
