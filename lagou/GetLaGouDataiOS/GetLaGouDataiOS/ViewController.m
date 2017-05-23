//
//  ViewController.m
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/23.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+MJKeyValue.h"
#import "Header.h"
#import "TestVC.h"


//@implementation NSObject (Runtime)
//
//+ (NSArray *)runtimeProperties
//{
//    unsigned int outCount;
//    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
//    NSMutableArray *result = [NSMutableArray array];
//    for (int i = 0; i < outCount; i++) {
//        [result addObject:[self formattedPropery:properties[i]]];
//    }
//    free(properties);
//    return result.count ? [result copy] : nil;
//}
//
//+ (NSString *)formattedPropery:(objc_property_t)prop {
//    unsigned int attrCount;
//    objc_property_attribute_t *attrs = property_copyAttributeList(prop, &attrCount);
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    for (int idx = 0; idx < attrCount; idx++) {
//        NSString *name = [NSString stringWithCString:attrs[idx].name encoding:NSUTF8StringEncoding];
//        NSString *value = [NSString stringWithCString:attrs[idx].value encoding:NSUTF8StringEncoding];
//        [attributes setObject:value forKey:name];
//    }
//    free(attrs);
//    NSMutableString *property = [NSMutableString stringWithFormat:@"@property "];
//    NSMutableArray *attrsArray = [NSMutableArray array];
//    
//    //https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101-SW5
//    [attrsArray addObject:[attributes objectForKey:@"N"] ? @"nonatomic" : @"atomic"];
//    
//    if ([attributes objectForKey:@"&"]) {
//        [attrsArray addObject:@"strong"];
//    } else if ([attributes objectForKey:@"C"]) {
//        [attrsArray addObject:@"copy"];
//    } else if ([attributes objectForKey:@"W"]) {
//        [attrsArray addObject:@"weak"];
//    } else {
//        [attrsArray addObject:@"assign"];
//    }
//    if ([attributes objectForKey:@"R"]) {[attrsArray addObject:@"readonly"];}
//    if ([attributes objectForKey:@"G"]) {
//        [attrsArray addObject:[NSString stringWithFormat:@"getter=%@", [attributes objectForKey:@"G"]]];
//    }
//    if ([attributes objectForKey:@"S"]) {
//        [attrsArray addObject:[NSString stringWithFormat:@"setter=%@", [attributes objectForKey:@"G"]]];
//    }
//    
//    [property appendFormat:@"(%@) %@ %@",
//     [attrsArray componentsJoinedByString:@", "],
//     [NSString decodeType:[[attributes objectForKey:@"T"] cStringUsingEncoding:NSUTF8StringEncoding]],
//     [NSString stringWithCString:property_getName(prop) encoding:NSUTF8StringEncoding]];
//    return [property copy];
//}
//
//@end
//
//
//@implementation NSString (Runtime)
//
//+ (NSString *)decodeType:(const char *)cString {
//    if (!strcmp(cString, @encode(id))) return @"id";
//    if (!strcmp(cString, @encode(void))) return @"void";
//    if (!strcmp(cString, @encode(float))) return @"float";
//    if (!strcmp(cString, @encode(int))) return @"int";
//    if (!strcmp(cString, @encode(BOOL))) return @"BOOL";
//    if (!strcmp(cString, @encode(char *))) return @"char *";
//    if (!strcmp(cString, @encode(double))) return @"double";
//    if (!strcmp(cString, @encode(Class))) return @"class";
//    if (!strcmp(cString, @encode(SEL))) return @"SEL";
//    if (!strcmp(cString, @encode(unsigned int))) return @"unsigned int";
//    NSString *result = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
//    if ([[result substringToIndex:1] isEqualToString:@"@"] && [result rangeOfString:@"?"].location == NSNotFound) {
//        result = [[result substringWithRange:NSMakeRange(2, result.length - 3)] stringByAppendingString:@"*"];
//    } else
//        if ([[result substringToIndex:1] isEqualToString:@"^"]) {
//            result = [NSString stringWithFormat:@"%@ *",
//                      [NSString decodeType:[[result substringFromIndex:1] cStringUsingEncoding:NSUTF8StringEncoding]]];
//        }
//    return result;
//}
//
//@end


@implementation LGJobListItemModel

@end





@interface ViewController ()
    {
      @public NSMutableArray *_resultArray;
    }
    
    

@end

@implementation ViewController

- (void)dealloc
{
    [GetUpdateAllDataTimer invalidate];
    SetUpdateAllDataTimer(nil);
    
    [GetLoadMoreTimer invalidate];
    SetLoadMoreTimer(nil);
    
    //%orig;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSMutableArray *)resultArray
{
    _resultArray = _resultArray ?: [NSMutableArray array];
    return [self valueForKey:@"_resultArray"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    NSMutableArray *ay = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [ay addObject:@(i)];
    }
    
    [ay removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, ay.count / 2)]];
    
    
    
    
    
    //需要去掉的元素数组
    
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
    
    
    
    NSLog(@"%@", [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 8]);
    
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateString = [dateFormater stringFromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60 * 8]];
    
    
    
    
    
    
    
    NSString *dateString = @"2017-03-27 11:35:32.0";
    
   
    if ([dateString hasPrefix:currentDateString]) {
        NSLog(@"______");
    }
    
    
    
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
    
//%orig;
    
    NSLog(@"------o-------拉钩：  加载第一页数据");
    
    SetCurrentPage(1);
    SetLoadMoreTimer([NSTimer scheduledTimerWithTimeInterval:kUpdatePageInterval target:self selector:@selector(searchResultViewloadMoreData) userInfo:nil repeats:YES]);
}
    
    
- (void)searchResultViewloadMoreData
{
    
//%orig;
    
    
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
        
        
        
        
        
        //把本地没有的数据发送到企业端，并保存本次数据，仅本地配置字段
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

@end
