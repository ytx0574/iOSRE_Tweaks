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
[[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"当前聊天对象已更改为：%@",[arg1 title]] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];


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
[[[UIAlertView alloc] initWithTitle:nil message:@"分页时间太长。。。分页时间总和与每次刷新间隔时间 不对称" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
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



//内部对象为NSDictionary
NSMutableArray *arrayLocalRecord = [NSKeyedUnarchiver unarchiveObjectWithFile:LgJobListPath];
//从本地取出需要校验的字段
NSDictionary *dictCheckProperties = [NSDictionary dictionaryWithContentsOfFile:LgCheckProperties];

//如果内部对象不是NSDictionary 则移除本地保存内容
if (![arrayLocalRecord.firstObject isKindOfClass:[NSDictionary class]]  && arrayLocalRecord) {

[[NSFileManager defaultManager] removeItemAtPath:LgJobListPath error:nil];
[arrayLocalRecord removeAllObjects];
}

//如果本地没有记录， 则初始化
if (arrayLocalRecord == nil) {
arrayLocalRecord = [NSMutableArray array];
}

//如果本地记录超过300, 则移除一半的数据
if (arrayLocalRecord.count > 300) {
[arrayLocalRecord removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, arrayLocalRecord.count / 2)]];
}



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


[arrayLocalRecord removeAllObjects];

//添加三个模拟数据
[@[a, b, c] enumerateObjectsUsingBlock:^(LGJobListItemModel *model, NSUInteger idx, BOOL * _Nonnull stop) {

NSMutableDictionary *dict = [NSMutableDictionary dictionary];

[[dictCheckProperties allKeys] enumerateObjectsUsingBlock:^(NSString *property, NSUInteger idx, BOOL * _Nonnull stop) {

//只添加本地需要校验的字段
if ([dictCheckProperties[property] boolValue]) {

[dict setObject:[model valueForKey:property] ?: @"" forKey:property];

}

}];

[arrayLocalRecord addObject:dict];

}];


[arrayLocalRecord addObjectsFromArray:@[
@{@"companyId": @(a.companyId), @"salary": @""},
@{@"companyId": @(b.companyId), @"salary": @""},
@{@"companyId": @(c.companyId), @"salary": @""},
]];


[[wself resultArray] removeAllObjects];
[[wself resultArray] addObjectsFromArray:@[aa, bb, cc, dd]];
};

if (kUseAnalogData) { analogData(); }  //这个模拟数据感觉有点多余了，先留着吧





//标记是否发送最终筛选结果， 本地无记录时不发送
BOOL isSendMsg = arrayLocalRecord.count == 0 ? NO : YES;



//把搜索数据 从model改为dictionary 并本地化
NSMutableArray *JSONResultArray = [NSMutableArray array];
[[self resultArray] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

NSMutableDictionary *dictInfo = [[obj mj_JSONObject] mutableCopy];
[dictInfo removeObjectForKey:@"strategyArray"];
[JSONResultArray addObject:dictInfo];

NSLog(@"===单条数据  %@ %@ mj_JSONObject:%@ \n dict:%@", [obj class], obj, [obj mj_JSONObject], dictInfo);

}];


//记录上一次记录没有的数据， 用于发送到企业端
NSMutableArray *arrayNotInLocalData = [NSMutableArray array];

[JSONResultArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {


//筛选当然对象上一次本地记录是否存在
NSDictionary *dictJobListItem = [[arrayLocalRecord filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSDictionary *evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {

//默认为相同， 一旦出现某个字段值不相等时， 返回NO
__block BOOL result = YES;

//从本地配置对比的字段  来筛选本地数据和线上数据的相同部分
[[dictCheckProperties allKeys] enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL * _Nonnull stop) {

//只验证本地配置表设置为需要验证的字段
if ([dictCheckProperties[key] boolValue]) {

//现有数据是否在本地存在（只验证配置表需要验证的字段）
BOOL flag = [obj[key] isEqual:evaluatedObject[key]];
if (flag == NO) {
result = NO;
*stop = YES;
}

}

}];

return result;
}]] firstObject];


//如果本地没有, 则取出没有的数据，并添加本地记录
if (dictJobListItem == nil) {

NSMutableDictionary *dict = [NSMutableDictionary dictionary];

[[dictCheckProperties allKeys] enumerateObjectsUsingBlock:^(NSString *property, NSUInteger idx, BOOL * _Nonnull stop) {

//只添加本地需要校验的字段
if ([dictCheckProperties[property] boolValue]) {

[dict setObject:obj[property] ?: @"" forKey:property];

}

}];

[arrayLocalRecord addObject:dict];

[arrayNotInLocalData addObject:obj];
}

}];





//把本地没有的数据发送到企业端，并把companyId保存到本地进行记录
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
[NSKeyedArchiver archiveRootObject:arrayLocalRecord toFile:LgJobListPath];
});

if (arrayNotInLocalData.count > 0) {
NSLog(@"------o-------拉钩：  输出与上次不一样的数据%@ %@", @(arrayNotInLocalData.count), arrayNotInLocalData);

[arrayNotInLocalData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

if (isSendMsg) {
[GetChatVC conductViewSendMessageWithText:[NSString stringWithCString:[[obj description] cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding]];
}

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


//添加数据校验字段， 默认必须验证companyId， 其他的在/Documents/lgCheckProperties.plist中修改
NSLog(@"------o-------拉钩：  本地校验字段修改位置 %@", LgCheckProperties);
if (![[NSFileManager defaultManager] fileExistsAtPath:LgCheckProperties]) {

//获取LGJobListItemModel对象的所有字段
u_int count;
objc_property_t *properties = class_copyPropertyList(NSClassFromString(@"LGJobListItemModel"), &count);
NSMutableArray *arrayProperties = [[NSMutableArray alloc] initWithCapacity:count];
for (int i = 0; i < count ; i++)
{
const char* propertyName = property_getName(properties[i]);
[arrayProperties addObject: [NSString stringWithUTF8String: propertyName]];
}
free(properties);



NSMutableDictionary *dict = [NSMutableDictionary dictionary];
[arrayProperties enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

//默认必须验证companyId 其他的在/Documents/lgCheckProperties.plist修改
[dict setObject:[obj isEqualToString:@"companyId"] ? @(YES) : @(NO) forKey:obj];

}];
//移除自带bug的key。 它是一个数组，无有用数据
[dict removeObjectForKey:@"strategyArray"];

[dict writeToFile:LgCheckProperties atomically:YES];

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

UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"对话消息不存在，请先选择一个需要发送最新招聘的企业用户" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];

[alertView show];

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
[alertView dismissWithClickedButtonIndex:0 animated:YES];
});

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


