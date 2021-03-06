//
//  LGJobListHomeViewController.m
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/25.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import "LGJobListHomeViewController.h"
#import "TestVC.h"
#import "Test1VC.h"
#import "Header.h"
#import <objc/runtime.h>
#import "NSObject+MJKeyValue.h"
#import "ViewController.h"

@interface LGJobListHomeViewController ()

@end

@implementation LGJobListHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //%orig;
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"===========" forState:UIControlStateNormal];
    btn.frame = CGRectMake(55, 333, 111, 40);
//    [self.view addSubview:btn];
    
    
    
    //本地创建配置表， 可更改。。。
    NSLog(@"------o-------拉钩：  搜索内容及时间可在本地进行修改 /Documents/lgConfig.plist");
    if (![[NSFileManager defaultManager] fileExistsAtPath:LgConfigPath]) {
        
        [@{
          @"kKeyword" : @"iOS",
          @"kUseAnalogData" : @(NO),
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
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









- (void)appleButtonClick
{
    UIWindow *window = [self.view viewWithTag:357];
    window.hidden = !window.hidden;
}

- (void)moveTest:(UIGestureRecognizer *)gestureRecognizer
{
    gestureRecognizer.view.center = [gestureRecognizer locationInView:[[[UIApplication sharedApplication] delegate] window]];
}


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

@end
