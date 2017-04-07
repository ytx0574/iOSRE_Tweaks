//
//  ViewController.h
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/23.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/message.h>

//@interface NSObject (Runtime)
//
//+ (NSArray *)runtimeProperties;
//
//+ (NSString *)formattedPropery:(objc_property_t)prop;
//@end
//
//@interface NSString (Runtime)
//
//+ (NSString *)decodeType:(const char *)cString;
//
//@end


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



@interface ViewController : UIViewController


@end

