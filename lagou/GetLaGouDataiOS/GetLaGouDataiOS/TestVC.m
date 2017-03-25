//
//  TestVC.m
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/24.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import "TestVC.h"
#import "NSObject+MJKeyValue.h"
#import "Header.h"


@implementation LGChatSession

@end

@implementation LGSearchViewController
- (void)searchWithKeyword:(id)arg1;
{
    NSLog(@"当前关键字为： %@", arg1);
}
@end

@implementation LGSearchResultViewController

@end

@implementation LGChatBaseViewController

- (void)conductViewSendMessageWithText:(id)arg1;
{
    NSLog(@"获取到新数据  自动发送消息");
}

+ (id)initializeWithSession:(id)arg1;
{
    return [[self alloc] init];
}

@end




@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    LGChatSession *tlgSession = [[LGChatSession alloc] init];
    tlgSession.sessionId = 4503599628761338;
//
//    
//    
//    [NSHomeDirectory() stringByAppendingString:lgSessionPath];
//    
//    
//    BOOL flag = [NSKeyedArchiver archiveRootObject:[tlgSession mj_JSONObject] toFile:LgSessionPath];
//
//    [[NSFileManager defaultManager] removeItemAtPath:LgSessionPath error:nil];
//    
//    LGChatSession *lg = [LGChatSession mj_objectWithKeyValues:[NSKeyedUnarchiver unarchiveObjectWithFile:LgSessionPath]];
//    
//    
//    
//    
//    
//    
//    LGSearchViewController *vc = [[NSClassFromString(@"LGSearchViewController") alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [vc searchWithKeyword:@"iOS"];
//    });
//    
//
//    
//    NSClassFromString(@"LGChatBaseViewController");
    
    
    
    
//    LGChatSession *lgSession = [LGChatSession mj_objectWithKeyValues:[NSKeyedUnarchiver unarchiveObjectWithFile:LgSessionPath]];
//    
//    if (lgSession == nil) {
//        [[[UIAlertView alloc] initWithTitle:nil message:@"当前聊天对象不存在" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
//    }else {
//        LGChatBaseViewController *chatVC = [NSClassFromString(@"LGChatBaseViewController") initializeWithSession:lgSession];
//        objc_setAssociatedObject(self, &ChatVC_Key, chatVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [chatVC conductViewSendMessageWithText:@"555555555555555555555555"];
//        });
//    }
    
    
    
    
    
    
//    LGSearchResultViewController *vc = [NSClassFromString(@"LGSearchResultViewController") initializeWithPreViewController: searchKeyword:@"iOS"];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
