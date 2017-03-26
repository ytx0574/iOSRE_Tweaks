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





%hook AFHTTPRequestSerializer

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
URLString:(NSString *)URLString
parameters:(id)parameters
error:(NSError *)error
{

id request = %orig;


NSString *httpBodyString = [[NSString alloc] initWithData:[request HTTPBody] encoding:NSUTF8StringEncoding];

NSString *linkString = [[request HTTPMethod] isEqualToString:@"POST"] ? [NSString stringWithFormat:@"%@?%@", [request URL], httpBodyString] : [request URL].absoluteString;

NSLog(@" HTTP-Method-> %@;\n HTTP-URL-> %@;\n HTTP-Body-> %@;\nLink-> %@", [request HTTPMethod], [request URL], httpBodyString, linkString);


return request;
}

%end











#import "lagou.h"


%hook LGChatBaseViewController

+ (id)initializeWithSession:(id)arg1
{
id value = %orig;

NSLog(@"_________________________%@    [%@]  %@", NSStringFromSelector(_cmd), arg1, [arg1 class]);
[NSKeyedArchiver archiveRootObject:[arg1 mj_JSONObject] toFile:LgSessionPath];


return value;
}

%end






%hook LGSearchResultViewController

- (void)dealloc
{
[GetUpdateAllDataTimer invalidate];
SetUpdateAllDataTimer(nil);

[GetLoadMoreTimer invalidate];
SetLoadMoreTimer(nil);

%orig;
}

+ (id)initializeWithPreViewController:(id)arg1 searchKeyword:(id)arg2
{
id value = %orig;

NSLog(@"_________________________%@ %@ %@ ", NSStringFromSelector(_cmd), arg1, arg2 );

return value;
}


%new(@@:)
- (NSMutableArray *)resultArray
{
//_resultArray = _resultArray ?: [NSMutableArray array];
return [self valueForKey:@"_resultArray"];
}




- (void)viewDidLoad
{
%orig;

//保留类本身的逻辑  如果当前hook的对象nvc不是是UINavigationController则跳过
if([self.navigationController isKindOfClass:NSClassFromString(@"LGNavigationController")]) {
return;
}


//判断是否有聊天的session  只要跟人私聊过就有，并且自动发送给最后一个私聊对象
LGChatSession *lgSession = [NSClassFromString(@"LGChatSession") mj_objectWithKeyValues:[NSKeyedUnarchiver unarchiveObjectWithFile:LgSessionPath]];

if (lgSession == nil) {
[[[UIAlertView alloc] initWithTitle:nil message:@"当前聊天对象不存在" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
}else {
LGChatBaseViewController *chatVC = [NSClassFromString(@"LGChatBaseViewController") initializeWithSession:lgSession];
SetChatVC(chatVC);
}


if (kUpdatePageInterval * kUpdatePage > kUpdateInterval ) {
[[[UIAlertView alloc] initWithTitle:nil message:@"分页时间太长。。。不对称" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
}

SetUpdateAllDataTimer([NSTimer scheduledTimerWithTimeInterval:kUpdateInterval target:self selector:@selector(searchJobList) userInfo:nil repeats:YES]);

}


- (void)searchJobList
{

%orig;

NSLog(@"------o-------拉钩：  加载第一页数据");

SetCurrentPage(1);
SetLoadMoreTimer([NSTimer scheduledTimerWithTimeInterval:kUpdatePageInterval target:self selector:@selector(searchResultViewloadMoreData) userInfo:nil repeats:YES]);
}


- (void)searchResultViewloadMoreData
{

%orig;


if (GetCurrentPage >= kUpdatePage) {
SetCurrentPage(0);

[GetLoadMoreTimer invalidate];
SetLoadMoreTimer(nil);


__block NSMutableArray *lastResultArray = [NSKeyedUnarchiver unarchiveObjectWithFile:LgJobListPath];


//模拟数据
__unsafe_unretained typeof(self) wself = self;  //

void(^analogData)() = ^{

LGJobListItemModel *a = [[NSClassFromString(@"LGJobListItemModel") alloc] init];
a.companyId = 11;

LGJobListItemModel *b = [[NSClassFromString(@"LGJobListItemModel") alloc] init];
b.companyId = 22;

LGJobListItemModel *c = [[NSClassFromString(@"LGJobListItemModel") alloc] init];
c.companyId = 33;


LGJobListItemModel *aa = [[NSClassFromString(@"LGJobListItemModel") alloc] init];
aa.companyId = 11;

LGJobListItemModel *bb = [[NSClassFromString(@"LGJobListItemModel") alloc] init];
bb.companyId = 22;

LGJobListItemModel *cc = [[NSClassFromString(@"LGJobListItemModel") alloc] init];
cc.companyId = 33;

LGJobListItemModel *dd = [[NSClassFromString(@"LGJobListItemModel") alloc] init];
dd.companyId = 44;


lastResultArray = [@[a.mj_JSONObject, b.mj_JSONObject, c.mj_JSONObject] mutableCopy];

[[wself resultArray] removeAllObjects];
[[wself resultArray] addObjectsFromArray:@[aa.mj_JSONObject, bb.mj_JSONObject, cc.mj_JSONObject, dd.mj_JSONObject]];
};

if (kUseAnalogData) { analogData(); }




//把搜索数据 从model改为dictionary 并本地化
NSMutableArray *JSONResultArray = [NSMutableArray array];
[[self resultArray] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

NSMutableDictionary *dictInfo = [[obj mj_JSONObject] mutableCopy];
[dictInfo removeObjectForKey:@"strategyArray"];
[JSONResultArray addObject:dictInfo];

NSLog(@"===%@ %@ mj_JSONObject:%@ \n dict:%@", [obj class], obj, [obj mj_JSONObject], dictInfo);

}];


[NSKeyedArchiver archiveRootObject:[JSONResultArray mj_JSONObject] toFile:LgJobListPath];
//        NSLog(@"------o-------拉钩：  打印当前总数据  %@", JSONResultArray);


//第一次本地没有取到数据，不做筛选。
if (lastResultArray == nil) {
return;
}


//筛选出新旧数据一样的部分
NSMutableArray *sameDataArray = [NSMutableArray array];

[JSONResultArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

LGJobListItemModel *lgJobListItemModel = [[lastResultArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
return [evaluatedObject[@"companyId"] integerValue] == [obj[@"companyId"] integerValue];
}]] firstObject];

if (lgJobListItemModel) {
[sameDataArray addObject:obj];
}

}];

//从现有数据中移除一样的部分得到最新的内容
[JSONResultArray removeObjectsInArray:sameDataArray];



if (JSONResultArray.count > 0) {
NSLog(@"------o-------拉钩：  输出与上次不一样的数据%@", JSONResultArray);

[JSONResultArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

[GetChatVC conductViewSendMessageWithText:[NSString stringWithCString:[[obj description] cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding]];

}];

}else {
NSLog(@"------o-------拉钩：  此次无新招聘发布¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸");
}

}else {
SetCurrentPage(GetCurrentPage + 1);

NSLog(@"------o-------拉钩：  加载更多数据  %d", GetCurrentPage);

}

}
%end






%hook LGJobListHomeViewController

- (void)viewDidLoad
{
%orig;

//本地创建配置表， 可更改。。。
NSLog(@"------o-------拉钩：  搜索内容及时间可在本地进行修改 /Documents/lgConfig.plist");
if (![[NSFileManager defaultManager] fileExistsAtPath:LgConfigPath]) {

[@{
@"kKeyword" : @"iOS",
@"kUseAnalogData" : @(YES),
@"kUpdateInterval" : @(25),
@"kUpdatePage" : @(10),
@"kUpdatePageInterval" : @(2),
} writeToFile:LgConfigPath atomically:YES];

}

UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
button.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 30, SCREEN_HEIGHT - 50 - 30, 30, 30);
[button setTitle:@"" forState:UIControlStateNormal];
button.titleLabel.font = [UIFont systemFontOfSize:11.f];
[button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
[button addTarget:self action:@selector(appleButtonClick) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:button];

UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveTest:)];
[button addGestureRecognizer:pan];


SetPushSearchVCTimer([NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(initSearchVC) userInfo:nil repeats:YES]);

}


%new(v@:)
- (void)appleButtonClick
{
UIWindow *window = [self.view viewWithTag:357];
window.hidden = !window.hidden;
}


%new(v@:@)
- (void)moveTest:(UIGestureRecognizer *)gestureRecognizer
{
gestureRecognizer.view.center = [gestureRecognizer locationInView:[[[UIApplication sharedApplication] delegate] window]];
}


%new(v@:)
- (void)initSearchVC
{

LGChatSession *lgSession = [NSClassFromString(@"LGChatSession") mj_objectWithKeyValues:[NSKeyedUnarchiver unarchiveObjectWithFile:LgSessionPath]];
if (lgSession) {

[GetPushSearchVCTimer invalidate];
SetPushSearchVCTimer(nil);
NSLog(@"------o-------拉钩：  初始化SearchVC成功！！！");



LGSearchViewController *vc = [[NSClassFromString(@"LGSearchViewController") alloc] init];
UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];


UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
window.backgroundColor = [UIColor redColor];
window.tag = 357;
[window makeKeyAndVisible];
window.rootViewController = nvc;
[self.view addSubview:window];


UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
button.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 30, SCREEN_HEIGHT - 50 - 30, 30, 30);
[button setTitle:@"" forState:UIControlStateNormal];
button.titleLabel.font = [UIFont systemFontOfSize:11.f];
[button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
[button addTarget:self action:@selector(appleButtonClick) forControlEvents:UIControlEventTouchUpInside];
[window addSubview:button];



dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
[vc searchWithKeyword:kKeyword];
});

}else {
NSLog(@"------o-------拉钩：  对话消息不存在，请先选择一对话人");
}

}

%end








%hook LGSearchResultView

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2
{

//保留类本身的逻辑  如果自动获取数据 屏蔽详情查看
UINavigationController *nvc = [(id)[[self nextResponder] nextResponder] navigationController];
if([nvc isKindOfClass:NSClassFromString(@"LGNavigationController")]) {
%orig;
}else {
[[[UIAlertView alloc] initWithTitle:nil message:@"自动获取数据中，不可查看详情。  请到原有页面查看" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
}

}

%end


