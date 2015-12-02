//
//  xx.h
//  MobileMail
//
//  Created by Johnson on 8/11/15.
//  Copyright (c) 2015 Johnson. All rights reserved.
//


/**抢红包弹出的浮层*/
@interface WCRedEnvelopesReceiveHomeView : UIView
{
//    id <WCRedEnvelopesReceiveHomeViewDelegate> m_delegate;
    UIImageView *m_backgroundView;
    UIButton *openRedEnvelopesButton;  //有没有红包看这个按钮即可
    UIImageView *openAnimationImageView;
    struct CGRect m_frame;
    NSDictionary *m_dicBaseInfo;
    _Bool m_bSuccessAnmation;
    UIView *oRedView;
    UIView *oTopHeaderView;
//    MMWebImageView *imageView;
//    MMWebImageView *maskImageView;
}
- (void)showSuccessOpenAnimation;
- (void)removeView;
- (void)endAnimation;
- (void)showAnimation;
- (void)stopReceiveAnimation;
- (void)startReceiveAnimation;
- (void)OnOpenRedEnvelopes;   //UI层拆红包
- (void)OnOpenList;
- (void)OnCancelButtonDone;
- (id)initWithFrame:(struct CGRect)arg1 andData:(id)arg2 delegate:(id)arg3;
- (void)refreshViewWithData:(id)arg1;

@end


/**聊天列表中显示的红包视图的父类 在cell中的*/
@interface BaseMessageNodeView : UIView

+ (_Bool)canCreateMessageNodeViewInstanceWithMessageWrap:(id)arg1;
@property(readonly, nonatomic) UIView *m_oContentView; // @synthesize m_oContentView;
//@property(nonatomic) long long m_orientation; // @synthesize m_orientation;
@property(nonatomic) unsigned int m_eNodeType; // @synthesize m_eNodeType;
//@property(nonatomic) __weak id <messageNodeViewDelegate> m_delegate; // @synthesize m_delegate;
- (void)onModifyEnterpriseContact:(id)arg1;
- (void)onKFContactHeadImgUpdate:(id)arg1;
- (void)onModifyKFContact:(id)arg1;
- (void)onGetEmoticonDesc:(id)arg1 forMd5:(id)arg2;
- (void)revokeMsg:(id)arg1;
- (id)getCurrentNodeAccessibilityDescription:(id)arg1;
- (id)getMoreMainInfomationAccessibilityDescription;
- (void)launch:(id)arg1;
- (id)m_msgWrap;
- (void)OnAppInfoChanged:(id)arg1;
- (void)OnAppWatermarkChanged:(id)arg1;
- (void)onMenuItemWillHide;
- (void)onEndTouch;
- (void)onTouchCancel;
- (void)onLongTouchForMiss3dTouch:(struct CGPoint)arg1;
- (void)onLongTouch;
- (void)onTouchUpInside;
- (void)onTouchDownRepeat;
- (void)onTouchDown;
- (void)layoutSubviewsInternal;
- (struct CGSize)sizeForFrame:(struct CGRect)arg1;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (_Bool)isTouchInView:(id)arg1;
- (void)pressedEvents;
- (void)LongPressEvents;
- (void)resend:(id)arg1;
- (void)dealloc;
- (void)onModifyQQContact:(id)arg1;
- (void)onStrangerContactUpdated:(id)arg1;
- (void)onModifyContact:(id)arg1;
- (void)onHeadImageChange:(id)arg1;
- (void)onComment;
- (void)onHeadImageClicked:(id)arg1;
- (void)OnLongPressGesture:(id)arg1;
- (void)onClearResource;
- (void)onDisappear;
- (void)updateMessageContent:(id)arg1;
- (_Bool)isShowChatRoomDisplayName;
- (void)updateChatContact:(id)arg1;
- (void)layoutSubviews;
- (void)reCalculateSizeIfNeed;
- (void)onOrientationChanged;
- (void)setOrientation:(long long)arg1;
- (void)reLayoutSubviews;
- (void)layoutForCrashWarning;
- (void)updateBkgImage:(_Bool)arg1;
- (void)calculateSize;
- (void)initCrashWarningLabel;
- (void)initHeadImageView;
- (void)updateChatRoomDisplayNameCrashProtectedState;
- (void)updateChatRoomMessageCrashProtectedState;
- (void)updateThumbImage;
- (void)updateNodeStatus:(id)arg1;
- (void)updateStatus:(id)arg1;
- (void)actionSheet:(id)arg1 clickedButtonAtIndex:(long long)arg2;
- (void)actionSheet:(id)arg1 didDismissWithItem:(id)arg2;
- (void)setupWatchSourceBadgeIfNeed;
- (void)setDonorIconHidden:(_Bool)arg1;
- (void)showConnectorSheet:(id)arg1;
- (void)onRestore:(id)arg1;
- (void)onDebug:(id)arg1;
- (void)onBrandConnector:(id)arg1;
- (void)onDelete:(id)arg1;
- (_Bool)canPerformAction:(SEL)arg1 withSender:(id)arg2;
- (_Bool)canBecomeFirstResponder;
- (void)MenuControllerWillHide:(id)arg1;
- (void)showOperationMenu:(id)arg1 NeedDelete:(_Bool)arg2;
- (void)onForward:(id)arg1;
- (void)showOperationMenuWithoutDelete:(id)arg1 CanBeForward:(_Bool)arg2;
- (void)showOperationMenu:(id)arg1;
- (_Bool)canShowFavMenu;
- (_Bool)canShowRevokeMenu;
- (_Bool)canShowMoreMenu;
- (_Bool)hasForwardInList:(id)arg1;
- (_Bool)isLocationMessage;
- (_Bool)shouldShowForwardBrandItem;
- (_Bool)isPortait;
- (void)calculateLeftRightMargin;
- (void)initChatRoomNameLabel;
- (void)initCommentButton;
- (void)showUIStatus;
- (void)hideUIStatus;
- (void)updateAppBottomButton;
- (void)clearAppBottomButton;
- (void)initAppBottomButton;
- (void)initAppMessageBlockButton;
- (void)clearActivityView;
- (void)initAcitivityView;
- (void)clearSendFailButton;
- (void)clearSendOKView;
- (void)initSendOKView;
- (struct CGPoint)getSendOKViewOrgin;
- (void)initSendFailButton;
- (id)initWithMessageWrap:(id)arg1 Contact:(id)arg2 ChatContact:(id)arg3;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end


/**聊天列表中显示的红包视图 在cell中的*/
@interface WCPayC2CMessageNodeView : BaseMessageNodeView
{
    UILabel *m_descLabel;
    UILabel *m_titleLabel;
    UILabel *m_hintLabel;
    UILabel *m_senceLabel;
}

+ (_Bool)canCreateMessageNodeViewInstanceWithMessageWrap:(id)arg1;
- (id)getMoreMainInfomationAccessibilityDescription;
- (void)onMenuItemWillHide;
- (void)onTouchCancel;
- (void)onLongTouch;
- (void)onTouchUpInside; //UI层弹出抢红包
- (void)onTouchDownRepeat;
- (void)onTouchDown;
- (void)onFavoriteAdd:(id)arg1;
- (void)onForward:(id)arg1;
- (void)onMoreOperate:(id)arg1;
- (void)OnRetrySendMsg;
- (void)showOpearation;
- (void)onClick;  //UI层弹出抢红包
- (void)updateThumbImage;
- (id)genCenterImage:(id)arg1;
- (void)updateBkgImage:(_Bool)arg1;
- (void)onClearResource;
- (void)onDisappear;
- (void)updateStatus:(id)arg1;
- (void)layoutSubviewsInternal;
- (struct CGSize)sizeForFrame:(struct CGRect)arg1;
- (id)getBackgroundImageHL;
- (id)getBackgroundImage;

@end


//聊天列表的控制器
@interface BaseMsgContentViewController : UIViewController

- (void)viewDidLoad;

- (void)viewWillAppear:(BOOL)animated;

- (NSMutableArray *)recordRedEnvelopes;

- (BOOL)autoGrabRedEnvelopes;

@end


//设置通用界面
@interface SettingGeneralViewController : UIViewController

- (void)onNearModeSwitchChanged:(id)arg1;

@end
