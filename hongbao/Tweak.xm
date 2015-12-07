/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/







#import "hongbao.h"


/**抢红包弹出的浮层*/
%hook WCRedEnvelopesReceiveHomeView
- (id)initWithFrame:(struct CGRect)arg1 andData:(id)arg2 delegate:(id)arg3
{
id value = %orig;

UIButton *openRedEnvelopesButton = [self valueForKey:@"openRedEnvelopesButton"];
if (openRedEnvelopesButton.hidden == NO) {
[self OnOpenRedEnvelopes];  //拆包
[self OnCancelButtonDone];  //取消显示页面
//NSLog(@"---------------------------笑你妹c 自动帮你拆红包---------------------------");
}


return value;
}

//打开红包列表详情
- (void)OnOpenList
{
//%orig;   //拆包之后不跳转到红包详情
//NSLog(@"---------%@:", NSStringFromSelector(_cmd));
}

%end


/**聊天列表中显示的红包视图 在cell中的*/
%hook WCPayC2CMessageNodeView

+ (_Bool)canCreateMessageNodeViewInstanceWithMessageWrap:(id)arg1
{
BOOL value = %orig;

//NSLog(@"---------%@:--%@--class:%@   判断是不是红包 Bool->%d", NSStringFromSelector(_cmd), arg1, [arg1 class], value);

return value;
}

//- (id)getMoreMainInfomationAccessibilityDescription
//{
//id value = %orig;

//NSLog(@"---------%@:--%@", NSStringFromSelector(_cmd), value);

//return value;
//}

/**红包出来更新cell状态*/
- (void)updateStatus:(id)arg1
{
%orig;

//NSLog(@"----2-----%@:--%@--%@--%@", NSStringFromSelector(_cmd), arg1,     self.nextResponder.nextResponder.nextResponder.nextResponder.nextResponder.nextResponder, [arg1 class]);


id vc = self.nextResponder.nextResponder.nextResponder.nextResponder.nextResponder.nextResponder;

NSMutableArray *arrayRecordRedEnvelopes = [vc recordRedEnvelopes];

id info = arg1;
NSString *m_uiMesLocalID = [info valueForKey:@"m_uiMesLocalID"];
if (![arrayRecordRedEnvelopes containsObject:m_uiMesLocalID] && [vc autoGrabRedEnvelopes]) {
[arrayRecordRedEnvelopes addObject:m_uiMesLocalID];
[self onClick];
//NSLog(@"%@  新红包出来, 自动打开抢了", NSStringFromSelector(_cmd));
}

//NSLog(@"---%@  arrayRecordRedEnvelopes-> %@", NSStringFromSelector(_cmd), arrayRecordRedEnvelopes);
}

%end


//消息列表的控制器.  并且在里面添加了一个数组来记录红包
%hook BaseMsgContentViewController

//记录是否已抢红包
static char Key = 'l';
//是否开启抢红包
static char SwitchKey = 'm';

- (void)viewDidLoad
{
%orig;

//添加 绑定记录属性, 记录已抢红包的id
NSMutableArray *arrayRecordRedEnvelopes = [NSMutableArray array];
//[arrayRecordRedEnvelopes addObject:@"草泥马ßß"];
objc_setAssociatedObject(self, &Key, arrayRecordRedEnvelopes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

//NSLog(@"%@", [self recordRedEnvelopes]);

}

- (void)viewWillAppear:(BOOL)animated
{
%orig;

//添加是否自动抢红包属性  开了听筒模式才能自动抢
NSNumber *autoGrabRedEnvelopesValue = [[NSUserDefaults standardUserDefaults] objectForKey:@"auto_grap_red_envelope"] ?: @(YES);  //有值就根据值来判断, 没值就默认开抢
objc_setAssociatedObject(self, &SwitchKey, autoGrabRedEnvelopesValue, OBJC_ASSOCIATION_COPY_NONATOMIC);

//NSLog(@"%d", [self autoGrabRedEnvelopes]);
}


%new(@@:)
- (NSMutableArray *)recordRedEnvelopes
{
return objc_getAssociatedObject(self, &Key);
}

%new(B@:)
- (BOOL)autoGrabRedEnvelopes
{
return [objc_getAssociatedObject(self, &SwitchKey) boolValue];
}

%end


//设置通用界面
%hook SettingGeneralViewController

- (void)onLoudModeSwitch:(id)arg1
{
%orig;
UISwitch *loudModeSwitch = arg1;
[[NSUserDefaults standardUserDefaults] setObject:@(loudModeSwitch.isOn) forKey:@"auto_grap_red_envelope"];
[[NSUserDefaults standardUserDefaults] synchronize];

//NSLog(@"听筒模式事件 %@  Bool->%d", NSStringFromSelector(_cmd), loudModeSwitch.isOn);
}

%end









