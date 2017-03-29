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

@interface LGJobListItemModel : NSObject
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
        [[[UIAlertView alloc] initWithTitle:nil message:@"分页时间太长。。。不对称" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
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
        
        
        
        //内部对象对NSNumber
        NSMutableArray *arrayLocalRecord = [NSKeyedUnarchiver unarchiveObjectWithFile:LgJobListPath];
        
        //如果内部对象不是NSNumer 则移除本地保存内容
        if (![arrayLocalRecord.firstObject isKindOfClass:[NSNumber class]]  && arrayLocalRecord) {
            
            [[NSFileManager defaultManager] removeItemAtPath:LgJobListPath error:nil];
            [arrayLocalRecord removeAllObjects];
        }
        
        //如果本地没有记录， 则初始化
        if (arrayLocalRecord == nil) {
            arrayLocalRecord = [NSMutableArray array];
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
            [arrayLocalRecord addObjectsFromArray:@[@(a.companyId), @(b.companyId), @(c.companyId)]];
            
            [[wself resultArray] removeAllObjects];
            [[wself resultArray] addObjectsFromArray:@[aa, bb, cc, dd]];
        };
        
        if (kUseAnalogData) { analogData(); }
    
    
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
        
    
        //取出本地没有记录的数据
        NSMutableArray *arrayNotInLocalData = [NSMutableArray array];
        
        [JSONResultArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSNumber *companyId = [[arrayLocalRecord filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
                return [evaluatedObject integerValue] == [obj[@"companyId"] integerValue];
            }]] firstObject];
            
            //如果本地没有, 则取出没有的数据，并添加本地记录
            if (companyId == nil) {
                [arrayLocalRecord addObject:obj[@"companyId"]];
                [arrayNotInLocalData addObject:obj];
            }
            
        }];
        
        
        
        
        
        //把本地没有的数据发送到企业端，并把companyId保存到本地进行记录
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [NSKeyedArchiver archiveRootObject:arrayLocalRecord toFile:LgJobListPath];
        });
        
        if (arrayNotInLocalData.count > 0) {
            NSLog(@"------o-------拉钩：  输出与上次不一样的数据%@", arrayNotInLocalData);
            
            [arrayNotInLocalData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
//                NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
//                [dateFormater setDateFormat:@"yyyy-MM-dd"];
//                NSString *currentDateString = [dateFormater stringFromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60 * 8]];
//
//                //只发送首发招聘 (筛选出的数据有很多不是当日发布)
//                if ([obj[@"createTime"] hasPrefix:currentDateString]) {
                
                if (isSendMsg) {
                    [GetChatVC conductViewSendMessageWithText:[NSString stringWithCString:[[obj description] cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding]];
                }
                
//                }
                
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
